package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.form.SignUpForm;
import com.epam.epmrduaqgv.back.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
public class SignUpController {

    @Autowired
    private UserService userService;

    @PostMapping(path = "/register")
    public void register(@RequestBody @Valid SignUpForm form) {
        userService.registerUser(form);
    }
}
