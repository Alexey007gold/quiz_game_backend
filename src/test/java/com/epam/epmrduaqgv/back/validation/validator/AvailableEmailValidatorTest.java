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
public class AvailableEmailValidatorTest {

    private static final String EMAIL = "email";

    @InjectMocks
    private AvailableEmailValidator availableEmailValidator;

    @Mock
    private UserService userService;

    @Test
    public void shouldReturnFalseIfAccountIsFound() {
        UserEntity userEntity = UserEntity.builder().build();
        when(userService.findByEmail(EMAIL)).thenReturn(userEntity);

        boolean result = availableEmailValidator.isValid(EMAIL, null);

        assertFalse(result);
    }

    @Test
    public void shouldReturnTrueIfAccountIsNotFound() {
        boolean result = availableEmailValidator.isValid(EMAIL, null);

        assertTrue(result);
    }
}