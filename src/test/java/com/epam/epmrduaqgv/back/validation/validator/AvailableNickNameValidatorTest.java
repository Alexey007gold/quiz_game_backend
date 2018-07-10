package com.epam.epmrduaqgv.back.validation.validator;

import com.epam.epmrduaqgv.back.entity.UserEntity;
import com.epam.epmrduaqgv.back.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class AvailableNickNameValidatorTest {

    private static final String NICK_NAME = "nick";

    @InjectMocks
    private AvailableNickNameValidator availableNickNameValidator;

    @Mock
    private UserService userService;

    @Test
    public void shouldReturnFalseIfAccountIsFound() {
        UserEntity userEntity = UserEntity.builder().build();
        when(userService.findByNickName(NICK_NAME)).thenReturn(userEntity);

        boolean result = availableNickNameValidator.isValid(NICK_NAME, null);

        assertFalse(result);
    }

    @Test
    public void shouldReturnTrueIfAccountIsNotFound() {
        boolean result = availableNickNameValidator.isValid(NICK_NAME, null);

        assertTrue(result);
    }
}