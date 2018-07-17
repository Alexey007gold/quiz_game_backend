package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.dto.QuestionDTO;
import com.epam.epmrduaqgv.back.entity.QuestionEntity;
import com.epam.epmrduaqgv.back.service.QuestionService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.Collections;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class QuestionControllerTest {

    @InjectMocks
    private QuestionController questionController;

    @Mock
    private QuestionService inMemoryQuestionServiceImpl;

    @Mock
    private ObjectMapper objectMapper;

    @Test
    public void shouldCallServicesOnGetRandomQuestionsByTopic() {
        String id = "id";
        int quantity = 2;
        List<QuestionEntity> questionEntities = Collections.singletonList(QuestionEntity.builder()
                .value("some question")
                .build());
        List<QuestionDTO> questionDTOS = Collections.singletonList(QuestionDTO.builder()
                .value("some question")
                .build());
        when(inMemoryQuestionServiceImpl.findRandomQuestionsByTopicId(id, quantity)).thenReturn(questionEntities);
        when(objectMapper.convertValue(eq(questionEntities), any(TypeReference.class))).thenReturn(questionDTOS);

        List<QuestionDTO> result = questionController.getRandomQuestionsByTopic(id, quantity);

        verify(inMemoryQuestionServiceImpl).findRandomQuestionsByTopicId(id, quantity);
        verify(objectMapper).convertValue(eq(questionEntities), any(TypeReference.class));
        assertEquals(questionDTOS, result);
    }
}