package com.epam.epmrduaqgv.back.validation.validator;

import com.epam.epmrduaqgv.back.validation.constraint.ValidPassword;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class PasswordValidator implements ConstraintValidator<ValidPassword, String> {

    @Value("${validation.pattern.password}")
    private String pattern;

    @Value("${validation.nullable.nick_name}")
    private boolean nullable;

    @Override
    public boolean isValid(String password, ConstraintValidatorContext context) {
        if (StringUtils.isBlank(password)) {
            return nullable;
        }

        return password.matches(pattern);
    }
}