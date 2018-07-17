package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.dto.AnswerDTO;
import com.epam.epmrduaqgv.back.dto.QuestionDTO;
import com.epam.epmrduaqgv.back.entity.AnswerEntity;
import com.epam.epmrduaqgv.back.service.AnswerService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/answers")
public class AnswerController {

    @Autowired
    private AnswerService answerService;

    @Autowired
    private ObjectMapper objectMapper;

    @GetMapping
    @ApiOperation(value = "Get answers by question id", authorizations = @Authorization(value = "oauth2"))
    public List<QuestionDTO> getRandomQuestionsByTopic(@RequestParam("questionId") String questionId) {
        List<AnswerEntity> answerEntities = answerService.findByQuestionId(questionId);
        return objectMapper.convertValue(answerEntities, new TypeReference<List<AnswerDTO>>() {});
    }
}
