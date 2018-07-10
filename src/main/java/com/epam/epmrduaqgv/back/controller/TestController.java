package com.epam.epmrduaqgv.back.controller;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

@RestController
public class TestController {

    @GetMapping("health")
    public LocalDateTime health() {
        return LocalDateTime.now();
    }

    @ApiOperation(value = "Returns current date", authorizations = @Authorization(value = "oauth2"))
    @GetMapping("secureHealth")
    public LocalDateTime securedHealth() {
        return health();
    }

}
