package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.UserAvatarEntity;
import com.epam.epmrduaqgv.back.repository.UserAvatarRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class UserAvatarServiceImplTest {

    @InjectMocks
    private UserAvatarServiceImpl userAvatarService;

    @Mock
    private UserAvatarRepository userAvatarRepository;

    @Test
    public void shouldCallRepositoryUpdateOnUpdateAvatar() {
        String userId = "some user id";
        byte[] bytes = {1, 2, 3};
        String fileName = "someName.png";
        when(userAvatarRepository.updateByUserId(userId, bytes)).thenReturn(1);

        userAvatarService.updateAvatar(userId, bytes, fileName);

        verify(userAvatarRepository).updateByUserId(userId, bytes);
        verify(userAvatarRepository, never()).save(any());
    }

    @Test
    public void shouldCallRepositorySaveOnUpdateAvatar() {
        String userId = "some user id";
        byte[] bytes = {1, 2, 3};
        String fileName = "someName.png";

        userAvatarService.updateAvatar(userId, bytes, fileName);

        ArgumentCaptor<UserAvatarEntity> userAvatarEntityArgumentCaptor =
                ArgumentCaptor.forClass(UserAvatarEntity.class);
        verify(userAvatarRepository).updateByUserId(userId, bytes);
        verify(userAvatarRepository).save(userAvatarEntityArgumentCaptor.capture());

        UserAvatarEntity userAvatarEntityValue = userAvatarEntityArgumentCaptor.getValue();
        assertEquals(userId, userAvatarEntityValue.getUserId());
        assertEquals(bytes, userAvatarEntityValue.getValue());
    }

    @Test(expected = IllegalArgumentException.class)
    public void shouldThrowExceptionOnUpdateAvatar() {
        String userId = "some user id";
        byte[] bytes = {1, 2, 3};
        String fileName = "someName.exe";

        userAvatarService.updateAvatar(userId, bytes, fileName);
    }

    @Test
    public void shouldCallRepositoryOnGetUserAvatar() {
        String userId = "some user id";
        UserAvatarEntity userAvatarEntity = UserAvatarEntity.builder()
                .userId(userId)
                .build();
        when(userAvatarRepository.findByUserId(userId)).thenReturn(userAvatarEntity);

        UserAvatarEntity result = userAvatarService.getUserAvatar(userId);

        verify(userAvatarRepository).findByUserId(userId);
        assertEquals(userAvatarEntity, result);
    }
}