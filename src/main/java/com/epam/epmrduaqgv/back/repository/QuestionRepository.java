package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.QuestionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionRepository extends JpaRepository<QuestionEntity, String> {

    List<QuestionEntity> findByTopicEntityId(String topicId);

    List<QuestionEntity> findByTopicEntityName(String topicName);
}
