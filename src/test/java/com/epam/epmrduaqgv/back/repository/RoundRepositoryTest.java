package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.RoundEntity;
import com.epam.epmrduaqgv.back.model.RoundState;
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
@Sql({"classpath:sql/add_topics.sql", "classpath:sql/add_users.sql",
        "classpath:sql/add_matches.sql", "classpath:sql/add_rounds.sql"})
public class RoundRepositoryTest {

    @Autowired
    private MatchRepository matchRepository;

    @Autowired
    private RoundRepository roundRepository;

    @Autowired
    private UserRepository userRepository;

    @Test
    public void shouldReturnCorrectResultsOnFindByMatchId() {
        String matchId = matchRepository.findAll().stream()
                .filter(m -> m.getCreatedAt().toString().equals("2016-06-22T19:10:20Z"))
                .findFirst().get().getId();

        List<RoundEntity> result = roundRepository.findByMatchId(matchId, new Sort(Sort.Direction.ASC, "createdAt"));

        assertTrue(result.get(0).getCreatedAt().compareTo(result.get(1).getCreatedAt()) < 0);
    }

    @Test
    public void shouldReturnCorrectResultOnFindByRoundIdAndUserId() {
        String userId = userRepository.findByEmail("test1@gmail.com").getId();
        String roundId = roundRepository.findAll().stream()
                .filter(r -> r.getCreatedAt().toString().equals("2016-06-22T19:10:22Z"))
                .findFirst().get().getId();

        RoundEntity result = roundRepository.findByRoundIdAndUserId(roundId, userId);
        assertNotNull(result);
    }

    @Test
    public void shouldReturnCorrectResultOnFindAllMatchRoundsByRoundId() {
        String roundId = roundRepository.findAll().stream()
                .filter(r -> r.getCreatedAt().toString().equals("2016-06-22T19:10:22Z"))
                .findFirst().get().getId();

        List<RoundEntity> result = roundRepository.findAllMatchRoundsByRoundId(roundId, Sort.unsorted());

        assertEquals(2, result.size());
    }

    @Test
    public void shouldUpdateDBOnUpdateRoundState() {
        String roundId = roundRepository.findAll().stream()
                .filter(r -> r.getCreatedAt().toString().equals("2016-06-22T19:10:22Z"))
                .findFirst().get().getId();

        int result = roundRepository.updateRoundState(roundId, RoundState.IN_PROGRESS);

        assertEquals(1, result);
    }
}