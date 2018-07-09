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
public class NickNameValidatorTest {

    private NickNameValidator nickNameValidator;


    @Before
    public void setUp() throws IOException {
        nickNameValidator = new NickNameValidator();

        String pattern = PropertyLoader.loadApplicationProperties().getProperty("validation.pattern.nick_name");
        ReflectionTestUtils.setField(nickNameValidator, "pattern", pattern);
    }

    @Test
    public void isValidWhenMatchesPattern() {
        assertTrue(nickNameValidator.isValid("Nick", null));
        assertTrue(nickNameValidator.isValid("Nick Ivanov", null));
    }

    @Test
    public void isInvalidWhenDoesNotMatchPattern() {
        assertFalse(nickNameValidator.isValid("Ni©k", null));
        assertFalse(nickNameValidator.isValid("N", null));
    }

    @Test
    public void isInvalidIfNotNullableAndNullValueProvided() {
        assertFalse(nickNameValidator.isValid(null, null));
    }

    @Test
    public void isValidIfNullableAndNullValueProvided() {
        ReflectionTestUtils.setField(nickNameValidator, "nullable", true);

        assertTrue(nickNameValidator.isValid(null, null));
    }
}