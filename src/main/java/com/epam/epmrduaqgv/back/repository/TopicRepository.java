package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.TopicEntity;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TopicRepository extends JpaRepository<TopicEntity, String> {

    TopicEntity findByName(String name);

    @Query("SELECT t FROM TopicEntity t " +
            "WHERE t.id NOT IN (SELECT r.topicId FROM RoundEntity r WHERE r.matchId = :matchId) " +
            "ORDER BY function('RAND')")
    List<TopicEntity> getRandomTopicsForMatch(@Param("matchId") String matchId, Pageable pageable);
}
