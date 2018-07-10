package com.epam.epmrduaqgv.back.validation.validator;

import com.epam.epmrduaqgv.back.entity.UserEntity;
import com.epam.epmrduaqgv.back.service.UserService;
import com.epam.epmrduaqgv.back.validation.constraint.AvailableNickName;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class AvailableNickNameValidator implements ConstraintValidator<AvailableNickName, String> {

    @Autowired
    private UserService userService;

    /**
     * NickName is valid if it is not used by any user
     */
    @Override
    public boolean isValid(String nickName, ConstraintValidatorContext context) {
        UserEntity userEntity = userService.findByNickName(nickName);
        return userEntity == null;
    }
}