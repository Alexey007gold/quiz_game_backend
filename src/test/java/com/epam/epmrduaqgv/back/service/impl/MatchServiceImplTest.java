package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.dto.MatchDTO;
import com.epam.epmrduaqgv.back.dto.QuestionDTO;
import com.epam.epmrduaqgv.back.entity.*;
import com.epam.epmrduaqgv.back.model.MatchState;
import com.epam.epmrduaqgv.back.model.RoundState;
import com.epam.epmrduaqgv.back.repository.*;
import com.epam.epmrduaqgv.back.service.QuestionService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.test.util.ReflectionTestUtils;

import java.time.Instant;
import java.util.*;

import static com.epam.epmrduaqgv.back.model.RoundState.FINISHED;
import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class MatchServiceImplTest {

    private static final String MATCH_ID = "some match id";

    @InjectMocks
    private MatchServiceImpl matchService;

    @Mock
    private MatchRepository matchRepository;

    @Mock
    private RoundRepository roundRepository;

    @Mock
    private PlayerRepository playerRepository;

    @Mock
    private QuestionService questionService;

    @Mock
    private RoundQuestionRepository roundQuestionRepository;

    @Mock
    private RoundScoresRepository roundScoresRepository;

    @Mock
    private ObjectMapper objectMapper;

    private Integer questionsInRound;

    private Integer roundsInMatch;

    private Integer playersInMatch;

    private Integer maxMatchesInProgress;

    private Integer maxPlayerInactivityMs;


    @Before
    public void setUp() {
        questionsInRound = 5;
        roundsInMatch = 5;
        playersInMatch = 3;
        maxMatchesInProgress = 5;
        maxPlayerInactivityMs = 300000;
        ReflectionTestUtils.setField(matchService, "questionsInRound", questionsInRound);
        ReflectionTestUtils.setField(matchService, "roundsInMatch", roundsInMatch);
        ReflectionTestUtils.setField(matchService, "playersInMatch", playersInMatch);
        ReflectionTestUtils.setField(matchService, "maxMatchesInProgress", maxMatchesInProgress);
        ReflectionTestUtils.setField(matchService, "maxPlayerInactivityMs", maxPlayerInactivityMs);
    }

    @Test
    public void shouldCallRepositoriesWithCorrectArgsAndJoinPlayerOnGetMatchForUser() {
        String matchId = "some match id";
        String newPlayerId = "player id";
        String userId = "some user id";
        MatchEntity matchEntity = MatchEntity.builder()
                .id(matchId)
                .createdAt(Instant.now())
                .updatedAt(Instant.now())
                .players(Arrays.asList(mock(PlayerEntity.class), mock(PlayerEntity.class)))
                .build();
        when(matchRepository.findByPlayerWithUserIdAndMatchStateNot(any(), any())).thenReturn(Collections.emptyList());
        when(matchRepository.findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(eq((long) playersInMatch), any()))
                .thenReturn(Collections.singletonList(matchEntity));
        when(matchRepository.save(any())).thenAnswer(i -> i.getArgument(0));
        when(playerRepository.save(any())).then(invocation -> {
            PlayerEntity argument = invocation.getArgument(0);
            argument.setId(newPlayerId);
            return argument;
        });
        List listMock = mock(List.class);
        when(objectMapper.convertValue(any(), any(TypeReference.class))).thenAnswer(i -> listMock);
        when(objectMapper.convertValue(any(), eq(MatchDTO.class))).thenAnswer(i -> MatchDTO.builder().build());

        MatchDTO result = matchService.getMatchForUser(userId);

        ArgumentCaptor<MatchEntity> matchEntityCaptor = ArgumentCaptor.forClass(MatchEntity.class);
        ArgumentCaptor<PlayerEntity> playerEntityCaptor = ArgumentCaptor.forClass(PlayerEntity.class);
        verify(matchRepository).findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(eq((long) playersInMatch), any());
        verify(matchRepository).save(matchEntityCaptor.capture());
        verify(playerRepository).save(playerEntityCaptor.capture());

        MatchEntity matchEntityArgument = matchEntityCaptor.getValue();
        PlayerEntity playerEntityArgument = playerEntityCaptor.getValue();

        assertEquals(MatchState.IN_PROGRESS, matchEntityArgument.getMatchState());
        assertEquals(matchId, matchEntityArgument.getId());
        assertNotEquals(matchEntityArgument.getCreatedAt(), matchEntityArgument.getUpdatedAt());

        assertEquals(3, playerEntityArgument.getPlayerNumber());
        assertEquals(matchEntity.getId(), playerEntityArgument.getMatchId());
        assertEquals(userId, playerEntityArgument.getUserId());
        assertEquals(listMock, result.getPlayers());

        assertFalse(result.isShouldStartRound());
    }

    @Test
    public void shouldCallRepositoriesWithCorrectArgsAndCreateANewMatchOnGetMatchForUser() {
        String matchId = "some match id";
        String newPlayerId = "player id";
        String userId = "some user id";
        MatchEntity matchEntity = MatchEntity.builder()
                .id(matchId)
                .createdAt(Instant.now())
                .updatedAt(Instant.now())
                .players(Arrays.asList(mock(PlayerEntity.class), mock(PlayerEntity.class)))
                .build();
        List listMock = mock(List.class);
        when(matchRepository.findByPlayerWithUserIdAndMatchStateNot(any(), any())).thenReturn(Collections.emptyList());
        when(matchRepository.findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(eq((long) playersInMatch), any()))
                .thenReturn(Collections.emptyList());
        when(matchRepository.save(any())).thenReturn(matchEntity);
        when(playerRepository.save(any())).then(invocation -> {
            PlayerEntity argument = invocation.getArgument(0);
            argument.setId(newPlayerId);
            return argument;
        });
        when(objectMapper.convertValue(any(), any(TypeReference.class))).thenAnswer(i -> listMock);
        when(objectMapper.convertValue(any(), eq(MatchDTO.class))).thenAnswer(i -> MatchDTO.builder().build());

        MatchDTO result = matchService.getMatchForUser(userId);

        ArgumentCaptor<MatchEntity> matchEntityCaptor = ArgumentCaptor.forClass(MatchEntity.class);
        ArgumentCaptor<PlayerEntity> playerEntityCaptor = ArgumentCaptor.forClass(PlayerEntity.class);
        verify(matchRepository).findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(eq((long) playersInMatch), any());
        verify(matchRepository).save(matchEntityCaptor.capture());
        verify(playerRepository).save(playerEntityCaptor.capture());

        MatchEntity matchEntityArgument = matchEntityCaptor.getValue();
        PlayerEntity playerEntityArgument = playerEntityCaptor.getValue();

        assertEquals(MatchState.WAITING_FOR_OPPONENT, matchEntityArgument.getMatchState());
        assertNull(matchEntityArgument.getId());
        assertEquals(matchEntityArgument.getCreatedAt(), matchEntityArgument.getUpdatedAt());

        assertEquals(1, playerEntityArgument.getPlayerNumber());
        assertEquals(matchEntity.getId(), playerEntityArgument.getMatchId());
        assertEquals(userId, playerEntityArgument.getUserId());
        assertEquals(listMock, result.getPlayers());

        assertTrue(result.isShouldStartRound());
    }

    @Test(expected = IllegalStateException.class)
    public void shouldThrowExceptionOnGetMatchForUser() {
        String userId = "some user id";

        List listMock = mock(List.class);
        when(listMock.size()).thenReturn(maxMatchesInProgress);
        when(matchRepository.findByPlayerWithUserIdAndMatchStateNot(any(), any())).thenReturn(listMock);

        matchService.getMatchForUser(userId);
    }

    @Test
    public void shouldCallRepositoryMethodOnGetMatchesByUserId() {
        String userId = "some user id";
        int page = 1;
        int pageSize = 5;
        Page pageMock = mock(Page.class);
        when(matchRepository.findByPlayerWithUserId(eq(userId), any())).thenReturn(pageMock);


        Page<MatchEntity> result = matchService.getMatchesByUserId(userId, page, pageSize);


        ArgumentCaptor<String> userIdArgCaptor = ArgumentCaptor.forClass(String.class);
        ArgumentCaptor<Pageable> pageableArgCaptor = ArgumentCaptor.forClass(Pageable.class);
        verify(matchRepository).findByPlayerWithUserId(userIdArgCaptor.capture(), pageableArgCaptor.capture());

        String userIdArgValue = userIdArgCaptor.getValue();
        Pageable pageableArgValue = pageableArgCaptor.getValue();

        assertEquals(userId, userIdArgValue);
        assertEquals(page, pageableArgValue.getPageNumber());
        assertEquals(pageSize, pageableArgValue.getPageSize());
        assertEquals(pageMock, result);
    }

    @Test
    public void shouldCallRepositoryMethodOnCreateRound1() {//When no rounds are created yet
        when(objectMapper.convertValue(any(), any(TypeReference.class)))
                .thenAnswer(inv -> getQuestionDTOList(questionsInRound));
        when(objectMapper.convertValue(any(), any(Class.class))).thenAnswer(i -> mock(i.getArgument(1)));

        MatchEntity matchEntity = createMatchEntity(1, 0, MATCH_ID);
        createRoundFlow(matchEntity, matchEntity.getPlayers().get(0).getUserId(), MATCH_ID);
    }

    @Test
    public void shouldCallRepositoryMethodOnCreateRound2() {//when there is one finished round
        when(objectMapper.convertValue(any(), any(TypeReference.class)))
                .thenAnswer(inv -> getQuestionDTOList(questionsInRound));
        when(objectMapper.convertValue(any(), any(Class.class))).thenAnswer(i -> mock(i.getArgument(1)));

        MatchEntity matchEntity = createMatchEntity(2, 1, MATCH_ID);
        createRoundFlow(matchEntity, matchEntity.getPlayers().get(1).getUserId(), MATCH_ID);
    }

    @Test
    public void shouldCallRepositoryMethodOnCreateRound3() {//when every player has created one round
        when(objectMapper.convertValue(any(), any(TypeReference.class)))
                .thenAnswer(inv -> getQuestionDTOList(questionsInRound));
        when(objectMapper.convertValue(any(), any(Class.class))).thenAnswer(i -> mock(i.getArgument(1)));

        MatchEntity matchEntity = createMatchEntity(playersInMatch, playersInMatch, MATCH_ID);
        createRoundFlow(matchEntity, matchEntity.getPlayers().get(0).getUserId(), MATCH_ID);
    }

    @Test(expected = IllegalStateException.class)
    public void shouldThrowAnExceptionOnCreateRound1() {//when all rounds are played
        MatchEntity matchEntity = createMatchEntity(playersInMatch, roundsInMatch, MATCH_ID);
        createRoundFlow(matchEntity, "no matter", MATCH_ID);
    }

    @Test(expected = IllegalStateException.class)
    public void shouldThrowAnExceptionOnCreateRound2() {//when there is an unfinished round
        MatchEntity matchEntity = createMatchEntity(2, 3, MATCH_ID);
        matchEntity.getRounds().get(2).setRoundState(RoundState.IN_PROGRESS);
        createRoundFlow(matchEntity, matchEntity.getPlayers().get(1).getUserId(), MATCH_ID);
    }

    @Test(expected = IllegalStateException.class)
    public void shouldThrowAnExceptionOnCreateRound3() {//when it's not your turn
        MatchEntity matchEntity = createMatchEntity(2, 1, MATCH_ID);
        createRoundFlow(matchEntity, matchEntity.getPlayers().get(0).getUserId(), MATCH_ID);
    }

    @Test(expected = IllegalStateException.class)
    public void shouldThrowAnExceptionOnCreateRound4() {//when it's not your turn
        MatchEntity matchEntity = createMatchEntity(2, 0, MATCH_ID);
        createRoundFlow(matchEntity, matchEntity.getPlayers().get(1).getUserId(), MATCH_ID);
    }

    @Test
    public void shouldReturnTrueOnShouldUserStartRound1() {//When no rounds are created yet
        MatchEntity matchEntity = createMatchEntity(1, 0, MATCH_ID);
        boolean result = matchService.shouldUserStartRound(matchEntity.getPlayers().get(0).getUserId(), matchEntity);
        assertTrue(result);
    }

    @Test
    public void shouldReturnTrueOnShouldUserStartRound2() {//when there is one finished round
        MatchEntity matchEntity = createMatchEntity(2, 1, MATCH_ID);
        boolean result = matchService.shouldUserStartRound(matchEntity.getPlayers().get(1).getUserId(), matchEntity);
        assertTrue(result);
    }

    @Test
    public void shouldReturnTrueOnShouldUserStartRound3() {//when every player has created one round
        MatchEntity matchEntity = createMatchEntity(playersInMatch, playersInMatch, MATCH_ID);
        boolean result = matchService.shouldUserStartRound(matchEntity.getPlayers().get(0).getUserId(), matchEntity);
        assertTrue(result);
    }

    @Test
    public void shouldReturnFalseOnShouldUserStartRound1() {//when all rounds are played
        MatchEntity matchEntity = createMatchEntity(playersInMatch, roundsInMatch, MATCH_ID);
        boolean result = matchService.shouldUserStartRound("no matter", matchEntity);
        assertFalse(result);
    }

    @Test
    public void shouldReturnFalseOnShouldUserStartRound2() {//when there is an unfinished round
        MatchEntity matchEntity = createMatchEntity(2, 3, MATCH_ID);
        matchEntity.getRounds().get(2).setRoundState(RoundState.IN_PROGRESS);
        boolean result = matchService.shouldUserStartRound(matchEntity.getPlayers().get(1).getUserId(), matchEntity);
        assertFalse(result);
    }

    @Test
    public void shouldReturnFalseOnShouldUserStartRound3() {//when it's not your turn
        MatchEntity matchEntity = createMatchEntity(2, 1, MATCH_ID);
        boolean result = matchService.shouldUserStartRound(matchEntity.getPlayers().get(0).getUserId(), matchEntity);
        assertFalse(result);
    }

    @Test
    public void shouldReturnFalseOnShouldUserStartRound4() {//when it's not your turn
        MatchEntity matchEntity = createMatchEntity(2, 0, MATCH_ID);
        boolean result = matchService.shouldUserStartRound(matchEntity.getPlayers().get(1).getUserId(), matchEntity);
        assertFalse(result);
    }

    @Test
    public void shouldReturnFalseOnShouldUserStartRound5() {//when the match is finished
        MatchEntity matchEntity = createMatchEntity(2, 0, MATCH_ID);
        matchEntity.setMatchState(MatchState.FINISHED);
        boolean result = matchService.shouldUserStartRound(matchEntity.getPlayers().get(1).getUserId(), matchEntity);
        assertFalse(result);
    }

    private MatchEntity createMatchEntity(int playersNumber, int roundsPlayed, String matchId) {
        List<PlayerEntity> playerEntityList = new ArrayList<>(playersNumber);
        for (int i = 0; i < playersNumber; i++) {
            playerEntityList.add(PlayerEntity.builder()
                    .matchId(matchId)
                    .userId("user" + (i + 1))
                    .playerNumber(i + 1)
                    .build());
        }
        List<RoundEntity> roundEntityList = new ArrayList<>(roundsPlayed);
        for (int i = 0; i < roundsPlayed; i++) {
            roundEntityList.add(RoundEntity.builder()
                    .matchId(matchId)
                    .roundState(FINISHED)
                    .build());
        }
        return MatchEntity.builder()
                .players(playerEntityList)
                .rounds(roundEntityList)
                .build();
    }

    private void createRoundFlow(MatchEntity matchEntity, String userId, String matchId) {
        String topicId = "some topic id";
        String round_id = "round id";
        when(roundRepository.save(any())).then(invocationOnMock -> {
            RoundEntity argument = invocationOnMock.getArgument(0);
            argument.setId(round_id);
            return argument;
        });
        List<QuestionEntity> questionEntityList = getQuestionEntityList(questionsInRound);
        when(questionService.findRandomQuestionsByTopicId(topicId, questionsInRound)).thenReturn(questionEntityList);
        when(matchRepository.findById(matchId)).thenReturn(Optional.of(matchEntity));

        matchService.createRound(userId, matchId, topicId);

        ArgumentCaptor<RoundEntity> roundEntityArgumentCaptor = ArgumentCaptor.forClass(RoundEntity.class);
        ArgumentCaptor<List> roundQuestionListArgumentCaptor = ArgumentCaptor.forClass(List.class);
        verify(matchRepository).findById(matchId);
        verify(roundRepository).save(roundEntityArgumentCaptor.capture());
        verify(questionService).findRandomQuestionsByTopicId(topicId, questionsInRound);
        verify(roundQuestionRepository).saveAll(roundQuestionListArgumentCaptor.capture());

        RoundEntity roundEntityArgument = roundEntityArgumentCaptor.getValue();
        List<RoundQuestionEntity> roundQuestionListArgument = roundQuestionListArgumentCaptor.getValue();

        assertEquals(matchId, roundEntityArgument.getMatchId());
        assertEquals(topicId, roundEntityArgument.getTopicId());

        for (int i = 0; i < roundQuestionListArgument.size(); i++) {
            assertEquals(round_id, roundQuestionListArgument.get(i).getRoundId());
            assertEquals(questionEntityList.get(i), roundQuestionListArgument.get(i).getQuestion());
        }
    }

    @Test
    public void shouldCallRepositoryMethodOnGetRoundsByMatchId() {
        String matchId = MATCH_ID;
        matchService.getRoundsByMatchId(matchId);

        verify(roundRepository).findByMatchId(matchId, new Sort(Sort.Direction.ASC, "createdAt"));
    }

    @Test
    public void shouldCallRepositoryMethodOnFinishAllInactiveMatches() {
        when(matchRepository.findMatchesInProgressWhereLastActivityIsOlderThan(any()))
                .thenReturn(getMatchEntities());

        matchService.finishAllInactiveMatches();

        verify(matchRepository).findMatchesInProgressWhereLastActivityIsOlderThan(any());
        verify(roundScoresRepository).updateScoreByPlayerIdToZero(Arrays.asList("playerId1", "playerId4"));
        verify(matchRepository).updateMatchState(Arrays.asList("matchId1", "matchId2"), MatchState.FINISHED);
        verify(roundRepository).updateRoundState(Collections.singletonList("roundId1"), FINISHED);
    }

    @Test
    public void shouldCallRepositoryMethodOnFinishAllInactiveMatchesForUser() {
        String userId = "some user id";
        when(matchRepository.findMatchesInProgressByUserIdWhereLastActivityIsOlderThan(eq(userId), any()))
                .thenReturn(getMatchEntities());

        matchService.finishInactiveMatchesForUser(userId);

        verify(matchRepository).findMatchesInProgressByUserIdWhereLastActivityIsOlderThan(eq(userId), any());
        verify(roundScoresRepository).updateScoreByPlayerIdToZero(Arrays.asList("playerId1", "playerId4"));
        verify(matchRepository).updateMatchState(Arrays.asList("matchId1", "matchId2"), MatchState.FINISHED);
    }

    private List<QuestionEntity> getQuestionEntityList(int quantity) {
        List<QuestionEntity> result = new ArrayList<>();
        for (int i = 0; i < quantity; i++) {
            result.add(QuestionEntity.builder()
                    .topicEntity(TopicEntity.builder()
                            .id("")
                            .build())
                    .answers(Collections.emptyList())
                    .build());
        }
        return result;
    }

    private Object getQuestionDTOList(int quantity) {
        List<QuestionDTO> questionDTOList = new ArrayList<>(quantity);
        for (int i = 0; i < quantity; i++) {
            questionDTOList.add(mock(QuestionDTO.class));
        }
        return questionDTOList;
    }

    private List<MatchEntity> getMatchEntities() {
        return Arrays.asList(MatchEntity.builder()
                .id("matchId1")
                .players(Arrays.asList(PlayerEntity.builder()
                        .id("playerId1")
                        .lastActivityAt(Instant.ofEpochSecond(100))
                        .build(), PlayerEntity.builder()
                        .id("playerId2")
                        .lastActivityAt(Instant.ofEpochSecond(150))
                        .build()))
                .rounds(Collections.singletonList(RoundEntity.builder()
                        .id("roundId1")
                        .build()))
                .build(), MatchEntity.builder()
                .id("matchId2")
                .players(Arrays.asList(PlayerEntity.builder()
                        .id("playerId3")
                        .lastActivityAt(Instant.ofEpochSecond(110))
                        .build(), PlayerEntity.builder()
                        .id("playerId4")
                        .lastActivityAt(Instant.ofEpochSecond(90))
                        .build()))
                .rounds(Collections.emptyList())
                .build());
    }
}