package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.exception.ExceptionRepresentation;
import com.epam.epmrduaqgv.back.validation.ValidationFailure;
import com.epam.epmrduaqgv.back.validation.ValidationFailureBuilder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import static org.springframework.core.annotation.AnnotatedElementUtils.findMergedAnnotation;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ValidationFailure invalidUserError(MethodArgumentNotValidException exception) {
        return ValidationFailureBuilder.fromBindingErrors(exception.getBindingResult());
    }

    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity<ExceptionRepresentation> runtimeException(RuntimeException e) {
        return new ResponseEntity<>(new ExceptionRepresentation(e), resolveAnnotatedResponseStatus(e));
    }

    @ExceptionHandler(AccessDeniedException.class)
    @ResponseBody
    public ResponseEntity<ExceptionRepresentation> runtimeException(AccessDeniedException e) {
        return new ResponseEntity<>(new ExceptionRepresentation(e), HttpStatus.FORBIDDEN);
    }

    private HttpStatus resolveAnnotatedResponseStatus(Exception exception) {
        ResponseStatus annotation = findMergedAnnotation(exception.getClass(), ResponseStatus.class);
        return annotation == null ? HttpStatus.INTERNAL_SERVER_ERROR : annotation.value();
    }

}
