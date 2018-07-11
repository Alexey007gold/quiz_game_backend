package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.dto.UserDTO;
import com.epam.epmrduaqgv.back.entity.UserEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends JpaRepository<UserEntity, String> {

    UserEntity findByEmail(String email);

    UserEntity findByNickName(String nickName);

    UserEntity findByEmailOrNickName(String email, String nickName);

    @Query("SELECT new com.epam.epmrduaqgv.back.dto.UserDTO(u.email, u.nickName, COALESCE(s.score, 0)) " +
            "FROM UserEntity u " +
            "LEFT JOIN ScoreEntity s ON u.id = s.userEntity.id AND s.topicEntity.id = :topic_id " +
            "WHERE EXISTS (SELECT id FROM TopicEntity tp WHERE tp.id = :topic_id)")
    Page<UserDTO> findScoresByTopicId(@Param("topic_id") String topicId, Pageable pageable);

    @Query("SELECT new com.epam.epmrduaqgv.back.dto.UserDTO(u.email, u.nickName, COALESCE(s.score, 0)) " +
            "FROM UserEntity u " +
            "LEFT JOIN ScoreEntity s " +
                "ON u.id = s.userEntity.id AND s.topicEntity.id = " +
                    "(SELECT id FROM TopicEntity t WHERE t.name = :topic_name) " +
            "WHERE EXISTS (SELECT id FROM TopicEntity tp WHERE tp.name = :topic_name)")
    Page<UserDTO> findScoresByTopicName(@Param("topic_name") String topicName, Pageable pageable);

    @Query("SELECT new com.epam.epmrduaqgv.back.dto.UserDTO(u.email, u.nickName, SUM(COALESCE(s.score, 0))) " +
            "FROM UserEntity u " +
                "LEFT JOIN ScoreEntity s ON u.id = s.userEntity.id " +
                "LEFT JOIN TopicEntity t ON t.id = s.topicEntity.id " +
            "GROUP BY u.email, u.nickName")
    Page<UserDTO> findTotalScores(Pageable pageable);
}
