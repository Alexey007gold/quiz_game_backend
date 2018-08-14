package com.epam.epmrduaqgv.back.service;

import com.epam.epmrduaqgv.back.entity.UserAvatarEntity;

public interface UserAvatarService {

    void updateAvatar(String userId, byte[] bytes, String name);

    UserAvatarEntity getUserAvatar(String userId);
}
