package com.epam.epmrduaqgv.back.facade.impl;

import com.epam.epmrduaqgv.back.dto.MatchDTO;
import com.epam.epmrduaqgv.back.dto.MatchSmallDTO;
import com.epam.epmrduaqgv.back.dto.PageDTO;
import com.epam.epmrduaqgv.back.dto.RoundDTO;
import com.epam.epmrduaqgv.back.entity.MatchEntity;
import com.epam.epmrduaqgv.back.model.MatchState;
import com.epam.epmrduaqgv.back.service.AnswerService;
import com.epam.epmrduaqgv.back.service.MatchService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.data.domain.Page;

import java.util.*;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class MatchFacadeImplTest {

    @InjectMocks
    private MatchFacadeImpl matchFacade;

    @Mock
    private MatchService matchService;

    @Mock
    private AnswerService answerService;

    @Mock
    private ObjectMapper objectMapper;

    @Test
    public void shouldCallServicesOnGetMatchForUser() {
        MatchDTO matchDTO = MatchDTO.builder().build();
        String userId = "some user id";
        when(matchService.getMatchForUser(userId)).thenReturn(matchDTO);

        MatchDTO result = matchFacade.getMatchForUser(userId);

        verify(matchService).getMatchForUser(userId);
        verify(matchService).finishInactiveMatchesForUser(userId);
        assertEquals(matchDTO, result);
    }

    @Test
    public void shouldCallServiceMethodsOnCreateRound() {
        String userId = "some user id";
        String matchId = "some match id";
        String topicId = "some topic id";
        RoundDTO roundDTO = mock(RoundDTO.class);
        when(matchService.createRound(userId, matchId, topicId)).thenReturn(roundDTO);

        RoundDTO result = matchFacade.createRound(userId, matchId, topicId);

        verify(matchService).createRound(userId, matchId, topicId);
        assertEquals(roundDTO, result);
    }

    @Test
    public void shouldCallServicesOnGetMatchesByUserId() {
        Page<MatchEntity> matchEntityPageMock = mock(Page.class);
        List<MatchEntity> pageContentMock = Arrays.asList(mock(MatchEntity.class), mock(MatchEntity.class));
        List<MatchDTO> matchDTOList = Arrays.asList(MatchDTO.builder().build(), MatchDTO.builder().build());
        String userId = "some user id";
        int page = 0;
        int pageSize = 5;
        when(matchService.getMatchesByUserId(userId, page, pageSize)).thenReturn(matchEntityPageMock);
        when(matchService.shouldUserStartRound(eq(userId), any())).thenReturn(true);
        when(matchEntityPageMock.getContent()).thenReturn(pageContentMock);
        when(objectMapper.convertValue(eq(pageContentMock), any(TypeReference.class))).thenReturn(matchDTOList);

        PageDTO<MatchDTO> result = matchFacade.getMatchesByUserId(userId, page, pageSize);

        verify(matchService).finishInactiveMatchesForUser(userId);
        verify(matchService).getMatchesByUserId(userId, page, pageSize);
        verify(objectMapper).convertValue(eq(pageContentMock), any(TypeReference.class));
        verify(matchService).shouldUserStartRound(userId, pageContentMock.get(0));
        verify(matchService).shouldUserStartRound(userId, pageContentMock.get(1));
        assertEquals(matchDTOList, result.getData());
        assertTrue(matchDTOList.get(0).isShouldStartRound());
        assertTrue(matchDTOList.get(1).isShouldStartRound());
    }

    @Test
    public void shouldCallServicesOnGetMatchSmallDTOMap() {
        Page<MatchEntity> matchEntityPageMock = mock(Page.class);
        List<MatchEntity> pageContentMock = Arrays.asList(MatchEntity.builder().matchState(MatchState.WAITING_FOR_OPPONENT).build(),
                MatchEntity.builder().matchState(MatchState.WAITING_FOR_OPPONENT).build(),
                MatchEntity.builder().matchState(MatchState.IN_PROGRESS).build());
        String userId = "some user id";
        int page = 0;
        int pageSize = 5;
        when(matchService.getMatchesByUserId(userId, page, pageSize)).thenReturn(matchEntityPageMock);
        when(matchEntityPageMock.getContent()).thenReturn(pageContentMock);

        Map<MatchState, List<MatchSmallDTO>> result = matchFacade.getMatchSmallDTOMap(userId, page, pageSize);

        verify(matchService).finishInactiveMatchesForUser(userId);
        verify(matchService).getMatchesByUserId(userId, page, pageSize);

        assertEquals(new HashSet<>(Arrays.asList(MatchState.WAITING_FOR_OPPONENT, MatchState.IN_PROGRESS)), result.keySet());
        assertEquals(1, result.get(MatchState.IN_PROGRESS).size());
        assertEquals(2, result.get(MatchState.WAITING_FOR_OPPONENT).size());
    }

    @Test
    public void shouldCallServiceMethodsOnGetRoundsByMatchId() {
        String matchId = "some match id";
        List<RoundDTO> roundDTOList = Collections.singletonList(mock(RoundDTO.class));
        when(matchService.getRoundsByMatchId(matchId)).thenReturn(roundDTOList);

        List<RoundDTO> result = matchFacade.getRoundsByMatchId(matchId);

        verify(matchService).getRoundsByMatchId(matchId);
        assertEquals(roundDTOList, result);
    }

    @Test
    public void shouldCallServiceMethodsOnSaveAnswer() {
        String userId = "some user id";
        String roundId = "some round id";
        String questionId = "some question id";
        String answerId = "some answer id";

        matchFacade.saveAnswer(userId, roundId, questionId, answerId);

        verify(matchService).finishInactiveMatchesForUser(userId);
        verify(answerService).saveAnswer(userId, roundId, questionId, answerId);
    }

}