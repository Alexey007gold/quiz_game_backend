package com.epam.epmrduaqgv.back.validation.validator;

import com.epam.epmrduaqgv.back.PropertyLoader;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.test.util.ReflectionTestUtils;

import java.io.IOException;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

@RunWith(MockitoJUnitRunner.class)
public class PasswordValidatorTest {

    private PasswordValidator passwordValidator;


    @Before
    public void setUp() throws IOException {
        passwordValidator = new PasswordValidator();

        String pattern = PropertyLoader.loadApplicationProperties().getProperty("validation.pattern.password");
        ReflectionTestUtils.setField(passwordValidator, "pattern", pattern);
    }

    @Test
    public void isValidWhenMatchesPattern() {
        assertTrue(passwordValidator.isValid("PaSsW2ss", null));
        assertTrue(passwordValidator.isValid("Ww2www@wcxs", null));
    }

    @Test
    public void isInvalidWhenDoesNotMatchPattern() {
        assertFalse(passwordValidator.isValid("pass", null));//too short
        assertFalse(passwordValidator.isValid("password", null));//No uppercase letters
        assertFalse(passwordValidator.isValid("PassWord", null));//no digits
        assertFalse(passwordValidator.isValid("p@ssw0rd", null));//no uppercase letters
    }

    @Test
    public void isInvalidIfNotNullableAndNullValueProvided() {
        assertFalse(passwordValidator.isValid(null, null));
    }

    @Test
    public void isValidIfNullableAndNullValueProvided() {
        ReflectionTestUtils.setField(passwordValidator, "nullable", true);

        assertTrue(passwordValidator.isValid(null, null));
    }
}