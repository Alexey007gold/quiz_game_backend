package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.dto.MatchDTO;
import com.epam.epmrduaqgv.back.dto.PageDTO;
import com.epam.epmrduaqgv.back.entity.MatchEntity;
import com.epam.epmrduaqgv.back.service.MatchService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.data.domain.Page;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;

import java.util.Collections;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class MatchControllerTest {

    @InjectMocks
    private MatchController matchController;

    @Mock
    private MatchService matchService;

    @Mock
    private ObjectMapper objectMapper;

    @Test
    public void shouldCallServicesOnCreateMatch() {
        OAuth2Authentication oauthMock = mock(OAuth2Authentication.class);
        OAuth2AuthenticationDetails authenticationDetailsMock = mock(OAuth2AuthenticationDetails.class);
        MatchEntity matchEntityMock = mock(MatchEntity.class);
        MatchDTO matchDTOMock = mock(MatchDTO.class);
        String userId = "some user id";
        when(oauthMock.getDetails()).thenReturn(authenticationDetailsMock);
        when(authenticationDetailsMock.getDecodedDetails()).thenReturn(Collections.singletonMap("id", userId));
        when(matchService.createMatch(userId)).thenReturn(matchEntityMock);
        when(objectMapper.convertValue(matchEntityMock, MatchDTO.class)).thenReturn(matchDTOMock);

        MatchDTO result = matchController.createMatch(oauthMock);

        verify(matchService).createMatch(userId);
        verify(objectMapper).convertValue(matchEntityMock, MatchDTO.class);
        assertEquals(matchDTOMock, result);
    }

    @Test
    public void shouldCallServicesOnGetMyMatches() {
        OAuth2Authentication oauthMock = mock(OAuth2Authentication.class);
        OAuth2AuthenticationDetails authenticationDetailsMock = mock(OAuth2AuthenticationDetails.class);
        Page<MatchEntity> matchEntityPageMock = mock(Page.class);
        List<MatchEntity> pageContentMock = mock(List.class);
        List<MatchDTO> matchDTOsMock = mock(List.class);
        String userId = "some user id";
        int page = 0;
        int pageSize = 5;
        when(oauthMock.getDetails()).thenReturn(authenticationDetailsMock);
        when(authenticationDetailsMock.getDecodedDetails()).thenReturn(Collections.singletonMap("id", userId));
        when(matchService.getMatchesByUserId(userId, page, pageSize)).thenReturn(matchEntityPageMock);
        when(matchEntityPageMock.getContent()).thenReturn(pageContentMock);
        when(objectMapper.convertValue(eq(pageContentMock), any(TypeReference.class))).thenReturn(matchDTOsMock);

        PageDTO<MatchDTO> result = matchController.getMyMatches(oauthMock, page, pageSize);

        verify(matchService).getMatchesByUserId(userId, page, pageSize);
        verify(objectMapper).convertValue(eq(pageContentMock), any(TypeReference.class));
        assertEquals(matchDTOsMock, result.getData());
    }
}