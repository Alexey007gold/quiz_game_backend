package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.dto.UserAvatarDTO;
import com.epam.epmrduaqgv.back.entity.UserAvatarEntity;
import com.epam.epmrduaqgv.back.service.UserAvatarService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Collections;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class AvatarControllerTest {

    @InjectMocks
    private AvatarController avatarController;

    @Mock
    private UserAvatarService userAvatarService;

    @Mock
    private ObjectMapper objectMapper;

    private long maxAvatarSize;

    @Before
    public void setUp() {
        maxAvatarSize = 5;
        ReflectionTestUtils.setField(avatarController, "maxAvatarSize", maxAvatarSize);
    }

    @Test
    public void shouldCallServiceOnUploadAvatar() throws IOException {
        String userId = "some user id";
        byte[] bytes = {1, 2, 3};
        String fileName = "someName.png";

        MultipartFile multipartFileMock = mock(MultipartFile.class);
        OAuth2Authentication oauthMock = mock(OAuth2Authentication.class);
        OAuth2AuthenticationDetails authenticationDetailsMock = mock(OAuth2AuthenticationDetails.class);
        when(oauthMock.getDetails()).thenReturn(authenticationDetailsMock);
        when(authenticationDetailsMock.getDecodedDetails()).thenReturn(Collections.singletonMap("id", userId));

        when(multipartFileMock.getSize()).thenReturn(maxAvatarSize);
        when(multipartFileMock.getBytes()).thenReturn(bytes);
        when(multipartFileMock.getOriginalFilename()).thenReturn(fileName);

        avatarController.uploadAvatar(oauthMock, multipartFileMock);

        verify(userAvatarService).updateAvatar(userId, bytes, fileName);
    }

    @Test(expected = IllegalArgumentException.class)
    public void shouldThrowAnExceptionOnUploadAvatar() throws IOException {
        MultipartFile multipartFileMock = mock(MultipartFile.class);
        OAuth2Authentication oauthMock = mock(OAuth2Authentication.class);

        when(multipartFileMock.getSize()).thenReturn(maxAvatarSize + 1);

        avatarController.uploadAvatar(oauthMock, multipartFileMock);
    }

    @Test
    public void shouldCallServiceOnGetAvatarAsBlob() {
        String userId = "some user id";
        byte[] bytes = {1, 2, 3};
        UserAvatarEntity userAvatarEntity = UserAvatarEntity.builder()
                .value(bytes)
                .build();
        OAuth2Authentication oauthMock = mock(OAuth2Authentication.class);
        OAuth2AuthenticationDetails authenticationDetailsMock = mock(OAuth2AuthenticationDetails.class);
        when(oauthMock.getDetails()).thenReturn(authenticationDetailsMock);
        when(authenticationDetailsMock.getDecodedDetails()).thenReturn(Collections.singletonMap("id", userId));

        when(userAvatarService.getUserAvatar(userId)).thenReturn(userAvatarEntity);

        byte[] result = avatarController.getAvatarAsBlob(oauthMock);

        verify(userAvatarService).getUserAvatar(userId);
        assertEquals(bytes, result);
    }

    @Test
    public void shouldCallServiceOnGetAvatarAsJson() {
        String userId = "some user id";
        byte[] bytes = {1, 2, 3};
        UserAvatarEntity userAvatarEntity = UserAvatarEntity.builder()
                .value(bytes)
                .build();
        UserAvatarDTO userAvatarDTO = UserAvatarDTO.builder()
                .value(bytes)
                .build();
        OAuth2Authentication oauthMock = mock(OAuth2Authentication.class);
        OAuth2AuthenticationDetails authenticationDetailsMock = mock(OAuth2AuthenticationDetails.class);
        when(oauthMock.getDetails()).thenReturn(authenticationDetailsMock);
        when(authenticationDetailsMock.getDecodedDetails()).thenReturn(Collections.singletonMap("id", userId));

        when(userAvatarService.getUserAvatar(userId)).thenReturn(userAvatarEntity);
        when(objectMapper.convertValue(userAvatarEntity, UserAvatarDTO.class)).thenReturn(userAvatarDTO);

        UserAvatarDTO result = avatarController.getAvatarAsJson(oauthMock);

        verify(userAvatarService).getUserAvatar(userId);
        assertEquals(userAvatarDTO, result);
    }
}