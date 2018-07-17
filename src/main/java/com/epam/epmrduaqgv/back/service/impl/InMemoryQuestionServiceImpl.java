package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.AnswerEntity;
import com.epam.epmrduaqgv.back.entity.QuestionEntity;
import com.epam.epmrduaqgv.back.repository.AnswerRepository;
import com.epam.epmrduaqgv.back.repository.QuestionRepository;
import com.epam.epmrduaqgv.back.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.*;

@Service
public class InMemoryQuestionServiceImpl implements QuestionService {

    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private AnswerRepository answerRepository;

    private Map<String, List<QuestionEntity>> questionsByTopicId;

    @PostConstruct
    public void init() {
        questionsByTopicId = new HashMap<>();
        List<QuestionEntity> allQuestions = questionRepository.findAll();
        for (QuestionEntity question: allQuestions) {
            List<QuestionEntity> byTopic = questionsByTopicId
                    .computeIfAbsent(question.getTopicId(), k -> new ArrayList<>());
            byTopic.add(question);
        }

    }

    @Transactional
    @Override
    public QuestionEntity addQuestion(String topicId, String question, List<String> answers, int correctAnswerId) {
        QuestionEntity questionEntity = QuestionEntity.builder()
                .topicId(topicId)
                .value(question)
                .build();
        questionEntity = questionRepository.save(questionEntity);
        List<AnswerEntity> answerEntityList = new ArrayList<>(answers.size());
        for (int i = 0; i < answers.size(); i++) {
            answerEntityList.add(AnswerEntity.builder()
                    .questionId(questionEntity.getId())
                    .value(answers.get(i))
                    .correct(i == correctAnswerId)
                    .build());
        }
        answerRepository.saveAll(answerEntityList);


        List<QuestionEntity> byTopic = questionsByTopicId
                .computeIfAbsent(questionEntity.getTopicId(), k -> new ArrayList<>());
        byTopic.add(questionEntity);
        return questionEntity;
    }

    @Override
    public List<QuestionEntity> findRandomQuestionsByTopicId(String topicId, int quantity) {
        List<QuestionEntity> byTopic = questionsByTopicId.get(topicId);
        int count = byTopic.size();
        if (count < quantity) {
            throw new IllegalStateException("There are less questions in the DB then needed");
        }

        //get different random indices
        List<Integer> randomPos = new ArrayList<>(quantity);
        Random random = new Random();
        while (randomPos.size() < quantity) {
            int anInt = random.nextInt(count);
            if (!randomPos.contains(anInt)) {
                randomPos.add(anInt);
            }
        }

        List<QuestionEntity> result = new ArrayList<>(quantity);
        for (int i = 0; i < quantity; i++) {
            result.add(byTopic.get(randomPos.get(i)));
        }
        return result;
    }
}
