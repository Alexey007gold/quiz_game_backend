package com.epam.epmrduaqgv.back.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.assertEquals;

@DataJpaTest
@RunWith(SpringRunner.class)
public class RoundScoresRepositoryTest {

    @Autowired
    private RoundScoresRepository roundScoresRepository;

    @Autowired
    private RoundRepository roundRepository;

    @Autowired
    private PlayerRepository playerRepository;

    @Test
    @Sql({"classpath:sql/add_topics.sql", "classpath:sql/add_users.sql",
            "classpath:sql/add_matches.sql", "classpath:sql/add_rounds.sql",
            "classpath:sql/add_round_scores.sql"})
    public void updateScore() {
        String roundId = roundRepository.findAll().stream()
                .filter(r -> r.getCreatedAt().toString().equals("2016-06-22T19:10:22Z"))
                .findFirst().get().getId();
        String playerId = playerRepository.findById("testPlayer1").get().getId();

        int result = roundScoresRepository.updateScore(roundId, playerId, 2);

        assertEquals(1, result);
    }
}