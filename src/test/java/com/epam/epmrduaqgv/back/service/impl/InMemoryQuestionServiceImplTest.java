package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.AnswerEntity;
import com.epam.epmrduaqgv.back.entity.QuestionEntity;
import com.epam.epmrduaqgv.back.repository.AnswerRepository;
import com.epam.epmrduaqgv.back.repository.QuestionRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.test.util.ReflectionTestUtils;

import java.util.*;

import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class InMemoryQuestionServiceImplTest {

    @InjectMocks
    private InMemoryQuestionServiceImpl questionService;

    @Mock
    private QuestionRepository questionRepository;

    @Mock
    private AnswerRepository answerRepository;

    @Test
    @SuppressWarnings("unchecked")
    public void shouldLoadDataFromDBOnInit() {
        String topic = "some_topic";
        List<QuestionEntity> questionEntities = getQuestionsMap(topic, 100).get(topic);
        when(questionRepository.findAll()).thenReturn(questionEntities);

        assertNull(ReflectionTestUtils.getField(questionService, null, "questionsByTopicId"));

        questionService.init();

        verify(questionRepository).findAll();
        Map<String, List<QuestionEntity>> questionsByTopicId = (Map<String, List<QuestionEntity>>)
                ReflectionTestUtils.getField(questionService, null, "questionsByTopicId");
        assertTrue(questionsByTopicId.get(topic).containsAll(questionEntities));
    }

    @Test
    @SuppressWarnings("unchecked")
    public void shouldCallRepositoriesMethodsOnAddQuestion() {
        ReflectionTestUtils.setField(questionService, "questionsByTopicId", new HashMap<>());
        String id = "some_id";
        String topicId = "some_topic_id";
        String question = "question";
        int correctAnswerId = 1;
        QuestionEntity questionEntity = QuestionEntity.builder()
                .id(id)
                .topicId(topicId)
                .value(question)
                .build();
        when(questionRepository.save(any())).thenReturn(questionEntity);

        List<String> answers = Arrays.asList("1", "2", "3");


        questionService.addQuestion(topicId, question, answers, correctAnswerId);


        ArgumentCaptor<QuestionEntity> questionEntityArgumentCaptor = ArgumentCaptor.forClass(QuestionEntity.class);
        ArgumentCaptor<List<AnswerEntity>> answerEntityArgumentCaptor = ArgumentCaptor.forClass(List.class);
        verify(questionRepository).save(questionEntityArgumentCaptor.capture());
        verify(answerRepository).saveAll(answerEntityArgumentCaptor.capture());

        QuestionEntity questionEntityArgument = questionEntityArgumentCaptor.getValue();
        List<AnswerEntity> answerEntityListArgument = answerEntityArgumentCaptor.getValue();

        assertEquals(question, questionEntityArgument.getValue());
        assertEquals(topicId, questionEntityArgument.getTopicId());

        assertEquals(answers.size(), answerEntityListArgument.size());
        for (int i = 0; i < answerEntityListArgument.size(); i++) {
            AnswerEntity answerEntity = answerEntityListArgument.get(i);
            assertEquals(answers.get(i), answerEntity.getValue());
            assertEquals(id, answerEntity.getQuestionId());
            boolean correct = (i == correctAnswerId);
            assertEquals(correct, answerEntity.isCorrect());
        }

        //question was also added to the cache
        Map<String, List<QuestionEntity>> questionsByTopicId = (Map<String, List<QuestionEntity>>)
                ReflectionTestUtils.getField(questionService, null, "questionsByTopicId");
        assertEquals(1, questionsByTopicId.get(topicId).size());
        assertEquals(questionEntity, questionsByTopicId.get(topicId).get(0));
    }

    @Test
    public void shouldNotCallRepositoryOnFindRandomQuestionsByTopicId() {
        String topicId = "some_topic_id";
        ReflectionTestUtils.setField(questionService, "questionsByTopicId", getQuestionsMap(topicId, 100));

        List<QuestionEntity> result1 = questionService.findRandomQuestionsByTopicId(topicId, 4);
        List<QuestionEntity> result2 = questionService.findRandomQuestionsByTopicId(topicId, 4);

        verify(questionRepository, times(0)).findByTopicId(any());
        assertEquals(4, result1.size());
        assertEquals(4, result2.size());
        assertNotEquals(result1, result2);
    }

    @Test(expected = IllegalStateException.class)
    public void shouldThrowAnExceptionOnFindRandomQuestionsByTopicId() {
        String topicId = "some_topic_id";
        ReflectionTestUtils.setField(questionService, "questionsByTopicId", getQuestionsMap(topicId, 10));

        questionService.findRandomQuestionsByTopicId(topicId, 11);
    }

    @Test
    public void shouldReturnResultInDifferentOrderOnFindRandomQuestionsByTopicId() {
        //when the requested quantity of answers in the same as actual number of questions
        //we will always get the same set of questions but in different order
        String topicId = "some_topic_id";
        ReflectionTestUtils.setField(questionService, "questionsByTopicId", getQuestionsMap(topicId, 10));

        List<QuestionEntity> result1 = questionService.findRandomQuestionsByTopicId(topicId, 10);
        List<QuestionEntity> result2 = questionService.findRandomQuestionsByTopicId(topicId, 10);

        assertNotEquals(result1, result2);

        result1.sort(Comparator.comparing(QuestionEntity::getValue));
        result2.sort(Comparator.comparing(QuestionEntity::getValue));

        assertEquals(result1, result2);
    }

    private HashMap<String, List<QuestionEntity>> getQuestionsMap(String topicId, int quantity) {
        HashMap<String, List<QuestionEntity>> map = new HashMap<>();
        List<QuestionEntity> questionEntities = new ArrayList<>();
        for (int i = 0; i < quantity; i++) {
            questionEntities.add(QuestionEntity.builder()
                    .topicId(topicId)
                    .value(String.valueOf(i))
                    .build());
        }
        map.put(topicId, questionEntities);
        return map;
    }
}