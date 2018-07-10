package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.UserEntity;
import com.epam.epmrduaqgv.back.repository.UserRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.Collections;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class UserServiceImplTest {

    private static final String EMAIL = "email";
    private static final String NICK = "testUser";
    @InjectMocks
    private UserServiceImpl userService;

    @Mock
    private UserRepository userRepository;

    @Test
    public void shouldDelegateToRepositoryOnFindByEmail() {
        UserEntity userEntity = getUserEntity();
        when(userRepository.findByEmail(EMAIL)).thenReturn(userEntity);

        UserEntity result = userService.findByEmail(EMAIL);

        verify(userRepository).findByEmail(EMAIL);
        assertEquals(userEntity, result);
    }

    @Test
    public void shouldDelegateToRepositoryOnFindTopScoresUserList() {
        UserEntity userEntity = getUserEntity();
        PageImpl<UserEntity> page = new PageImpl<>(Collections.singletonList(userEntity));
        when(userRepository.findAll(any(Pageable.class))).thenReturn(page);

        List<UserEntity> result = userService.findTopScoresUserList(6, Sort.Direction.DESC);


        ArgumentCaptor<Pageable> argumentCaptor = ArgumentCaptor.forClass(Pageable.class);
        verify(userRepository).findAll(argumentCaptor.capture());
        Pageable capturedArg = argumentCaptor.getValue();

        assertEquals(0, capturedArg.getPageNumber());
        assertEquals(6, capturedArg.getPageSize());
        assertEquals(Sort.Direction.DESC, capturedArg.getSort().getOrderFor("score").getDirection());
        assertEquals(userEntity, result.get(0));
    }

    private UserEntity getUserEntity() {
        return UserEntity.builder()
                .email(EMAIL)
                .nickName(NICK)
                .build();
    }
}