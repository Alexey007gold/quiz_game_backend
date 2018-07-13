package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.dto.TopicDTO;
import com.epam.epmrduaqgv.back.entity.TopicEntity;
import com.epam.epmrduaqgv.back.exception.BadRequestException;
import com.epam.epmrduaqgv.back.service.TopicService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/topic")
public class TopicController {

    @Autowired
    private TopicService topicService;

    @Autowired
    private ObjectMapper objectMapper;

    @GetMapping("/all")
    @ApiOperation(value = "Get all topics", authorizations = @Authorization(value = "oauth2"))
    public List<TopicDTO> getAllTopics() {
        List<TopicEntity> topics = topicService.findAllTopics();

        CollectionType targetType = objectMapper.getTypeFactory().constructCollectionType(List.class, TopicDTO.class);
        return objectMapper.convertValue(topics, targetType);
    }

    @GetMapping
    @ApiOperation(value = "Query for topics", authorizations = @Authorization(value = "oauth2"))
    public TopicDTO findTopicByIdOrName(@RequestParam(value = "id", required = false) String id,
                                        @RequestParam(value = "name", required = false) String name) {
        if (id != null) {
            if (name != null) {
                throw new BadRequestException("'id' and 'name' should not be set at the same time");
            }
            return objectMapper.convertValue(topicService.findTopicById(id), TopicDTO.class);
        } else if (name != null) {
            return objectMapper.convertValue(topicService.findTopicByName(name), TopicDTO.class);
        } else {
            throw new BadRequestException("Either 'id' or 'name' parameter should be set");
        }
    }
}
