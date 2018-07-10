package com.epam.epmrduaqgv.back.service;

import com.epam.epmrduaqgv.back.entity.UserEntity;
import org.springframework.data.domain.Sort;

import java.util.List;

public interface UserService {
    UserEntity findByEmail(String email);

    List<UserEntity> findTopScoresUserList(int top, Sort.Direction order);
}
