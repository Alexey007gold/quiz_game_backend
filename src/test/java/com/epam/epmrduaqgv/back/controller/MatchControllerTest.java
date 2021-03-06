package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.dto.MatchDTO;
import com.epam.epmrduaqgv.back.dto.MatchSmallDTO;
import com.epam.epmrduaqgv.back.dto.PageDTO;
import com.epam.epmrduaqgv.back.dto.RoundDTO;
import com.epam.epmrduaqgv.back.facade.MatchFacade;
import com.epam.epmrduaqgv.back.model.MatchState;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class MatchControllerTest {

    @InjectMocks
    private MatchController matchController;

    @Mock
    private MatchFacade matchFacade;

    @Test
    public void shouldCallFacadeMethodOnCreateMatch() {
        OAuth2Authentication oauthMock = mock(OAuth2Authentication.class);
        OAuth2AuthenticationDetails authenticationDetailsMock = mock(OAuth2AuthenticationDetails.class);
        MatchDTO matchDTOMock = mock(MatchDTO.class);
        String userId = "some user id";
        when(oauthMock.getDetails()).thenReturn(authenticationDetailsMock);
        when(authenticationDetailsMock.getDecodedDetails()).thenReturn(Collections.singletonMap("id", userId));
        when(matchFacade.getMatchForUser(userId)).thenReturn(matchDTOMock);

        MatchDTO result = matchController.createMatch(oauthMock);

        verify(matchFacade).getMatchForUser(userId);
        assertEquals(matchDTOMock, result);
    }

    @Test
    public void shouldCallFacadeMethodOnGetMyMatches() {
        OAuth2Authentication oauthMock = mock(OAuth2Authentication.class);
        OAuth2AuthenticationDetails authenticationDetailsMock = mock(OAuth2AuthenticationDetails.class);
        PageDTO<MatchDTO> matchDTOPageMock = mock(PageDTO.class);
        String userId = "some user id";
        int page = 0;
        int pageSize = 5;
        when(oauthMock.getDetails()).thenReturn(authenticationDetailsMock);
        when(authenticationDetailsMock.getDecodedDetails()).thenReturn(Collections.singletonMap("id", userId));
        when(matchFacade.getMatchesByUserId(userId, page, pageSize)).thenReturn(matchDTOPageMock);

        PageDTO<MatchDTO> result = matchController.getMyMatches(oauthMock, page, pageSize);

        verify(matchFacade).getMatchesByUserId(userId, page, pageSize);
        assertEquals(matchDTOPageMock, result);
    }

    @Test
    public void shouldCallFacadeMethodOnCreateRound() {
        String userId = "some user id";
        String matchId = "some match id";
        String topicId = "some topic id";
        OAuth2Authentication oauthMock = mock(OAuth2Authentication.class);
        OAuth2AuthenticationDetails authenticationDetailsMock = mock(OAuth2AuthenticationDetails.class);
        RoundDTO roundDTO = mock(RoundDTO.class);
        when(oauthMock.getDetails()).thenReturn(authenticationDetailsMock);
        when(authenticationDetailsMock.getDecodedDetails()).thenReturn(Collections.singletonMap("id", userId));
        when(matchFacade.createRound(userId, matchId, topicId)).thenReturn(roundDTO);

        RoundDTO result = matchController.createRound(oauthMock, matchId, topicId);

        verify(matchFacade).createRound(userId, matchId, topicId);
        assertEquals(roundDTO, result);
    }

    @Test
    public void shouldCallFacadeMethodOnGetRoundsByMatchId() {
        String matchId = "some match id";
        List<RoundDTO> roundDTOList = Collections.singletonList(mock(RoundDTO.class));
        when(matchFacade.getRoundsByMatchId(matchId)).thenReturn(roundDTOList);

        List<RoundDTO> result = matchController.getRoundsByMatchId(matchId);

        verify(matchFacade).getRoundsByMatchId(matchId);
        assertEquals(roundDTOList, result);
    }

    @Test
    public void shouldCallFacadeMethodOnGiveAnswer() {
        OAuth2Authentication oauthMock = mock(OAuth2Authentication.class);
        OAuth2AuthenticationDetails authenticationDetailsMock = mock(OAuth2AuthenticationDetails.class);
        String userId = "some user id";
        String roundId = "some round id";
        String questionId = "some question id";
        String answerId = "some answer id";
        when(oauthMock.getDetails()).thenReturn(authenticationDetailsMock);
        when(authenticationDetailsMock.getDecodedDetails()).thenReturn(Collections.singletonMap("id", userId));

        matchController.giveAnswer(oauthMock, roundId, questionId, answerId);

        verify(matchFacade).saveAnswer(userId, roundId, questionId, answerId);
    }

    @Test
    public void shouldCallFacadeMethodOnGetMyMatchesSmallDTO() {
        OAuth2Authentication oauthMock = mock(OAuth2Authentication.class);
        OAuth2AuthenticationDetails authenticationDetailsMock = mock(OAuth2AuthenticationDetails.class);
        Map mapMock = mock(Map.class);
        String userId = "some user id";
        int page = 0;
        int pageSize = 20;

        when(oauthMock.getDetails()).thenReturn(authenticationDetailsMock);
        when(authenticationDetailsMock.getDecodedDetails()).thenReturn(Collections.singletonMap("id", userId));
        when(matchFacade.getMatchSmallDTOMap(userId, page, pageSize)).thenReturn(mapMock);

        Map<MatchState, List<MatchSmallDTO>> result = matchController.getMyMatchesSmallDTO(oauthMock, page, pageSize);

        verify(matchFacade).getMatchSmallDTOMap(userId, page, pageSize);
        assertEquals(mapMock, result);
    }

    @Test
    public void shouldCallFacadeMethodOnGetMatchDTOById() {
        MatchDTO matchDTOMock = mock(MatchDTO.class);
        String matchId = "some match id";

        when(matchFacade.getMatchById(matchId)).thenReturn(matchDTOMock);

        MatchDTO result = matchController.getMatchDTOById(matchId);

        verify(matchFacade).getMatchById(matchId);
        assertEquals(matchDTOMock, result);
    }

    @Test
    public void shouldCallFacadeMethodOnGetMatchDTOsByIds() {
        List<MatchDTO> matchDTOMock = Arrays.asList(mock(MatchDTO.class), mock(MatchDTO.class));
        List<String> matchIds = Arrays.asList("some match id1", "some match id2");

        when(matchFacade.getMatchesByIds(matchIds)).thenReturn(matchDTOMock);

        List<MatchDTO> result = matchController.getMatchDTOsByIds(matchIds);

        verify(matchFacade).getMatchesByIds(matchIds);
        assertEquals(matchDTOMock, result);
    }
}