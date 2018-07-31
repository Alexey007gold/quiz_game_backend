package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.PlayerEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.assertNotNull;

@DataJpaTest
@RunWith(SpringRunner.class)
public class PlayerRepositoryTest {

    @Autowired
    private RoundRepository roundRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PlayerRepository playerRepository;

    @Test
    @Sql({"classpath:sql/add_topics.sql", "classpath:sql/add_users.sql",
            "classpath:sql/add_matches.sql", "classpath:sql/add_rounds.sql"})
    public void shouldReturnCorrectResultOnFindByRoundIdAndUserId() {
        String userId = userRepository.findByEmail("test1@gmail.com").getId();
        String roundId = roundRepository.findAll().stream()
                .filter(r -> r.getCreatedAt().toString().equals("2016-06-22T19:10:22Z"))
                .findFirst().get().getId();

        PlayerEntity result = playerRepository.findByRoundIdAndUserId(roundId, userId);
        assertNotNull(result);
    }
}