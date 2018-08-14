package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.UserAvatarEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserAvatarRepository extends JpaRepository<UserAvatarEntity, String> {

    void removeByUserId(String userId);

    UserAvatarEntity findByUserId(String userId);

    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Query("UPDATE UserAvatarEntity ua " +
            "SET ua.value = :value " +
            "WHERE ua.userId = :userId")
    int updateByUserId(@Param("userId") String userId, @Param("value") byte[] value);
}
