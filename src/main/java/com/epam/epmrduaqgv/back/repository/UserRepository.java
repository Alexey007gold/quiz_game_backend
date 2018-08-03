package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.dto.UserDTO;
import com.epam.epmrduaqgv.back.entity.UserEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends JpaRepository<UserEntity, String> {

    UserEntity findByEmail(String email);

    UserEntity findByNickName(String nickName);

    UserEntity findByEmailOrNickName(String email, String nickName);

    @Query("SELECT new com.epam.epmrduaqgv.back.dto.UserDTO(u.email, u.nickName, SUM(COALESCE(rs.score, 0))) " +
            "FROM UserEntity u " +
            "   LEFT JOIN PlayerEntity p ON p.userId = u.id " +
            "   LEFT JOIN RoundScoresEntity rs ON rs.playerId = p.id " +
            "       AND (SELECT r.topicId FROM RoundEntity r WHERE rs.roundId = r.id) = :topic_id " +
            "WHERE EXISTS (SELECT id FROM TopicEntity tp WHERE tp.id = :topic_id)" +
            "GROUP BY u.email")
    Page<UserDTO> findScoresByTopicId(@Param("topic_id") String topicId, Pageable pageable);

    @Query("SELECT new com.epam.epmrduaqgv.back.dto.UserDTO(u.email, u.nickName, SUM(COALESCE(rs.score, 0))) " +
            "FROM UserEntity u " +
            "   LEFT JOIN PlayerEntity p ON p.userId = u.id " +
            "   LEFT JOIN RoundScoresEntity rs ON rs.playerId = p.id " +
            "       AND (SELECT r.topicId FROM RoundEntity r WHERE rs.roundId = r.id) = " +
            "           (SELECT id FROM TopicEntity t WHERE t.name = :topic_name) " +
            "WHERE EXISTS (SELECT id FROM TopicEntity tp WHERE tp.name = :topic_name)" +
            "GROUP BY u.email")
    Page<UserDTO> findScoresByTopicName(@Param("topic_name") String topicName, Pageable pageable);

    @Query("SELECT new com.epam.epmrduaqgv.back.dto.UserDTO(u.email, u.nickName, SUM(COALESCE(rs.score, 0))) " +
            "FROM UserEntity u " +
            "   LEFT JOIN PlayerEntity p ON p.userId = u.id " +
            "   LEFT JOIN RoundScoresEntity rs ON rs.playerId = p.id " +
            "GROUP BY u.email")
    Page<UserDTO> findTotalScores(Pageable pageable);

    @Query("SELECT new com.epam.epmrduaqgv.back.dto.UserDTO(u.email, u.nickName, SUM(COALESCE(rs.score, 0))) " +
            "FROM PlayerEntity p " +
            "   LEFT JOIN RoundScoresEntity rs ON rs.playerId = p.id " +
            "   LEFT JOIN UserEntity u ON p.userId = u.id " +
            "WHERE rs.roundId = :round_id " +
            "GROUP BY u.email, u.nickName")
    List<UserDTO> findScoresByRoundId(@Param("round_id") String roundId, Sort sort);

    @Query("SELECT new com.epam.epmrduaqgv.back.dto.UserDTO(u.email, u.nickName, SUM(COALESCE(rs.score, 0))) " +
            "FROM PlayerEntity p " +
            "   LEFT JOIN RoundScoresEntity rs ON rs.playerId = p.id " +
            "   LEFT JOIN UserEntity u ON p.userId = u.id " +
            "   LEFT JOIN MatchEntity m ON p.matchId = m.id " +
            "WHERE m.id = :match_id " +
            "GROUP BY u.email, u.nickName")
    List<UserDTO> findScoresByMatchId(@Param("match_id") String matchId, Sort pageable);
}
