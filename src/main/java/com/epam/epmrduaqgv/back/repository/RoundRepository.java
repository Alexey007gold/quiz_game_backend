package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.RoundEntity;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoundRepository extends JpaRepository<RoundEntity, String> {
    List<RoundEntity> findByMatchId(String matchId, Sort sort);
}
