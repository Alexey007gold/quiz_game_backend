package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.UserAvatarEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserAvatarRepository extends JpaRepository<UserAvatarEntity, String> {

    void removeByUserId(String userId);

    UserAvatarEntity findByUserId(String userId);
}
