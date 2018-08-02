package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.dto.MatchDTO;
import com.epam.epmrduaqgv.back.dto.PlayerDTO;
import com.epam.epmrduaqgv.back.dto.QuestionDTO;
import com.epam.epmrduaqgv.back.dto.RoundDTO;
import com.epam.epmrduaqgv.back.entity.*;
import com.epam.epmrduaqgv.back.model.RoundState;
import com.epam.epmrduaqgv.back.repository.MatchRepository;
import com.epam.epmrduaqgv.back.repository.PlayerRepository;
import com.epam.epmrduaqgv.back.repository.RoundQuestionRepository;
import com.epam.epmrduaqgv.back.repository.RoundRepository;
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
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

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
    private ObjectMapper objectMapper;

    @Value("${questions_in_round}")
    private Integer questionsInRound;

    @Value("${rounds_in_match}")
    private Integer roundsInMatch;

    @Value("${players_in_match}")
    private Integer playersInMatch;

    @Transactional
    @Override
    public MatchDTO createMatch(String userId) {
        MatchEntity matchEntity = MatchEntity.builder()
                .build();
        matchEntity = matchRepository.save(matchEntity);

        PlayerEntity playerEntity = PlayerEntity.builder()
                .userId(userId)
                .matchId(matchEntity.getId())
                .playerNumber(1)
                .build();
        playerRepository.save(playerEntity);

        MatchDTO matchDTO = objectMapper.convertValue(matchEntity, MatchDTO.class);
        matchDTO.setPlayers(Collections.singletonList(objectMapper.convertValue(playerEntity, PlayerDTO.class)));
        matchDTO.setShouldStartRound(true);
        return matchDTO;
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
