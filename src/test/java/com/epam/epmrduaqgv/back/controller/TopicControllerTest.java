package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.dto.TopicDTO;
import com.epam.epmrduaqgv.back.entity.TopicEntity;
import com.epam.epmrduaqgv.back.exception.BadRequestException;
import com.epam.epmrduaqgv.back.service.TopicService;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.Collections;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class TopicControllerTest {

    @InjectMocks
    private TopicController topicController;

    @Mock
    private TopicService topicService;

    @Mock
    private ObjectMapper objectMapper;

    @Test
    public void shouldCallServiceMethodsOnGetAllTopics() {
        TopicEntity topicEntityMock = mock(TopicEntity.class);
        List<TopicEntity> topicEntityList = Collections.singletonList(topicEntityMock);
        TopicDTO topicDTOMock = mock(TopicDTO.class);
        List<TopicDTO> topicDTOList = Collections.singletonList(topicDTOMock);
        TypeFactory typeFactory = TypeFactory.defaultInstance();

        when(topicService.findAllTopics()).thenReturn(topicEntityList);
        when(objectMapper.getTypeFactory()).thenReturn(typeFactory);
        when(objectMapper.convertValue(eq(topicEntityList), any(JavaType.class))).thenReturn(topicDTOList);

        List<TopicDTO> result = topicController.getAllTopics();

        ArgumentCaptor<List<TopicEntity>> captor = ArgumentCaptor.forClass(topicEntityList.getClass());
        verify(topicService).findAllTopics();
        verify(objectMapper).convertValue(captor.capture(), any(JavaType.class));
        assertEquals(topicEntityList, captor.getValue());
        assertEquals(topicDTOList, result);
    }

    @Test(expected = BadRequestException.class)
    public void shouldThrowExceptionOnFindTopicByIdOrNameWhenBothParamsAreNull() {
        topicController.findTopicByIdOrName(null, null);
    }

    @Test(expected = BadRequestException.class)
    public void shouldThrowExceptionOnFindTopicByIdOrNameWhenBothParamsAreSet() {
        topicController.findTopicByIdOrName("id", "name");
    }

    @Test
    public void shouldCallServiceMethodsOnFindTopicByIdOrNameWhenIdIsSet() {
        String id = "id";
        TopicEntity topicEntity = mock(TopicEntity.class);
        TopicDTO topicDTO = mock(TopicDTO.class);
        when(topicService.findTopicById(id)).thenReturn(topicEntity);
        when(objectMapper.convertValue(topicEntity, TopicDTO.class)).thenReturn(topicDTO);

        TopicDTO result = topicController.findTopicByIdOrName(id, null);

        verify(topicService).findTopicById(id);
        verify(objectMapper).convertValue(topicEntity, TopicDTO.class);
        assertEquals(result, topicDTO);
    }

    @Test
    public void shouldCallServiceMethodsOnFindTopicByIdOrNameWhenNameIsSet() {
        String name = "name";
        TopicEntity topicEntity = mock(TopicEntity.class);
        TopicDTO topicDTO = mock(TopicDTO.class);
        when(topicService.findTopicByName(name)).thenReturn(topicEntity);
        when(objectMapper.convertValue(topicEntity, TopicDTO.class)).thenReturn(topicDTO);

        TopicDTO result = topicController.findTopicByIdOrName(null, name);

        verify(topicService).findTopicByName(name);
        verify(objectMapper).convertValue(topicEntity, TopicDTO.class);
        assertEquals(result, topicDTO);
    }
}