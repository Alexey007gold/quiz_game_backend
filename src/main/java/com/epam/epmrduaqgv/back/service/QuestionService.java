package com.epam.epmrduaqgv.back.service;

import com.epam.epmrduaqgv.back.entity.QuestionEntity;

import java.util.List;

public interface QuestionService {

    QuestionEntity addQuestion(String topicId, String question, List<String> answers, int correctAnswerId);

    List<QuestionEntity> findRandomQuestionsByTopicId(String topicId, int quantity);
}
