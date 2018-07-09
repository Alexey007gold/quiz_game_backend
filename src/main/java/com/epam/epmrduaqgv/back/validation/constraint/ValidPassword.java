package com.epam.epmrduaqgv.back.validation.constraint;

import com.epam.epmrduaqgv.back.validation.validator.PasswordValidator;

import javax.validation.Constraint;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Documented
@Constraint(validatedBy = PasswordValidator.class)
@Target({METHOD, FIELD, PARAMETER})
@Retention(RUNTIME)
public @interface ValidPassword {
    String message() default "{validation.message.user.password.invalid}";

    Class[] groups() default {};

    Class[] payload() default {};
}