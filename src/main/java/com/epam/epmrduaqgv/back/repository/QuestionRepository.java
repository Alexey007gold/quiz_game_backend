package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.QuestionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionRepository extends JpaRepository<QuestionEntity, String> {

    List<QuestionEntity> findByTopicId(String topicId);

    @Query("SELECT q FROM QuestionEntity q " +
            "JOIN TopicEntity t ON q.topicId = t.id " +
            "WHERE t.name = :topic_name")
    List<QuestionEntity> findByTopicName(@Param("topic_name") String topicName);
}
