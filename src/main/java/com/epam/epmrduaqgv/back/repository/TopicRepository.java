package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.TopicEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TopicRepository extends JpaRepository<TopicEntity, String> {

    TopicEntity findByName(String name);
}
