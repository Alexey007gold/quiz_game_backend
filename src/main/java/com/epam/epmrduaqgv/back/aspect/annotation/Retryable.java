package com.epam.epmrduaqgv.back.aspect.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Retryable {

    Class<? extends Throwable>[] retryForExceptions() default Throwable.class;

    int maxRetries() default 2;
}