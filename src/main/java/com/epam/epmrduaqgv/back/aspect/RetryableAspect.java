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
        Retryable annotation = getRetryableAnnotation(joinPoint);
        Class<? extends Throwable>[] retryFor = annotation.retryForExceptions();
        int maxRetries = annotation.maxRetries();

        for (int i = 0; i < maxRetries; i++) {
            try {
                return joinPoint.proceed();
            } catch (Throwable e) {
                if (!shouldRetry(retryFor, e) || i + 1 == maxRetries) {
                    throw e;
                }
            }
        }
        throw new IllegalStateException("Server error");//should never happen
    }

    private Retryable getRetryableAnnotation(ProceedingJoinPoint joinPoint) {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        return signature.getMethod().getAnnotation(Retryable.class);
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
