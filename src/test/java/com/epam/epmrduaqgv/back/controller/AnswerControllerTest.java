package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.dto.AnswerDTO;
import com.epam.epmrduaqgv.back.entity.AnswerEntity;
import com.epam.epmrduaqgv.back.service.AnswerService;
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
public class AnswerControllerTest {

    @InjectMocks
    private AnswerController answerController;

    @Mock
    private AnswerService answerService;

    @Mock
    private ObjectMapper objectMapper;

    @Test
    public void shouldCallServicesOnGetAnswersByQuestionId() {
        String id = "id";
        List<AnswerEntity> answerEntities = Collections.singletonList(AnswerEntity.builder()
                .value("some answer")
                .build());
        List<AnswerDTO> answerDTOS = Collections.singletonList(AnswerDTO.builder()
                .value("some answer")
                .build());
        when(answerService.findByQuestionId(id)).thenReturn(answerEntities);
        when(objectMapper.convertValue(eq(answerEntities), any(TypeReference.class))).thenReturn(answerDTOS);

        List<AnswerDTO> result = answerController.getAnswersByQuestionId(id);

        verify(answerService).findByQuestionId(id);
        verify(objectMapper).convertValue(eq(answerEntities), any(TypeReference.class));
        assertEquals(answerDTOS, result);
    }
}