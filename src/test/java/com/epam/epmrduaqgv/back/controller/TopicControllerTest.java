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
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.ArrayList;
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

        verify(topicService).findAllTopics();
        verify(objectMapper).convertValue(eq(topicEntityList), any(JavaType.class));
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

    @Test
    public void shouldCallServiceMethodsOnGetRandomTopicsForMatch() {
        String matchId = "some match id";
        int quantity = 3;
        List<TopicEntity> topicEntityList = getTopicEntityList(quantity);
        List<TopicDTO> topicDTOList = getTopicDTOList(quantity);
        TypeFactory typeFactory = TypeFactory.defaultInstance();
        when(topicService.getRandomTopicsForMatch(matchId, quantity)).thenReturn(topicEntityList);
        when(objectMapper.getTypeFactory()).thenReturn(typeFactory);
        when(objectMapper.convertValue(eq(topicEntityList), any(JavaType.class))).thenReturn(topicDTOList);

        List<TopicDTO> result = topicController.getRandomTopicsForMatch(matchId, quantity);

        verify(topicService).getRandomTopicsForMatch(matchId, quantity);
        verify(objectMapper).convertValue(eq(topicEntityList), any(JavaType.class));
        assertEquals(topicDTOList, result);
    }

    private List<TopicEntity> getTopicEntityList(int quantity) {
        List<TopicEntity> result = new ArrayList<>();
        for (int i = 0; i < quantity; i++) {
            result.add(mock(TopicEntity.class));
        }
        return result;
    }

    private List<TopicDTO> getTopicDTOList(int quantity) {
        List<TopicDTO> result = new ArrayList<>();
        for (int i = 0; i < quantity; i++) {
            result.add(mock(TopicDTO.class));
        }
        return result;
    }
}