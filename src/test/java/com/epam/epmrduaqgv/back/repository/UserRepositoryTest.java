package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.UserEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

@DataJpaTest
@RunWith(SpringRunner.class)
public class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;

    @Test
    public void shouldReturnSavedEntityOnSave() {
        UserEntity entity = UserEntity.builder()
                .email("email")
                .password("pass")
                .nickName("nick")
                .build();

        UserEntity result = userRepository.save(entity);

        assertNotNull(result.getId());
    }

    @Test
    @Sql("classpath:sql/add_users.sql")
    public void shouldReturnCorrectEntityOnFindByEmailOrNickName() {
        UserEntity result1 = userRepository.findByEmailOrNickName("test2@gmail.com", "not_existent_nick");
        UserEntity result2 = userRepository.findByEmailOrNickName("not_existent_email", "test_user3");
        UserEntity result3 = userRepository.findByEmailOrNickName("not_existent_email", "not_existent_nick");

        assertNotNull(result1);
        assertNotNull(result2);
        assertNull(result3);
    }
}