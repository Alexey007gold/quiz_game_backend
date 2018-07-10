package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.UserEntity;
import com.epam.epmrduaqgv.back.repository.UserRepository;
import com.epam.epmrduaqgv.back.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserEntity findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public List<UserEntity> findTopScoresUserList(int top, Sort.Direction order) {
        return userRepository.findAll(PageRequest.of(0, top, order, "score"))
                .getContent();
    }
}
