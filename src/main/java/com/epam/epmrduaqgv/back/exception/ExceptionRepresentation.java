package com.epam.epmrduaqgv.back.exception;

public class ExceptionRepresentation {

    private String message;

    public ExceptionRepresentation(Exception exception) {
        this.message = exception.getMessage();
    }

    public String getMessage() {
        return message;
    }
}
