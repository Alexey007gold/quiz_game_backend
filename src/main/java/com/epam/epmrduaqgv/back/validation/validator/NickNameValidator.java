package com.epam.epmrduaqgv.back.validation.validator;

import com.epam.epmrduaqgv.back.validation.constraint.ValidNickName;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class NickNameValidator implements ConstraintValidator<ValidNickName, String> {

    @Value("${validation.pattern.nick_name}")
    private String pattern;

    @Value("${validation.nullable.nick_name}")
    private boolean nullable;

    @Override
    public boolean isValid(String nickName, ConstraintValidatorContext context) {
        if (StringUtils.isBlank(nickName)) {
            return nullable;
        }

        return nickName.matches(pattern);
    }
}