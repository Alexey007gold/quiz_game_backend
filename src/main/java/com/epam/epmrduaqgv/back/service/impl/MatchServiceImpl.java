package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.dto.MatchDTO;
import com.epam.epmrduaqgv.back.dto.PlayerDTO;
import com.epam.epmrduaqgv.back.dto.QuestionDTO;
import com.epam.epmrduaqgv.back.dto.RoundDTO;
import com.epam.epmrduaqgv.back.entity.*;
import com.epam.epmrduaqgv.back.model.MatchState;
import com.epam.epmrduaqgv.back.model.RoundState;
import com.epam.epmrduaqgv.back.repository.*;
import com.epam.epmrduaqgv.back.service.MatchService;
import com.epam.epmrduaqgv.back.service.QuestionService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import static com.epam.epmrduaqgv.back.model.MatchState.FINISHED;

@Service
public class MatchServiceImpl implements MatchService {

    @Autowired
    private MatchRepository matchRepository;

    @Autowired
    private RoundRepository roundRepository;

    @Autowired
    private PlayerRepository playerRepository;

    @Autowired
    private QuestionService inMemoryQuestionServiceImpl;

    @Autowired
    private RoundQuestionRepository roundQuestionRepository;

    @Autowired
    private RoundScoresRepository roundScoresRepository;

    @Autowired
    private ObjectMapper objectMapper;

    @Value("${questions_in_round}")
    private Integer questionsInRound;

    @Value("${rounds_in_match}")
    private Integer roundsInMatch;

    @Value("${players_in_match}")
    private Integer playersInMatch;

    @Value("${max_matches_in_progress}")
    private Integer maxMatchesInProgress;

    @Value("${max_player_inactivity_ms}")
    private Integer maxPlayerInactivityMs;

    @Transactional(isolation = Isolation.SERIALIZABLE)
    @Override
    public MatchDTO getMatchForUser(String userId) {
        checkIfCanAddMatch(userId);

        MatchEntity matchEntity;
        List<PlayerEntity> playerEntityList;
        int newPlayerNumber = 1;

        List<MatchEntity> matches = matchRepository
                .findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId((long) playersInMatch, userId);
        if (!matches.isEmpty()) {
            matchEntity = matches.get(0);
            playerEntityList = new ArrayList<>(matchEntity.getPlayers());
            newPlayerNumber += playerEntityList.size();
            if (newPlayerNumber == playersInMatch) {
                matchEntity.setMatchState(MatchState.IN_PROGRESS);
                matchEntity.setUpdatedAt(Instant.now());
            }
        } else {
            Instant now = Instant.now();
            matchEntity = MatchEntity.builder()
                    .createdAt(now)
                    .updatedAt(now)
                    .build();
            playerEntityList = new ArrayList<>();
        }
        matchEntity = matchRepository.save(matchEntity);

        PlayerEntity playerEntity = playerRepository.save(PlayerEntity.builder()
                .userId(userId)
                .matchId(matchEntity.getId())
                .playerNumber(newPlayerNumber)
                .build());
        playerEntityList.add(playerEntity);

        MatchDTO matchDTO = objectMapper.convertValue(matchEntity, MatchDTO.class);
        matchDTO.setPlayers(objectMapper.convertValue(playerEntityList, new TypeReference<List<PlayerDTO>>() {}));
        matchDTO.setShouldStartRound(matches.isEmpty());
        return matchDTO;
    }

    private void checkIfCanAddMatch(String userId) {
        List<MatchEntity> match = matchRepository.findByPlayerWithUserIdAndMatchStateNot(userId, FINISHED);
        if (match.size() == maxMatchesInProgress) {
            throw new IllegalStateException("You have reached the limit of matches in progress");
        }
    }

    @Transactional
    @Override
    public RoundDTO createRound(String userId, String matchId, String topicId) {
        MatchEntity matchEntity = matchRepository.findById(matchId)
                .orElseThrow(() -> new IllegalArgumentException("Match not found"));
        checkIfUserCanCreateRound(userId, matchEntity);

        RoundEntity roundEntity = RoundEntity.builder()
                .matchId(matchId)
                .topicId(topicId)
                .build();
        roundRepository.save(roundEntity);

        List<QuestionEntity> questions = inMemoryQuestionServiceImpl.findRandomQuestionsByTopicId(topicId, questionsInRound);
        List<RoundQuestionEntity> roundQuestionEntityList = questions.stream()
                .map(questionEntity -> RoundQuestionEntity.builder()
                        .roundId(roundEntity.getId())
                        .question(questionEntity)
                        .build())
                .collect(Collectors.toList());
        roundQuestionRepository.saveAll(roundQuestionEntityList);

        return createRoundDTO(roundEntity, questions);
    }

    @Override
    public Page<MatchEntity> getMatchesByUserId(String userId, int page, int pageSize) {
        PageRequest pageRequest = PageRequest.of(page, pageSize, Sort.Direction.DESC, "updatedAt");
        return matchRepository.findByPlayerWithUserId(userId, pageRequest);
    }

