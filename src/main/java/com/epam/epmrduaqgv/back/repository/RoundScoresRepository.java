package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.RoundScoresEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RoundScoresRepository extends JpaRepository<RoundScoresEntity, String> {

    RoundScoresEntity findByRoundIdAndPlayerId(String roundId, String playerId);

    @Modifying
    @Query("UPDATE RoundScoresEntity rs " +
            "SET rs.score = rs.score + :score " +
            "WHERE rs.roundId = :roundId AND rs.playerId = :playerId")
    int updateScore(@Param("roundId") String roundId, @Param("playerId") String playerId, @Param("score") int score);

    @Modifying
    @Query("UPDATE RoundScoresEntity rs " +
            "SET rs.score = 0 " +
            "WHERE rs.playerId IN :playerId")
    int updateScoreByPlayerIdToZero(@Param("playerId") List<String> playerIdList);
}
