package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.AnswerEntity;
import com.epam.epmrduaqgv.back.entity.QuestionEntity;
import com.epam.epmrduaqgv.back.repository.AnswerRepository;
import com.epam.epmrduaqgv.back.repository.QuestionRepository;
import com.epam.epmrduaqgv.back.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private AnswerRepository answerRepository;

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
        return questionEntity;
    }

    @Override
    public List<QuestionEntity> findRandomQuestionsByTopicId(String topicId, int quantity) {
        int count = (int) questionRepository.count();
        if (count < quantity) {
            throw new IllegalStateException("There are less questions in the DB then needed");
        }

        List<Integer> randomPos = new ArrayList<>(quantity);
        List<QuestionEntity> result = new ArrayList<>(quantity);

        //get different random indices
        Random random = new Random();
        while (randomPos.size() < quantity) {
            int anInt = random.nextInt(count);
            if (!randomPos.contains(anInt)) {
                randomPos.add(anInt);
            }
        }

        for (int i = 0; i < quantity; i++) {
            PageRequest pageRequest = PageRequest.of(randomPos.get(i), 1);
            result.add(questionRepository.findAll(pageRequest).getContent().get(0));
        }
        return result;
    }
}
