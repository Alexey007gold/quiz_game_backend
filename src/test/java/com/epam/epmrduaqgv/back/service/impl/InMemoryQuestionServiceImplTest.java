package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.AnswerEntity;
import com.epam.epmrduaqgv.back.entity.QuestionEntity;
import com.epam.epmrduaqgv.back.entity.TopicEntity;
import com.epam.epmrduaqgv.back.repository.AnswerRepository;
import com.epam.epmrduaqgv.back.repository.QuestionRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.mockito.stubbing.Answer;
import org.springframework.test.util.ReflectionTestUtils;

import javax.persistence.EntityManager;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import static java.util.stream.Collectors.toList;
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

    @Mock
    private EntityManager entityManager;

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
        ReflectionTestUtils.setField(questionService, "questionsByTopicId", getQuestionsMap(topicId, 1));
        when(entityManager.getReference(any(), any())).thenReturn(TopicEntity.builder().id(topicId).build());
        when(questionRepository.save(any())).then((Answer<QuestionEntity>) invocation -> {
            QuestionEntity argument = invocation.getArgument(0);
            argument.setId(id);
            return argument;
        });

        List<String> answers = Arrays.asList("1", "2", "3");


        questionService.addQuestion(topicId, question, answers, correctAnswerId);


        ArgumentCaptor<QuestionEntity> questionEntityArgumentCaptor = ArgumentCaptor.forClass(QuestionEntity.class);
        ArgumentCaptor<List<AnswerEntity>> answerEntityArgumentCaptor = ArgumentCaptor.forClass(List.class);
        verify(questionRepository).save(questionEntityArgumentCaptor.capture());
        verify(answerRepository).saveAll(answerEntityArgumentCaptor.capture());

        QuestionEntity questionEntityArgument = questionEntityArgumentCaptor.getValue();
        List<AnswerEntity> answerEntityListArgument = answerEntityArgumentCaptor.getValue();

        assertEquals(question, questionEntityArgument.getValue());
        assertEquals(topicId, questionEntityArgument.getTopicEntity().getId());

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
        assertEquals(2, questionsByTopicId.get(topicId).size());
        assertEquals(questionEntityArgument, questionsByTopicId.get(topicId).get(1));
    }

    @Test
    public void shouldNotCallRepositoryOnFindRandomQuestionsByTopicId() {
        String topicId = "some_topic_id";
        ReflectionTestUtils.setField(questionService, "questionsByTopicId", getQuestionsMap(topicId, 100));

        List<QuestionEntity> result1 = questionService.findRandomQuestionsByTopicId(topicId, 4);
        List<QuestionEntity> result2 = questionService.findRandomQuestionsByTopicId(topicId, 4);

        verify(questionRepository, times(0)).findByTopicEntityId(any());
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
        return IntStream.range(0, quantity)
                .mapToObj(i -> {
                    TopicEntity topicEntity = TopicEntity.builder().id(topicId).build();
                    return QuestionEntity.builder()
                            .topicEntity(topicEntity)
                            .value(String.valueOf(i))
                            .build();
                }).collect(Collectors.groupingBy(questionEntity -> questionEntity.getTopicEntity().getId(),
                        HashMap::new, Collectors.mapping(Function.identity(), toList())));
    }
}