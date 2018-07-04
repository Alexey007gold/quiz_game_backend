package com.epam.epmrduaqgv.back.service;

import com.epam.epmrduaqgv.back.entity.UserEntity;

public interface UserService {
    UserEntity findByEmail(String email);
}
