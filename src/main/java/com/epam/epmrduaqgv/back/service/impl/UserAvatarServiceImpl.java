package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.UserAvatarEntity;
import com.epam.epmrduaqgv.back.repository.UserAvatarRepository;
import com.epam.epmrduaqgv.back.service.UserAvatarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

@Service
public class UserAvatarServiceImpl implements UserAvatarService {

    @Autowired
    private UserAvatarRepository userAvatarRepository;

    private Set<String> supportedExtensions = new HashSet<>(Arrays.asList(".jpg", ".jpeg", ".png", ".gif"));

    @Transactional
    @Override
    public void updateAvatar(String userId, byte[] bytes, String name) {
        checkFileExtension(name);
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

    private void checkFileExtension(String name) {
        try {
            String extension = name.substring(name.lastIndexOf('.'));
            if (!supportedExtensions.contains(extension)) {
                throw new IllegalArgumentException("File is not supported!");
            }
        } catch (Exception e) {
            throw new IllegalArgumentException("File is not supported!");
        }

    }
}
