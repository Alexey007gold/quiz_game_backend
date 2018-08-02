package com.epam.epmrduaqgv.back.service;

import com.epam.epmrduaqgv.back.entity.AnswerEntity;

import java.util.List;

public interface AnswerService {

    List<AnswerEntity> findByQuestionId(String questionId);

    void saveAnswer(String userId, String roundId, String questionId, String answerId);
}
