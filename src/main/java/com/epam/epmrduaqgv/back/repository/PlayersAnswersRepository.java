package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.PlayersAnswersEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlayersAnswersRepository extends JpaRepository<PlayersAnswersEntity, String> {
    List<PlayersAnswersEntity> findByRoundId(String roundId);
}
