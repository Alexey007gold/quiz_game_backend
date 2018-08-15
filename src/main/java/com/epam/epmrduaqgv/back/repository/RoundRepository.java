package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.RoundEntity;
import com.epam.epmrduaqgv.back.model.RoundState;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RoundRepository extends JpaRepository<RoundEntity, String> {
    List<RoundEntity> findByMatchId(String matchId, Sort sort);

    @Query("SELECT r FROM RoundEntity r " +
            "JOIN MatchEntity m ON r.matchId = m.id " +
            "JOIN PlayerEntity p ON p.matchId = m.id " +
            "WHERE p.userId = :userId AND r.id = :roundId")
    RoundEntity findByRoundIdAndUserId(@Param("roundId") String roundId, @Param("userId") String userId);

    @Query("SELECT r FROM RoundEntity r " +
            "WHERE r.matchId = (SELECT r.matchId FROM RoundEntity r WHERE r.id = :roundId) ")
    List<RoundEntity> findAllMatchRoundsByRoundId(@Param("roundId") String roundId, Sort sort);

    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Query("UPDATE RoundEntity r " +
            "SET r.roundState = :roundState " +
            "WHERE r.id = :roundId")
    int updateRoundState(@Param("roundId") String roundId, @Param("roundState") RoundState roundState);

    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Query("UPDATE RoundEntity r " +
            "SET r.roundState = :roundState " +
            "WHERE r.id IN :roundId")
    int updateRoundState(@Param("roundId") List<String> roundId, @Param("roundState") RoundState roundState);
}
