package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.TopicEntity;
import com.epam.epmrduaqgv.back.repository.TopicRepository;
import com.epam.epmrduaqgv.back.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TopicServiceImpl implements TopicService {

    @Autowired
    private TopicRepository topicRepository;

    @Override
    public List<TopicEntity> findAllTopics() {
        return topicRepository.findAll();
    }

    @Override
    public TopicEntity findTopicById(String id) {
        return topicRepository.findById(id).orElse(null);
    }

    @Override
    public TopicEntity findTopicByName(String name) {
        return topicRepository.findByName(name);
    }

    @Override
    public List<TopicEntity> getRandomTopicsForMatch(String matchId, Integer quantity) {
        List<TopicEntity> result = topicRepository.getRandomTopicsForMatch(matchId, PageRequest.of(0, quantity));
        if (result.size() < quantity) {
            throw new IllegalStateException(String.format("There were found only %s topics. Asked: %s",
                    result.size(), quantity));
        }
        return result;
    }
}
