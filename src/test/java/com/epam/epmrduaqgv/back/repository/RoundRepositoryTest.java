package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.RoundEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.domain.Sort;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.*;

@DataJpaTest
@RunWith(SpringRunner.class)
public class RoundRepositoryTest {

    @Autowired
    private MatchRepository matchRepository;

    @Autowired
    private RoundRepository roundRepository;

    @Test
    @Sql({"classpath:sql/add_topics.sql", "classpath:sql/add_users.sql",
            "classpath:sql/add_matches.sql", "classpath:sql/add_rounds.sql"})
    public void shouldReturnCorrectResultsOnFindByMatchId() {
        String matchId = matchRepository.findAll().stream()
            .filter(m -> m.getCreatedAt().toString().equals("2016-06-22T19:10:20Z"))
            .findFirst().get().getId();

        List<RoundEntity> result = roundRepository.findByMatchId(matchId, new Sort(Sort.Direction.ASC, "createdAt"));

        assertTrue(result.get(0).getCreatedAt().compareTo(result.get(1).getCreatedAt()) < 0);
    }
}