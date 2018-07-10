package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.dto.UserDTO;
import com.epam.epmrduaqgv.back.entity.UserEntity;
import com.epam.epmrduaqgv.back.service.UserService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ScoresController {

    @Autowired
    private UserService userService;

    @Autowired
    private ObjectMapper objectMapper;

    @GetMapping("/scores")
    public List<UserDTO> getHighScores(@RequestParam(value = "top", defaultValue = "10") int top,
                   @RequestParam(value = "order", defaultValue = "DESC") Sort.Direction order) {
        List<UserEntity> topScores = userService.findTopScoresUserList(top, order);
        return objectMapper.convertValue(topScores, new TypeReference<List<UserDTO>>() {});
    }
}
