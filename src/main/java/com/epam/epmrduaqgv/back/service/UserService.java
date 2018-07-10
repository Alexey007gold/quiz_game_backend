package com.epam.epmrduaqgv.back.service;

import com.epam.epmrduaqgv.back.entity.UserEntity;
import org.springframework.data.domain.Sort;

import java.util.List;
import com.epam.epmrduaqgv.back.form.SignUpForm;

public interface UserService {
    UserEntity findByEmail(String email);

    List<UserEntity> findTopScoresUserList(int top, Sort.Direction order);

    UserEntity findByNickName(String nickName);

    UserEntity findByEmailOrNickName(String email, String nickName);

    UserEntity registerUser(SignUpForm form);
}
