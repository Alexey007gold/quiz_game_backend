package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.UserAvatarEntity;
import com.epam.epmrduaqgv.back.repository.UserAvatarRepository;
import com.epam.epmrduaqgv.back.service.UserAvatarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserAvatarServiceImpl implements UserAvatarService {

    @Autowired
    private UserAvatarRepository userAvatarRepository;

    @Transactional
    @Override
    public void updateAvatar(String userId, byte[] bytes) {
        int result = userAvatarRepository.updateByUserId(userId, bytes);
        if (result != 1) {
            userAvatarRepository.save(UserAvatarEntity.builder()
                    .userId(userId)
                    .value(bytes)
                    .build());
        }
    }

    @Override
    public UserAvatarEntity getUserAvatar(String userId) {
        return userAvatarRepository.findByUserId(userId);
    }
}
