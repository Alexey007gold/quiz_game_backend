package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.PlayerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PlayerRepository extends JpaRepository<PlayerEntity, String> {

    @Query("SELECT p FROM PlayerEntity p " +
            "JOIN MatchEntity m ON p.matchId = m.id " +
            "JOIN RoundEntity r ON r.matchId = m.id " +
            "WHERE p.userId = :userId AND r.id = :roundId")
    PlayerEntity findByRoundIdAndUserId(@Param("roundId") String roundId, @Param("userId") String userId);
}
