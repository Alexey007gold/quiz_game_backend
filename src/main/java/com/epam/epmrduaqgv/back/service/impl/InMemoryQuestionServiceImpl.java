package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.AnswerEntity;
import com.epam.epmrduaqgv.back.entity.QuestionEntity;
import com.epam.epmrduaqgv.back.entity.TopicEntity;
import com.epam.epmrduaqgv.back.repository.AnswerRepository;
import com.epam.epmrduaqgv.back.repository.QuestionRepository;
import com.epam.epmrduaqgv.back.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.toList;

@Service
public class InMemoryQuestionServiceImpl implements QuestionService {

    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private AnswerRepository answerRepository;

    @Autowired
    private EntityManager entityManager;

    private Map<String, List<QuestionEntity>> questionsByTopicId;

    @PostConstruct
    public void init() {
        questionsByTopicId = questionRepository.findAll().stream()
                .collect(Collectors.groupingBy(questionEntity -> questionEntity.getTopicEntity().getId(),
                        HashMap::new, Collectors.mapping(Function.identity(), toList())));
    }

    @Transactional
    @Override
    public QuestionEntity addQuestion(String topicId, String question, List<String> answers, int correctAnswerIdx) {
        if (!questionsByTopicId.containsKey(topicId)) {
            throw new IllegalArgumentException(String.format("Topic with id '%s' does not exist", topicId));
        }
        TopicEntity topicEntityRef = entityManager.getReference(TopicEntity.class, topicId);
        QuestionEntity questionEntity = QuestionEntity.builder()
                .topicEntity(topicEntityRef)
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

        questionsByTopicId.computeIfAbsent(topicId, k -> new ArrayList<>()).add(questionEntity);
        return questionEntity;
    }

    @Override
    public List<QuestionEntity> findRandomQuestionsByTopicId(String topicId, int quantity) {
        List<QuestionEntity> byTopic = questionsByTopicId.get(topicId);
        if (byTopic == null) {
            throw new IllegalArgumentException(String.format("Topic with id '%s' does not exist", topicId));
        }
        int count = byTopic.size();
        if (count < quantity) {
            throw new IllegalStateException("There are less questions in the DB then needed");
        }

        return new Random().ints(0, count)
                .distinct()
                .limit(quantity)
                .mapToObj(byTopic::get)
                .collect(toList());
    }
}
