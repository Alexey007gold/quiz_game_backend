package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.AnswerEntity;
import com.epam.epmrduaqgv.back.repository.AnswerRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.Collections;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class AnswerServiceImplTest {

    @InjectMocks
    private AnswerServiceImpl answerService;

    @Mock
    private AnswerRepository answerRepository;

    @Test
    public void shouldDelegateToRepositoryOnFindByQuestionId() {
        String questionId = "some id";
        AnswerEntity answerEntity = getAnswerEntity();
        List<AnswerEntity> entityList = Collections.singletonList(answerEntity);
        when(answerRepository.findByQuestionId(questionId)).thenReturn(entityList);

        List<AnswerEntity> result = answerService.findByQuestionId(questionId);

        verify(answerRepository).findByQuestionId(questionId);
        assertEquals(entityList, result);
    }

    private AnswerEntity getAnswerEntity() {
        return AnswerEntity.builder()
                .value("answer")
                .correct(true)
                .build();
    }
}