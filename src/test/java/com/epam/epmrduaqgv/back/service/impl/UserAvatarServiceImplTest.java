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
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class UserAvatarServiceImplTest {

    @InjectMocks
    private UserAvatarServiceImpl userAvatarService;

    @Mock
    private UserAvatarRepository userAvatarRepository;

    @Test
    public void updateAvatar() {
        String userId = "some user id";
        byte[] bytes = {1, 2, 3};

        userAvatarService.updateAvatar(userId, bytes);

        ArgumentCaptor<UserAvatarEntity> userAvatarEntityArgumentCaptor =
                ArgumentCaptor.forClass(UserAvatarEntity.class);
        verify(userAvatarRepository).removeByUserId(userId);
        verify(userAvatarRepository).save(userAvatarEntityArgumentCaptor.capture());

        UserAvatarEntity userAvatarEntityValue = userAvatarEntityArgumentCaptor.getValue();
        assertEquals(userId, userAvatarEntityValue.getUserId());
        assertEquals(bytes, userAvatarEntityValue.getValue());
    }

    @Test
    public void getUserAvatar() {
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