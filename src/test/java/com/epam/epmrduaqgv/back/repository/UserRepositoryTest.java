package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.UserEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

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
    @Sql("classpath:sql/add_users_with_scores.sql")
    public void shouldReturnResultsOnFindAllWithSorting() {
        PageRequest pageable1 = PageRequest.of(0, 7, Sort.Direction.DESC, "score");
        PageRequest pageable2 = PageRequest.of(0, 7, Sort.Direction.ASC, "score");
        List<UserEntity> result1 = userRepository.findAll(pageable1).getContent();
        List<UserEntity> result2 = userRepository.findAll(pageable2).getContent();

        for (int i = 0; i < result1.size() - 1; i++) {
            assertTrue(result1.get(i).getScore() >= result1.get(i + 1).getScore());
        }
        for (int i = 0; i < result2.size() - 1; i++) {
            assertTrue(result2.get(i).getScore() <= result2.get(i + 1).getScore());
        }
    }
}