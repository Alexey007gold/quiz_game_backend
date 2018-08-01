package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.MatchEntity;
import com.epam.epmrduaqgv.back.model.MatchState;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MatchRepository extends JpaRepository<MatchEntity, String> {

    @Query("SELECT m FROM MatchEntity m " +
            "JOIN PlayerEntity p ON p.matchId = m.id " +
            "WHERE p.userId = :userId")
    Page<MatchEntity> findByPlayerWithUserId(@Param("userId") String userId, Pageable pageable);

    @Query("SELECT m FROM MatchEntity m " +
            "JOIN PlayerEntity p ON p.matchId = m.id " +
            "WHERE p.userId = :userId AND m.matchState IN :matchState")
    List<MatchEntity> findByPlayerWithUserIdAndMatchStateIn(@Param("userId") String userId,
                                                            @Param("matchState") List<MatchState> matchStateList);

    @Query("SELECT m FROM MatchEntity m " +
            "JOIN PlayerEntity p ON p.matchId = m.id " +
            "WHERE p.userId = :userId AND m.matchState NOT IN :matchState")
    List<MatchEntity> findByPlayerWithUserIdAndMatchStateNotIn(@Param("userId") String userId,
                                                            @Param("matchState") List<MatchState> matchStateList);

    @Query("SELECT m FROM MatchEntity m " +
            "JOIN PlayerEntity p ON p.matchId = m.id " +
            "WHERE p.userId = :userId AND m.matchState != :matchState")
    List<MatchEntity> findByPlayerWithUserIdAndMatchStateNot(@Param("userId") String userId,
                                                            @Param("matchState") MatchState matchState);

    @Query("SELECT m FROM MatchEntity m " +
            "JOIN PlayerEntity p ON p.matchId = m.id " +
            "GROUP BY m.id " +
            "HAVING COUNT(p.id) < :playersNumber")
    List<MatchEntity> findWithPlayersNumberLessThan(@Param("playersNumber") Long playersNumber);

    @Query("SELECT m FROM MatchEntity m " +
            "JOIN PlayerEntity p ON p.matchId = m.id " +
            "WHERE ((SELECT COUNT(p) FROM PlayerEntity p WHERE p.matchId = m.id) < :playersNumber) AND " +
            "   :userId NOT IN (SELECT p.userId FROM PlayerEntity p WHERE p.matchId = m.id) " +
            "GROUP BY m.id ")
    List<MatchEntity> findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(@Param("playersNumber") Long playersNumber,
                                                                                   @Param("userId") String userId);
}
