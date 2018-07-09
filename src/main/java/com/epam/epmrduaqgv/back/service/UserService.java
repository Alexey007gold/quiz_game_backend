package com.epam.epmrduaqgv.back.service;

import com.epam.epmrduaqgv.back.entity.UserEntity;
import com.epam.epmrduaqgv.back.form.SignUpForm;

public interface UserService {
    UserEntity findByEmail(String email);

    UserEntity findByNickName(String nickName);

    UserEntity findByEmailOrNickName(String email, String nickName);

    UserEntity registerUser(SignUpForm form);
}
