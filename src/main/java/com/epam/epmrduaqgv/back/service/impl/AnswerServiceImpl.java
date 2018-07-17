package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.AnswerEntity;
import com.epam.epmrduaqgv.back.repository.AnswerRepository;
import com.epam.epmrduaqgv.back.service.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnswerServiceImpl implements AnswerService {

    @Autowired
    private AnswerRepository answerRepository;

    @Override
    public List<AnswerEntity> findByQuestionId(String questionId) {
        return answerRepository.findByQuestionId(questionId);
    }
}
