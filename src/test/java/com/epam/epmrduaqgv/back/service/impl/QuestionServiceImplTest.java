package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.AnswerEntity;
import com.epam.epmrduaqgv.back.entity.QuestionEntity;
import com.epam.epmrduaqgv.back.entity.TopicEntity;
import com.epam.epmrduaqgv.back.repository.AnswerRepository;
import com.epam.epmrduaqgv.back.repository.QuestionRepository;
import com.epam.epmrduaqgv.back.repository.TopicRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.mockito.stubbing.Answer;
import org.springframework.data.domain.AbstractPageRequest;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.*;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class    QuestionServiceImplTest {

    @InjectMocks
    private QuestionServiceImpl questionService;

    @Mock
    private QuestionRepository questionRepository;

    @Mock
    private AnswerRepository answerRepository;

    @Mock
    private TopicRepository topicRepository;

    @Test
    @SuppressWarnings("unchecked")
    public void shouldCallRepositoriesMethodsOnAddQuestion() {
        String id = "some_id";
        String topicId = "some_topic_id";
        String question = "question";
        TopicEntity topicEntity = TopicEntity.builder().id(topicId).build();
        when(topicRepository.findById(any())).thenReturn(Optional.of(topicEntity));
        when(questionRepository.save(any())).then((Answer<QuestionEntity>) invocation -> {
            QuestionEntity questionEntity = invocation.getArgument(0);
            questionEntity.setId(id);
            return questionEntity;
        });

        List<String> answers = Arrays.asList("1", "2", "3");
        int correctAnswerId = 1;


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
    }

    @Test
    public void shouldCallRepositoryOnFindRandomQuestionsByTopicId() {
        when(questionRepository.count()).thenReturn(100L);
        String topicId = "some_topic_id";
        TopicEntity topicEntity = TopicEntity.builder().id(topicId).build();
        QuestionEntity questionEntity = QuestionEntity.builder()
                .id("id")
                .topicEntity(topicEntity)
                .value("question")
                .build();
        PageImpl<QuestionEntity> page = new PageImpl<>(Collections.singletonList(questionEntity));
        when(questionRepository.findAll(any(Pageable.class))).thenReturn(page);

        List<QuestionEntity> result = questionService.findRandomQuestionsByTopicId(topicId, 4);

        verify(questionRepository).count();

        ArgumentCaptor<PageRequest> pageRequestArgumentCaptor = ArgumentCaptor.forClass(PageRequest.class);
        verify(questionRepository, times(4)).findAll(pageRequestArgumentCaptor.capture());
        List<PageRequest> pageRequestArguments = pageRequestArgumentCaptor.getAllValues();
        assertEquals(4, result.size());
        for (QuestionEntity entity: result) {
            assertEquals(questionEntity, entity);
        }
        pageRequestArguments.sort(Comparator.comparingInt(AbstractPageRequest::getPageNumber));
        for (int i = 0; i < pageRequestArguments.size() - 1; i++) {
            assertNotEquals(pageRequestArguments.get(i), pageRequestArguments.get(i + 1));
        }
    }

    @Test(expected = IllegalStateException.class)
    public void shouldThrowAnExceptionOnFindRandomQuestionsByTopicId() {
        when(questionRepository.count()).thenReturn(10L);

        questionService.findRandomQuestionsByTopicId("some_topic_id", 11);
    }

    @Test
    public void shouldReturnDifferentResultsOnFindRandomQuestionsByTopicId() {
        when(questionRepository.count()).thenReturn(100L);
        String topicId = "some_topic_id";
        TopicEntity topicEntity = TopicEntity.builder().id(topicId).build();
        QuestionEntity questionEntity = QuestionEntity.builder()
                .id("id")
                .topicEntity(topicEntity)
                .value("question")
                .build();
        PageImpl<QuestionEntity> page = new PageImpl<>(Collections.singletonList(questionEntity));
        when(questionRepository.findAll(any(Pageable.class))).thenReturn(page);

        List<QuestionEntity> result1 = questionService.findRandomQuestionsByTopicId(topicId, 4);
        List<QuestionEntity> result2 = questionService.findRandomQuestionsByTopicId(topicId, 4);

        verify(questionRepository, times(2)).count();

        ArgumentCaptor<PageRequest> pageRequestArgumentCaptor = ArgumentCaptor.forClass(PageRequest.class);
        verify(questionRepository, times(8)).findAll(pageRequestArgumentCaptor.capture());
        List<PageRequest> pageRequestArguments = pageRequestArgumentCaptor.getAllValues();
        List<PageRequest> firstFour = new ArrayList<>(4);
        List<PageRequest> lastFour = new ArrayList<>(4);
        for (int i = 0; i < 4; i++) {
            firstFour.add(pageRequestArguments.get(i));
        }
        for (int i = 4; i < pageRequestArguments.size(); i++) {
            lastFour.add(pageRequestArguments.get(i));
        }
        assertEquals(4, result1.size());
        assertEquals(4, result2.size());
        firstFour.sort(Comparator.comparingInt(AbstractPageRequest::getPageNumber));
        lastFour.sort(Comparator.comparingInt(AbstractPageRequest::getPageNumber));
        assertNotEquals(firstFour, lastFour);
    }

}