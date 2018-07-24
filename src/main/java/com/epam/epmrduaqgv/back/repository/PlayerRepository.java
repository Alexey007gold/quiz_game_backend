package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.PlayerEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PlayerRepository extends JpaRepository<PlayerEntity, String> {
}
