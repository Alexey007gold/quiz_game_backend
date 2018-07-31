package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.MatchEntity;
import com.epam.epmrduaqgv.back.model.MatchState;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MatchRepository extends JpaRepository<MatchEntity, String> {

    @Query("SELECT m FROM MatchEntity m " +
            "JOIN PlayerEntity p ON p.matchId = m.id " +
            "WHERE p.userId = :userId")
    Page<MatchEntity> findByPlayerWithUserId(@Param("userId") String userId, Pageable pageable);

    @Modifying
    @Query("UPDATE MatchEntity m " +
            "SET m.matchState = :matchState " +
            "WHERE m.id = :matchId")
    int updateMatchState(@Param("matchId") String matchId, @Param("matchState") MatchState matchState);
}
