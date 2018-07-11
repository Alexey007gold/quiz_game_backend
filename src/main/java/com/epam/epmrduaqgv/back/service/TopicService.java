package com.epam.epmrduaqgv.back.service;

import com.epam.epmrduaqgv.back.entity.TopicEntity;

import java.util.List;

public interface TopicService {
    List<TopicEntity> findAllTopics();

    TopicEntity findTopicById(String id);

    TopicEntity findTopicByName(String id);
}
