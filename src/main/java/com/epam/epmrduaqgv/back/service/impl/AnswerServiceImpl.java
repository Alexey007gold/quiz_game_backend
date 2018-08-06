package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.*;
import com.epam.epmrduaqgv.back.model.MatchState;
import com.epam.epmrduaqgv.back.model.RoundState;
import com.epam.epmrduaqgv.back.repository.*;
import com.epam.epmrduaqgv.back.service.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.List;

@Service
public class AnswerServiceImpl implements AnswerService {

    @Autowired
    private AnswerRepository answerRepository;

    @Autowired
    private MatchRepository matchRepository;

    @Autowired
    private RoundRepository roundRepository;

    @Autowired
    private PlayerRepository playerRepository;

    @Autowired
    private PlayersAnswersRepository playersAnswersRepository;

    @Autowired
    private RoundScoresRepository roundScoresRepository;

    @Value("${questions_in_round}")
    private Integer questionsInRound;

    @Value("${rounds_in_match}")
    private Integer roundsInMatch;

    @Value("${players_in_match}")
    private Integer playersInMatch;

    @Value("${score_for_answer}")
    private Integer scoreForAnswer;

    @Override
    public List<AnswerEntity> findByQuestionId(String questionId) {
        return answerRepository.findByQuestionId(questionId);
    }

    @Transactional
    @Override
    public void saveAnswer(String userId, String roundId, String questionId, String answerId) {
        PlayerEntity playerEntity = playerRepository.findByRoundIdAndUserId(roundId, userId);
        if (playerEntity == null) {
            throw new IllegalStateException("No round was found for given user");
        }

        AnswerEntity answerEntity = answerRepository.findById(answerId)
                .orElseThrow(() -> new IllegalArgumentException("Answer id was not found"));
        if (!answerEntity.getQuestionId().equals(questionId)) {
            throw new IllegalArgumentException("The question has no answer with such id");
        }
        MatchState matchState = matchRepository.getMatchStateByRoundId(roundId);
        if (matchState.equals(MatchState.FINISHED)) {
            throw new IllegalStateException("Match is already finished. Probably you time is out");
        }

        PlayersAnswersEntity playersAnswersEntity = PlayersAnswersEntity.builder()
                .roundId(roundId)
                .questionId(questionId)
                .answerId(answerId)
                .build();
        playersAnswersRepository.save(playersAnswersEntity);

        playerEntity.setLastActivityAt(Instant.now());
        playerRepository.save(playerEntity);

        if (answerEntity.isCorrect()) {
            updateScore(roundId, playerEntity.getId());
        }

        RoundState state = checkRoundState(roundId);
        if (state.equals(RoundState.FINISHED)) {
            checkMatchState(roundId);
        }
    }

    private void updateScore(String roundId, String playerId) {
        int result = roundScoresRepository.updateScore(roundId, playerId, scoreForAnswer);
        if (result > 1) {
            throw new IllegalStateException("DB error");
        } else if (result == 0) {
            roundScoresRepository.save(RoundScoresEntity.builder()
                    .roundId(roundId)
                    .playerId(playerId)
                    .score(scoreForAnswer)
                    .build());
        }
    }

    private RoundState checkRoundState(String roundId) {
        List<PlayersAnswersEntity> roundAnswers = playersAnswersRepository.findByRoundId(roundId);
        int result = 1;
        RoundState state = RoundState.IN_PROGRESS;
        if (roundAnswers.size() == playersInMatch * questionsInRound) {
            state = RoundState.FINISHED;
            result = roundRepository.updateRoundState(roundId, state);
        } else if (roundAnswers.size() == 1) {
            result = roundRepository.updateRoundState(roundId, state);
        }
        if (result != 1) {
            throw new IllegalStateException("DB error");
        }
        return state;
    }

    private void checkMatchState(String roundId) {
        List<RoundEntity> rounds = roundRepository.findAllMatchRoundsByRoundId(roundId, Sort.unsorted());
        if (rounds.size() == roundsInMatch) {
            matchRepository.updateMatchState(rounds.get(0).getMatchId(), MatchState.FINISHED);
        }
    }
}
