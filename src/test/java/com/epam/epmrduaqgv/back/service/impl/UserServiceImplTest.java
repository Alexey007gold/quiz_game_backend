package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.UserEntity;
import com.epam.epmrduaqgv.back.form.SignUpForm;
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
import org.springframework.security.crypto.password.PasswordEncoder;

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

    @Mock
    private PasswordEncoder passwordEncoder;

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
    
    public void shouldDelegateToRepositoryOnFindByNickName() {
        UserEntity userEntity = getUserEntity();
        when(userRepository.findByNickName(NICK)).thenReturn(userEntity);

        UserEntity result = userService.findByNickName(NICK);

        verify(userRepository).findByNickName(NICK);
        assertEquals(userEntity, result);
    }

    @Test
    public void shouldDelegateToRepositoryOnFindByEmailOrNickName() {
        UserEntity userEntity = getUserEntity();
        when(userRepository.findByEmailOrNickName(EMAIL, NICK)).thenReturn(userEntity);

        UserEntity result = userService.findByEmailOrNickName(EMAIL, NICK);

        verify(userRepository).findByEmailOrNickName(EMAIL, NICK);
        assertEquals(userEntity, result);
    }

    @Test(expected = IllegalStateException.class)
    public void shouldThrowAnExceptionWhenEmailOrNickNameIsUsedOnRegisterUser() {
        when(userRepository.findByEmailOrNickName(EMAIL, NICK)).thenReturn(getUserEntity());

        SignUpForm form = getSignUpForm();
        userService.registerUser(form);
    }

    @Test
    public void shouldEncodePasswordAndSaveNewUserOnRegisterUser() {
        String encodedPass = "encodedPass";
        UserEntity userEntity = getUserEntity();
        SignUpForm form = getSignUpForm();
        when(passwordEncoder.encode(form.getPassword())).thenReturn(encodedPass);
        when(userRepository.save(any())).thenReturn(userEntity);

        UserEntity result = userService.registerUser(form);

        ArgumentCaptor<String> passwordCaptor = ArgumentCaptor.forClass(String.class);
        ArgumentCaptor<UserEntity> userEntityCaptor = ArgumentCaptor.forClass(UserEntity.class);
        verify(passwordEncoder).encode(passwordCaptor.capture());
        verify(userRepository).save(userEntityCaptor.capture());
        UserEntity capturedEntity = userEntityCaptor.getValue();
        String capturedPassword = passwordCaptor.getValue();

        assertEquals(form.getPassword(), capturedPassword);
        assertEquals(form.getEmail(), capturedEntity.getEmail());
        assertEquals(encodedPass, capturedEntity.getPassword());
        assertEquals(form.getNickName(), capturedEntity.getNickName());

        assertEquals(userEntity, result);
    }

    private SignUpForm getSignUpForm() {
        return SignUpForm.builder()
                .email(EMAIL)
                .nickName(NICK)
                .password("pass")
                .build();
    }

    private UserEntity getUserEntity() {
        return UserEntity.builder()
                .email(EMAIL)
                .nickName(NICK)
                .build();
    }
}