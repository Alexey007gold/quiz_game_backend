package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.UserEntity;
import com.epam.epmrduaqgv.back.form.SignUpForm;
import com.epam.epmrduaqgv.back.repository.UserRepository;
import com.epam.epmrduaqgv.back.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@PropertySource("classpath:validation/validationMessages.properties")
public class UserServiceImpl implements UserService {

    @Value("${validation.message.user.email.unavailable}")
    private String EMAIL_USED_MESSAGE;
    @Value("${validation.message.user.nick_name.unavailable}")
    private String NICK_NAME_USED_MESSAGE;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserEntity findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public List<UserEntity> findTopScoresUserList(int top, Sort.Direction order) {
        return userRepository.findAll(PageRequest.of(0, top, order, "score"))
                .getContent();
    }

    public UserEntity findByNickName(String nickName) {
        return userRepository.findByNickName(nickName);
    }

    @Override
    public UserEntity findByEmailOrNickName(String email, String nickName) {
        return userRepository.findByEmailOrNickName(email, nickName);
    }

    @Override
    public UserEntity registerUser(SignUpForm form) {
        checkAvailability(form);

        String encodedPassword = passwordEncoder.encode(form.getPassword());
        UserEntity userEntity = UserEntity.builder()
                .email(form.getEmail())
                .password(encodedPassword)
                .nickName(form.getNickName())
                .build();
        return userRepository.save(userEntity);
    }

    private void checkAvailability(SignUpForm form) {
        UserEntity userEntity = userRepository.findByEmailOrNickName(form.getEmail(), form.getNickName());
        if (userEntity != null) {
            if (userEntity.getEmail().equals(form.getEmail())) {
                if (userEntity.getNickName().equals(form.getNickName())) {
                    throw new IllegalStateException(EMAIL_USED_MESSAGE + " " + NICK_NAME_USED_MESSAGE);
                }
                throw new IllegalStateException(EMAIL_USED_MESSAGE);
            }
            throw new IllegalStateException(NICK_NAME_USED_MESSAGE);
        }
    }
}
