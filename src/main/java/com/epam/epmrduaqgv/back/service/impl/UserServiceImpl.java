package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.dto.UserDTO;
import com.epam.epmrduaqgv.back.entity.UserEntity;
import com.epam.epmrduaqgv.back.form.SignUpForm;
import com.epam.epmrduaqgv.back.repository.UserRepository;
import com.epam.epmrduaqgv.back.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.JpaSort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@PropertySource("classpath:validation/validationMessages.properties")
public class UserServiceImpl implements UserService {

    private static final String SUM_SCORE_FIELD = "SUM(COALESCE(rs.score, 0))";

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
    public Page<UserDTO> findTotalScores(int page, int pageSize, Sort.Direction order) {
        JpaSort jpaSort = JpaSort.unsafe(order, SUM_SCORE_FIELD);
        return userRepository.findTotalScores(PageRequest.of(page, pageSize, jpaSort));
    }

    @Override
    public Page<UserDTO> findScoresByTopicId(String topicId, int page, int pageSize, Sort.Direction order) {
        JpaSort jpaSort = JpaSort.unsafe(order, SUM_SCORE_FIELD);
        return userRepository.findScoresByTopicId(topicId, PageRequest.of(page, pageSize, jpaSort));
    }

    @Override
    public Page<UserDTO> findScoresByTopicName(String topicName, int page, int pageSize, Sort.Direction order) {
        JpaSort jpaSort = JpaSort.unsafe(order, SUM_SCORE_FIELD);
        return userRepository.findScoresByTopicName(topicName, PageRequest.of(page, pageSize, jpaSort));
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