    @Override
    public List<RoundDTO> getRoundsByMatchId(String matchId) {
        Sort sort = new Sort(Sort.Direction.ASC, "createdAt");
        List<RoundEntity> roundEntityList = roundRepository.findByMatchId(matchId, sort);
        return createRoundDTOS(roundEntityList);
    }

    @Override
    public boolean shouldUserStartRound(String userId, MatchEntity matchEntity) {
        List<RoundEntity> rounds = matchEntity.getRounds();
        if (rounds.size() >= roundsInMatch) {
            return false;
        }
        if (!rounds.isEmpty() && !rounds.get(rounds.size() - 1).getRoundState().equals(RoundState.FINISHED)) {
            return false;
        }
        int nextRoundCreatorPlayerIdx = rounds.size() % playersInMatch;
        return matchEntity.getPlayers().get(nextRoundCreatorPlayerIdx).getUserId().equals(userId);
    }

    @Override
    public void finishAllInactiveMatches() {
        List<MatchEntity> matchesToFinish = matchRepository
                .findMatchesInProgressWhereLastActivityDifferenceIsMoreThan(maxPlayerInactivityMs);
        finishMatches(matchesToFinish);
    }

    @Override
    public void finishInactiveMatchesForUser(String userId) {
        List<MatchEntity> matchesToFinish = matchRepository
                .findMatchesInProgressByUserIdWhereLastActivityDifferenceIsMoreThan(userId, maxPlayerInactivityMs);
        finishMatches(matchesToFinish);
    }

    private void finishMatches(List<MatchEntity> matchesToFinish) {
        List<String> idsOfMatchesToUpdate = new ArrayList<>(matchesToFinish.size());
        List<String> idsOfPlayersToUpdate = new ArrayList<>(matchesToFinish.size());
        for (MatchEntity matchEntity : matchesToFinish) {
            idsOfMatchesToUpdate.add(matchEntity.getId());
            matchEntity.getPlayers().stream()
                    .min(Comparator.comparing(PlayerEntity::getLastActivityAt))
                    .ifPresent(p -> idsOfPlayersToUpdate.add(p.getId()));
        }
        roundScoresRepository.updateScoreByPlayerIdToZero(idsOfPlayersToUpdate);
        matchRepository.updateMatchState(idsOfMatchesToUpdate, FINISHED);
    }


    private void checkIfUserCanCreateRound(String userId, MatchEntity matchEntity) {
        List<RoundEntity> rounds = matchEntity.getRounds();
        if (rounds.size() >= roundsInMatch) {
            throw new IllegalStateException("No more rounds can be created for this match");
        }
        if (!rounds.isEmpty() && !rounds.get(rounds.size() - 1).getRoundState().equals(RoundState.FINISHED)) {
            throw new IllegalStateException("Previous round is not finished yet");
        }
        int nextRoundCreatorPlayerIdx = rounds.size() % playersInMatch;
        if (!matchEntity.getPlayers().get(nextRoundCreatorPlayerIdx).getUserId().equals(userId)) {
            throw new IllegalStateException("It's not your turn to create round now");
        }
    }



    /*Mapping methods*/

    private List<RoundDTO> createRoundDTOS(List<RoundEntity> roundEntityList) {
        return roundEntityList.stream()
                .map(roundEntity -> {
                    List<QuestionDTO> questionDTOList = createQuestionDTOS(roundEntity);
                    RoundDTO roundDTO = objectMapper.convertValue(roundEntity, RoundDTO.class);
                    roundDTO.setQuestions(questionDTOList);
                    return roundDTO;
                }).collect(Collectors.toList());
    }

    private List<QuestionDTO> createQuestionDTOS(RoundEntity roundEntity) {
        return roundEntity.getQuestions().stream()
                .map(rq -> {
                    QuestionDTO questionDTO = objectMapper.convertValue(rq.getQuestion(), QuestionDTO.class);
                    questionDTO.setTopicId(rq.getQuestion().getTopicEntity().getId());
                    return questionDTO;
                })
                .collect(Collectors.toList());
    }

    private RoundDTO createRoundDTO(RoundEntity roundEntity, List<QuestionEntity> questionEntities) {
        List<QuestionDTO> questionDTOList = createQuestionDTOS(questionEntities);
        RoundDTO roundDTO = objectMapper.convertValue(roundEntity, RoundDTO.class);
        roundDTO.setQuestions(questionDTOList);
        return roundDTO;
    }

    private List<QuestionDTO> createQuestionDTOS(List<QuestionEntity> questionEntities) {
        List<QuestionDTO> questionDTOS = objectMapper.convertValue(questionEntities, new TypeReference<List<QuestionDTO>>() {});
        for (int i = 0; i < questionDTOS.size(); i++) {
            questionDTOS.get(i).setTopicId(questionEntities.get(i).getTopicEntity().getId());
        }
        return questionDTOS;
    }
}
