package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<UserEntity, String> {

    UserEntity findByEmail(String email);
}
