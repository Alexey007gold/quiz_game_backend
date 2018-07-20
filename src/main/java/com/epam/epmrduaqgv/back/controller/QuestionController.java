package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.dto.QuestionDTO;
import com.epam.epmrduaqgv.back.entity.QuestionEntity;
import com.epam.epmrduaqgv.back.service.QuestionService;
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
@RequestMapping("/questions")
public class QuestionController {

    @Autowired
    private QuestionService inMemoryQuestionServiceImpl;

    @Autowired
    private ObjectMapper objectMapper;

    @GetMapping("/random")
    @ApiOperation(value = "Get random questions by topicId", authorizations = @Authorization(value = "oauth2"))
    public List<QuestionDTO> getRandomQuestionsByTopic(@RequestParam("topicId") String topicId,
                                                       @RequestParam("quantity") int quantity) {
        List<QuestionEntity> questionEntities = inMemoryQuestionServiceImpl.findRandomQuestionsByTopicId(topicId, quantity);
        return objectMapper.convertValue(questionEntities, new TypeReference<List<QuestionDTO>>() {});
    }
}
