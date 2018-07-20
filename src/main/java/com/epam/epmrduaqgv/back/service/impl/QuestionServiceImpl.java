package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.AnswerEntity;
import com.epam.epmrduaqgv.back.entity.QuestionEntity;
import com.epam.epmrduaqgv.back.entity.TopicEntity;
import com.epam.epmrduaqgv.back.repository.AnswerRepository;
import com.epam.epmrduaqgv.back.repository.QuestionRepository;
import com.epam.epmrduaqgv.back.repository.TopicRepository;
import com.epam.epmrduaqgv.back.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import static java.util.stream.Collectors.toList;

@Service
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private TopicRepository topicRepository;

    @Autowired
    private AnswerRepository answerRepository;

    @Transactional
    @Override
    public QuestionEntity addQuestion(String topicId, String question, List<String> answers, int correctAnswerIdx) {
        Optional<TopicEntity> topic = topicRepository.findById(topicId);
        if (!topic.isPresent()) {
            throw new IllegalArgumentException(String.format("Topic with id '%s' does not exist", topicId));
        }
        QuestionEntity questionEntity = QuestionEntity.builder()
                .topicEntity(topic.get())
                .value(question)
                .build();

        String questionEntityId = questionRepository.save(questionEntity).getId();
        String correctAnswer = answers.get(correctAnswerIdx);

        answerRepository.saveAll(answers.stream()
                .map(answer -> AnswerEntity.builder()
                        .questionId(questionEntityId)
                        .value(answer)
                        .correct(answer.equals(correctAnswer))
                        .build())
                .collect(toList()));
        return questionEntity;
    }

    @Override
    public List<QuestionEntity> findRandomQuestionsByTopicId(String topicId, int quantity) {
        int count = (int) questionRepository.count();
        if (count < quantity) {
            throw new IllegalStateException("There are less questions in the DB then needed");
        }

        return new Random().ints(0, count)
                .distinct()
                .limit(quantity)
                .mapToObj(i -> {
                    PageRequest pageRequest = PageRequest.of(i, 1);
                    return questionRepository.findAll(pageRequest).getContent().get(0);
                })
                .collect(toList());
    }
}
