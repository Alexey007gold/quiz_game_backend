package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.*;
import com.epam.epmrduaqgv.back.model.MatchState;
import com.epam.epmrduaqgv.back.model.RoundState;
import com.epam.epmrduaqgv.back.repository.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.data.domain.Sort;
import org.springframework.test.util.ReflectionTestUtils;

import java.time.Instant;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class AnswerServiceImplTest {

    @InjectMocks
    private AnswerServiceImpl answerService;

    @Mock
    private MatchRepository matchRepository;

    @Mock
    private RoundRepository roundRepository;

    @Mock
    private PlayerRepository playerRepository;

    @Mock
    private AnswerRepository answerRepository;

    @Mock
    private PlayersAnswersRepository playersAnswersRepository;

    @Mock
    private RoundScoresRepository roundScoresRepository;

    private Integer questionsInRound;

    private Integer roundsInMatch;

    private Integer playersInMatch;

    private Integer scoreForAnswer;

    @Before
    public void setUp() {
        questionsInRound = 5;
        roundsInMatch = 5;
        playersInMatch = 3;
        scoreForAnswer = 3;
        ReflectionTestUtils.setField(answerService, "questionsInRound", questionsInRound);
        ReflectionTestUtils.setField(answerService, "roundsInMatch", roundsInMatch);
        ReflectionTestUtils.setField(answerService, "playersInMatch", playersInMatch);
        ReflectionTestUtils.setField(answerService, "scoreForAnswer", scoreForAnswer);
    }

    @Test
    public void shouldDelegateToRepositoryOnFindByQuestionId() {
        String questionId = "some id";
        AnswerEntity answerEntity = getAnswerEntity();
        List<AnswerEntity> entityList = Collections.singletonList(answerEntity);
        when(answerRepository.findByQuestionId(questionId)).thenReturn(entityList);

        List<AnswerEntity> result = answerService.findByQuestionId(questionId);

        verify(answerRepository).findByQuestionId(questionId);
        assertEquals(entityList, result);
    }

    @Test(expected = IllegalStateException.class)
    public void shouldThrowAnExceptionOnSaveAnswer1() {
        String userId = "some user id";
        String roundId = "some round id";
        String questionId = "some question id";
        String answerId = "some answer id";

        try {
            answerService.saveAnswer(userId, roundId, questionId, answerId);
        } catch (IllegalStateException e) {
            verify(playerRepository).findByRoundIdAndUserId(roundId, userId);
            verify(answerRepository, never()).findById(any());
            verify(matchRepository, never()).getMatchStateByRoundId(roundId);
            verify(playerRepository, never()).save(any());
            throw e;
        }
    }

    @Test(expected = IllegalArgumentException.class)
    public void shouldThrowAnExceptionOnSaveAnswer2() {
        String userId = "some user id";
        String roundId = "some round id";
        String questionId = "some question id";
        String answerId = "some answer id";
        String playerId = "some player id";

        when(playerRepository.findByRoundIdAndUserId(roundId, userId)).thenReturn(PlayerEntity.builder()
                .id(playerId)
                .build());
        when(answerRepository.findById(answerId)).thenReturn(Optional.of(AnswerEntity.builder()
                .correct(true)
                .questionId("another question id")
                .build()));

        try {
            answerService.saveAnswer(userId, roundId, questionId, answerId);
        } catch (IllegalArgumentException e) {
            verify(playerRepository).findByRoundIdAndUserId(roundId, userId);
            verify(answerRepository).findById(answerId);
            verify(matchRepository, never()).getMatchStateByRoundId(roundId);
            verify(playersAnswersRepository, never()).save(any());
            verify(playerRepository, never()).save(any());
            throw e;
        }
    }

    @Test(expected = IllegalArgumentException.class)
    public void shouldThrowAnExceptionOnSaveAnswer3() {
        String userId = "some user id";
        String roundId = "some round id";
        String questionId = "some question id";
        String answerId = "some answer id";
        String playerId = "some player id";

        when(playerRepository.findByRoundIdAndUserId(roundId, userId)).thenReturn(PlayerEntity.builder()
                .id(playerId)
                .build());

        try {
            answerService.saveAnswer(userId, roundId, questionId, answerId);
        } catch (IllegalArgumentException e) {
            verify(playerRepository).findByRoundIdAndUserId(roundId, userId);
            verify(answerRepository).findById(answerId);
            verify(matchRepository, never()).getMatchStateByRoundId(roundId);
            verify(playersAnswersRepository, never()).save(any());
            verify(playerRepository, never()).save(any());
            throw e;
        }
    }

    @Test(expected = IllegalStateException.class)
    public void shouldThrowAnExceptionOnSaveAnswer4() {
        String userId = "some user id";
        String roundId = "some round id";
        String questionId = "some question id";
        String answerId = "some answer id";
        String playerId = "some player id";

        when(playerRepository.findByRoundIdAndUserId(roundId, userId)).thenReturn(PlayerEntity.builder()
                .id(playerId)
                .build());
        when(answerRepository.findById(answerId)).thenReturn(Optional.of(AnswerEntity.builder()
                .correct(false)
                .questionId(questionId)
                .build()));
        when(matchRepository.getMatchStateByRoundId(roundId)).thenReturn(MatchState.FINISHED);

        try {
            answerService.saveAnswer(userId, roundId, questionId, answerId);
        } catch (IllegalArgumentException e) {
            verify(playerRepository).findByRoundIdAndUserId(roundId, userId);
            verify(answerRepository).findById(answerId);
            verify(matchRepository).getMatchStateByRoundId(roundId);
            verify(playersAnswersRepository, never()).save(any());
            verify(playerRepository, never()).save(any());
            throw e;
        }
    }

    @Test
    public void shouldNotUpdateScoresOnSaveAnswer() {
        String userId = "some user id";
        String roundId = "some round id";
        String questionId = "some question id";
        String answerId = "some answer id";
        String playerId = "some player id";

        when(playerRepository.findByRoundIdAndUserId(roundId, userId)).thenReturn(PlayerEntity.builder()
                .id(playerId)
                .lastActivityAt(Instant.ofEpochSecond(555555))
                .build());
        when(answerRepository.findById(answerId)).thenReturn(Optional.of(AnswerEntity.builder()
                .correct(false)
                .questionId(questionId)
                .build()));
        when(matchRepository.getMatchStateByRoundId(roundId)).thenReturn(MatchState.IN_PROGRESS);

        answerService.saveAnswer(userId, roundId, questionId, answerId);

        ArgumentCaptor<PlayersAnswersEntity> playersAnswersEntityArgumentCaptor =
                ArgumentCaptor.forClass(PlayersAnswersEntity.class);
        ArgumentCaptor<PlayerEntity> playerEntityArgumentCaptor =
                ArgumentCaptor.forClass(PlayerEntity.class);
        verify(playerRepository).findByRoundIdAndUserId(roundId, userId);
        verify(answerRepository).findById(answerId);
        verify(matchRepository).getMatchStateByRoundId(roundId);
        verify(playersAnswersRepository).save(playersAnswersEntityArgumentCaptor.capture());
        verify(playerRepository).save(playerEntityArgumentCaptor.capture());
        verify(roundScoresRepository, never()).updateScore(any(), any(), anyInt());

        PlayersAnswersEntity playersAnswersEntityArgumentValue = playersAnswersEntityArgumentCaptor.getValue();
        PlayerEntity playerEntityArgumentValue = playerEntityArgumentCaptor.getValue();

        assertEquals(playerId, playersAnswersEntityArgumentValue.getPlayerId());
        assertEquals(roundId, playersAnswersEntityArgumentValue.getRoundId());
        assertEquals(questionId, playersAnswersEntityArgumentValue.getQuestionId());
        assertEquals(answerId, playersAnswersEntityArgumentValue.getAnswerId());
        assertNotEquals(Instant.ofEpochSecond(555555), playerEntityArgumentValue.getLastActivityAt());
    }

    @Test
    public void shouldSaveNewScoresOnSaveAnswer() {
        String userId = "some user id";
        String roundId = "some round id";
        String questionId = "some question id";
        String answerId = "some answer id";
        String playerId = "some player id";

        when(playerRepository.findByRoundIdAndUserId(roundId, userId)).thenReturn(PlayerEntity.builder()
                .id(playerId)
                .build());
        when(answerRepository.findById(answerId)).thenReturn(Optional.of(AnswerEntity.builder()
                .correct(true)
                .questionId(questionId)
                .build()));
        when(matchRepository.getMatchStateByRoundId(roundId)).thenReturn(MatchState.IN_PROGRESS);

        answerService.saveAnswer(userId, roundId, questionId, answerId);

        ArgumentCaptor<RoundScoresEntity> roundScoresEntityArgumentCaptor =
                ArgumentCaptor.forClass(RoundScoresEntity.class);
        verify(roundScoresRepository).updateScore(roundId, playerId, scoreForAnswer);
        verify(roundScoresRepository).save(roundScoresEntityArgumentCaptor.capture());

        RoundScoresEntity roundScoresEntityArgumentValue = roundScoresEntityArgumentCaptor.getValue();

        assertEquals(3, (int) roundScoresEntityArgumentValue.getScore());
    }

    @Test
    public void shouldUpdateScoresOnSaveAnswer() {
        String userId = "some user id";
        String roundId = "some round id";
        String questionId = "some question id";
        String answerId = "some answer id";
        String playerId = "some player id";

        when(playerRepository.findByRoundIdAndUserId(roundId, userId)).thenReturn(PlayerEntity.builder()
                .id(playerId)
                .build());
        when(answerRepository.findById(answerId)).thenReturn(Optional.of(AnswerEntity.builder()
                .correct(true)
                .questionId(questionId)
                .build()));
        when(matchRepository.getMatchStateByRoundId(roundId)).thenReturn(MatchState.IN_PROGRESS);
        when(roundScoresRepository.updateScore(roundId, playerId, scoreForAnswer)).thenReturn(1);

        answerService.saveAnswer(userId, roundId, questionId, answerId);

        verify(roundScoresRepository).updateScore(roundId, playerId, scoreForAnswer);
        verify(roundScoresRepository, never()).save(any());
    }

    @Test
    public void shouldUpdateRoundStateOnSaveAnswer() {
        String userId = "some user id";
        String roundId = "some round id";
        String questionId = "some question id";
        String answerId = "some answer id";
        String playerId = "some player id";

        when(playerRepository.findByRoundIdAndUserId(roundId, userId)).thenReturn(PlayerEntity.builder()
                .id(playerId)
                .build());
        when(answerRepository.findById(answerId)).thenReturn(Optional.of(AnswerEntity.builder()
                .correct(false)
                .questionId(questionId)
                .build()));
        when(matchRepository.getMatchStateByRoundId(roundId)).thenReturn(MatchState.IN_PROGRESS);
        when(playersAnswersRepository.findByRoundId(roundId)).thenReturn(getMocksList(PlayersAnswersEntity.class, 1));
        when(roundRepository.updateRoundState(roundId, RoundState.IN_PROGRESS)).thenReturn(1);

        answerService.saveAnswer(userId, roundId, questionId, answerId);

        verify(playersAnswersRepository).findByRoundId(roundId);
        verify(roundRepository).updateRoundState(roundId, RoundState.IN_PROGRESS);
        verify(roundRepository, never()).findAllMatchRoundsByRoundId(roundId, Sort.unsorted());
        verify(matchRepository, never()).updateMatchState(any(String.class), any());
    }

    @Test
    public void shouldNotUpdateRoundStateOnSaveAnswer() {
        String userId = "some user id";
        String roundId = "some round id";
        String questionId = "some question id";
        String answerId = "some answer id";
        String playerId = "some player id";

        when(playerRepository.findByRoundIdAndUserId(roundId, userId)).thenReturn(PlayerEntity.builder()
                .id(playerId)
                .build());
        when(answerRepository.findById(answerId)).thenReturn(Optional.of(AnswerEntity.builder()
                .correct(false)
                .questionId(questionId)
                .build()));
        when(matchRepository.getMatchStateByRoundId(roundId)).thenReturn(MatchState.IN_PROGRESS);
        when(playersAnswersRepository.findByRoundId(roundId)).thenReturn(getMocksList(PlayersAnswersEntity.class, 2));

        answerService.saveAnswer(userId, roundId, questionId, answerId);

        verify(playersAnswersRepository).findByRoundId(roundId);
        verify(roundRepository, never()).updateRoundState(any(), any());
        verify(roundRepository, never()).findAllMatchRoundsByRoundId(roundId, Sort.unsorted());
        verify(matchRepository, never()).updateMatchState(any(String.class), any());
    }

    @Test
    public void shouldUpdateRoundStateAndNotUpdateMatchStateOnSaveAnswer() {
        String userId = "some user id";
        String roundId = "some round id";
        String questionId = "some question id";
        String answerId = "some answer id";
        String playerId = "some player id";

        when(playerRepository.findByRoundIdAndUserId(roundId, userId)).thenReturn(PlayerEntity.builder()
                .id(playerId)
                .build());
        when(answerRepository.findById(answerId)).thenReturn(Optional.of(AnswerEntity.builder()
                .correct(false)
                .questionId(questionId)
                .build()));
        when(matchRepository.getMatchStateByRoundId(roundId)).thenReturn(MatchState.IN_PROGRESS);
        when(playersAnswersRepository.findByRoundId(roundId))
                .thenReturn(getMocksList(PlayersAnswersEntity.class, playersInMatch * questionsInRound));
        when(roundRepository.updateRoundState(roundId, RoundState.FINISHED)).thenReturn(1);
        when(roundRepository.findAllMatchRoundsByRoundId(roundId, Sort.unsorted()))
                .thenReturn(getMocksList(RoundEntity.class, 1));

        answerService.saveAnswer(userId, roundId, questionId, answerId);

        verify(playersAnswersRepository).findByRoundId(roundId);
        verify(roundRepository).updateRoundState(roundId, RoundState.FINISHED);
        verify(roundRepository).findAllMatchRoundsByRoundId(roundId, Sort.unsorted());
        verify(matchRepository, never()).updateMatchState(any(String.class), any());
    }

    @Test
    public void shouldUpdateRoundStateAndUpdateMatchStateOnSaveAnswer() {
        String userId = "some user id";
        String roundId = "some round id";
        String questionId = "some question id";
        String answerId = "some answer id";
        String playerId = "some player id";
        String matchId = "some match id";

        when(playerRepository.findByRoundIdAndUserId(roundId, userId)).thenReturn(PlayerEntity.builder()
                .id(playerId)
                .build());
        when(answerRepository.findById(answerId)).thenReturn(Optional.of(AnswerEntity.builder()
                .correct(false)
                .questionId(questionId)
                .build()));
        when(matchRepository.getMatchStateByRoundId(roundId)).thenReturn(MatchState.IN_PROGRESS);
        when(playersAnswersRepository.findByRoundId(roundId))
                .thenReturn(getMocksList(PlayersAnswersEntity.class, playersInMatch * questionsInRound));
        when(roundRepository.updateRoundState(roundId, RoundState.FINISHED)).thenReturn(1);
        when(roundRepository.findAllMatchRoundsByRoundId(roundId, Sort.unsorted()))
                .thenReturn(getRoundEntityList(roundsInMatch, matchId));

        answerService.saveAnswer(userId, roundId, questionId, answerId);

        verify(playersAnswersRepository).findByRoundId(roundId);
        verify(roundRepository).updateRoundState(roundId, RoundState.FINISHED);
        verify(roundRepository).findAllMatchRoundsByRoundId(roundId, Sort.unsorted());
        verify(matchRepository).updateMatchState(matchId, MatchState.FINISHED);
    }

    private AnswerEntity getAnswerEntity() {
        return AnswerEntity.builder()
                .value("answer")
                .correct(true)
                .build();
    }

    private List<RoundEntity> getRoundEntityList(int quantity, String matchId) {
        List<RoundEntity> result = new ArrayList<>();
        for (int i = 0; i < quantity; i++) {
            result.add(RoundEntity.builder()
                    .matchId(matchId)
                    .build());
        }
        return result;
    }

    private <T> List<T> getMocksList(Class<T> clazz, int quantity) {
        List<T> questionDTOList = new ArrayList<>(quantity);
        for (int i = 0; i < quantity; i++) {
            questionDTOList.add(mock(clazz));
        }
        return questionDTOList;
    }
}