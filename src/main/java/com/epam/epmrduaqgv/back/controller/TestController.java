package com.epam.epmrduaqgv.back.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

@RestController
public class TestController {

    @GetMapping("health")
    public LocalDateTime health() {
        return LocalDateTime.now();
    }


    @GetMapping("secureHealth")
    public LocalDateTime securedHealth() {
        return health();
    }

}
