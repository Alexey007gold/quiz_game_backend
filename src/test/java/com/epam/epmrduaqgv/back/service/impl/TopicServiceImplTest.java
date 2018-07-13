package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.TopicEntity;
import com.epam.epmrduaqgv.back.repository.TopicRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class TopicServiceImplTest {

    @InjectMocks
    private TopicServiceImpl topicService;

    @Mock
    private TopicRepository topicRepository;

    @Test
    public void findAllTopics() {
        TopicEntity mock = mock(TopicEntity.class);
        List<TopicEntity> list = Collections.singletonList(mock);
        when(topicRepository.findAll()).thenReturn(list);

        List<TopicEntity> result = topicService.findAllTopics();

        verify(topicRepository).findAll();
        assertEquals(list, result);
    }

    @Test
    public void findTopicById() {
        TopicEntity mock = mock(TopicEntity.class);
        String id = "id";
        when(topicRepository.findById(id)).thenReturn(Optional.of(mock));

        TopicEntity result = topicService.findTopicById(id);

        ArgumentCaptor<String> idCaptor = ArgumentCaptor.forClass(String.class);
        verify(topicRepository).findById(idCaptor.capture());

        assertEquals(id, idCaptor.getValue());
        assertEquals(mock, result);
    }

    @Test
    public void findTopicByName() {
        TopicEntity mock = mock(TopicEntity.class);
        String name = "topic";
        when(topicRepository.findByName(name)).thenReturn(mock);

        TopicEntity result = topicService.findTopicByName(name);

        ArgumentCaptor<String> nameCaptor = ArgumentCaptor.forClass(String.class);
        verify(topicRepository).findByName(nameCaptor.capture());

        assertEquals(name, nameCaptor.getValue());
        assertEquals(mock, result);
    }
}