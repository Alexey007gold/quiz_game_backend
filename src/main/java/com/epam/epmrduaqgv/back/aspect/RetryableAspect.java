package com.epam.epmrduaqgv.back.aspect;

import com.epam.epmrduaqgv.back.aspect.annotation.Retryable;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import static org.springframework.core.Ordered.HIGHEST_PRECEDENCE;

@Aspect
@Component
@Order(HIGHEST_PRECEDENCE)
public class RetryableAspect {

    @Around("@annotation(com.epam.epmrduaqgv.back.aspect.annotation.Retryable)")
    public Object retryWhileNotSuccessfull(ProceedingJoinPoint joinPoint) throws Throwable {
        Class<? extends Throwable>[] retryFor = getRetryForClasses(joinPoint);
        while (true) {
            try {
                return joinPoint.proceed();
            } catch (Throwable e) {
                if (!shouldRetry(retryFor, e)) {
                    throw e;
                }
            }
        }
    }

    private Class<? extends Throwable>[] getRetryForClasses(ProceedingJoinPoint joinPoint) {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Retryable annotation = signature.getMethod().getAnnotation(Retryable.class);
        return annotation.retryForExceptions();
    }

    private boolean shouldRetry(Class<? extends Throwable>[] retryFor, Throwable actual) {
        for (Class<? extends Throwable> clazz : retryFor) {
            if (clazz.isInstance(actual)) {
                return true;
            }
        }
        return false;
    }
}
