package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.dto.UserDTO;
import com.epam.epmrduaqgv.back.entity.UserEntity;
import com.epam.epmrduaqgv.back.form.SignUpForm;
import com.epam.epmrduaqgv.back.repository.UserRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Collections;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class UserServiceImplTest {

    private static final String EMAIL = "email";
    private static final String NICK = "testUser";
    private static final String SCORE_FIELD = "COALESCE(s.score, 0)";
    private static final String SUM_SCORE_FIELD = "SUM(COALESCE(s.score, 0))";

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
    public void shouldDelegateToRepositoryOnFindTotalScores() {
        PageImpl<UserDTO> page = new PageImpl<>(Collections.singletonList(getUserDTO()));
        when(userRepository.findTotalScores(any(Pageable.class))).thenReturn(page);

        Page<UserDTO> result = userService.findTotalScores(0, 6, Sort.Direction.DESC);


        ArgumentCaptor<Pageable> argumentCaptor = ArgumentCaptor.forClass(Pageable.class);
        verify(userRepository).findTotalScores(argumentCaptor.capture());
        Pageable capturedArg = argumentCaptor.getValue();

        assertEquals(0, capturedArg.getPageNumber());
        assertEquals(6, capturedArg.getPageSize());
        assertEquals(Sort.Direction.DESC, capturedArg.getSort().getOrderFor(SUM_SCORE_FIELD).getDirection());
        assertEquals(page, result);
    }

    @Test
    public void shouldDelegateToRepositoryOnFindScoresByTopicId() {
        PageImpl<UserDTO> page = new PageImpl<>(Collections.singletonList(getUserDTO()));
        when(userRepository.findScoresByTopicId(any(), any(Pageable.class))).thenReturn(page);

        Page<UserDTO> result = userService.findScoresByTopicId("some id", 0, 6, Sort.Direction.DESC);


        ArgumentCaptor<String> idCaptor = ArgumentCaptor.forClass(String.class);
        ArgumentCaptor<Pageable> pageableCaptor = ArgumentCaptor.forClass(Pageable.class);
        verify(userRepository).findScoresByTopicId(idCaptor.capture(), pageableCaptor.capture());
        Pageable capturedPageable = pageableCaptor.getValue();
        String capturedId = idCaptor.getValue();

        assertEquals(0, capturedPageable.getPageNumber());
        assertEquals(6, capturedPageable.getPageSize());
        assertEquals("some id", capturedId);
        assertEquals(Sort.Direction.DESC, capturedPageable.getSort().getOrderFor(SCORE_FIELD).getDirection());
        assertEquals(page, result);
    }

    @Test
    public void shouldDelegateToRepositoryOnFindScoresByTopicName() {
        PageImpl<UserDTO> page = new PageImpl<>(Collections.singletonList(getUserDTO()));
        when(userRepository.findScoresByTopicName(any(), any(Pageable.class))).thenReturn(page);

        Page<UserDTO> result = userService.findScoresByTopicName("cool topic", 0, 6, Sort.Direction.DESC);


        ArgumentCaptor<String> nameCaptor = ArgumentCaptor.forClass(String.class);
        ArgumentCaptor<Pageable> argumentCaptor = ArgumentCaptor.forClass(Pageable.class);
        verify(userRepository).findScoresByTopicName(nameCaptor.capture(), argumentCaptor.capture());
        Pageable capturedPageable = argumentCaptor.getValue();
        String capturedName = nameCaptor.getValue();

        assertEquals(0, capturedPageable.getPageNumber());
        assertEquals(6, capturedPageable.getPageSize());
        assertEquals("cool topic", capturedName);
        assertEquals(Sort.Direction.DESC, capturedPageable.getSort().getOrderFor(SCORE_FIELD).getDirection());
        assertEquals(page, result);
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

    private UserDTO getUserDTO() {
        return UserDTO.builder()
                .email(EMAIL)
                .nickName(NICK)
                .build();
    }
}