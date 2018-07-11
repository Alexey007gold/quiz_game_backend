package com.epam.epmrduaqgv.back.service;

import com.epam.epmrduaqgv.back.dto.UserDTO;
import com.epam.epmrduaqgv.back.entity.UserEntity;
import com.epam.epmrduaqgv.back.form.SignUpForm;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;

public interface UserService {
    UserEntity findByEmail(String email);

    Page<UserDTO> findTotalScores(int page, int pageSize, Sort.Direction order);

    Page<UserDTO> findScoresByTopicId(String topicId, int page, int pageSize, Sort.Direction order);

    Page<UserDTO> findScoresByTopicName(String topicName, int page, int pageSize, Sort.Direction order);

    UserEntity findByNickName(String nickName);

    UserEntity findByEmailOrNickName(String email, String nickName);

    UserEntity registerUser(SignUpForm form);
}
