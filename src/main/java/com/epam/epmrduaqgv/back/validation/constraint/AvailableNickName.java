package com.epam.epmrduaqgv.back.validation.constraint;

import com.epam.epmrduaqgv.back.validation.validator.AvailableNickNameValidator;

import javax.validation.Constraint;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Documented
@Constraint(validatedBy = AvailableNickNameValidator.class)
@Target({METHOD, FIELD, PARAMETER})
@Retention(RUNTIME)
public @interface AvailableNickName {
    String message() default "{validation.message.user.nick_name.unavailable}";

    Class[] groups() default {};

    Class[] payload() default {};
}