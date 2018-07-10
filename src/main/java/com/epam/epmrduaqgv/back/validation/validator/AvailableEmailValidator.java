package com.epam.epmrduaqgv.back.validation.validator;

import com.epam.epmrduaqgv.back.entity.UserEntity;
import com.epam.epmrduaqgv.back.service.UserService;
import com.epam.epmrduaqgv.back.validation.constraint.AvailableEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

@Component
public class AvailableEmailValidator implements ConstraintValidator<AvailableEmail, String> {

    @Autowired
    private UserService userService;

    /**
     * Email is valid if it is not used by any user
     */
    @Override
    public boolean isValid(String email, ConstraintValidatorContext context) {
        UserEntity userEntity = userService.findByEmail(email);
        return userEntity == null;
    }
}