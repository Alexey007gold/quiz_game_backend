package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.TopicEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Arrays;
import java.util.List;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.fail;

@DataJpaTest
@RunWith(SpringRunner.class)
public class TopicRepositoryTest {

    @Autowired
    private TopicRepository topicRepository;

    @Autowired
    private MatchRepository matchRepository;

    @Test
    @Sql({"classpath:sql/add_topics.sql", "classpath:sql/add_users.sql",
            "classpath:sql/add_matches.sql", "classpath:sql/add_rounds.sql"})
    public void shouldReturnCorrectResultsOnGetRandomTopicsForMatch() {
        List<String> usedTopics = Arrays.asList("Ukraine history", "EPAM in location");

        String matchId = matchRepository.findAll().stream()
                .filter(m -> m.getCreatedAt().toString().equals("2016-06-22T19:10:20Z"))
                .findFirst().get().getId();

        List<TopicEntity> result = topicRepository.getRandomTopicsForMatch(matchId, PageRequest.of(0, 3));

        assertFalse(result.stream().anyMatch(t -> usedTopics.contains(t.getName())));

        //check that results are different (fail if 20 requests give the same result)
        for (int i = 0; i < 20; i++) {
            List<TopicEntity> res = topicRepository.getRandomTopicsForMatch(matchId, PageRequest.of(0, 3));
            if (!res.equals(result)) {
                return;
            }
        }
        fail();
    }
}