package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.dto.MatchDTO;
import com.epam.epmrduaqgv.back.dto.PageDTO;
import com.epam.epmrduaqgv.back.dto.RoundDTO;
import com.epam.epmrduaqgv.back.facade.MatchFacade;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;

import java.util.Collections;
import java.util.List;

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
}