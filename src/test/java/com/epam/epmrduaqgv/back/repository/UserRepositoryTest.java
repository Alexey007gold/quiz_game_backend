package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.dto.UserDTO;
import com.epam.epmrduaqgv.back.entity.UserEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.JpaSort;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.*;

@DataJpaTest
@RunWith(SpringRunner.class)
public class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TopicRepository topicRepository;

    @Autowired
    private RoundRepository roundRepository;

    @Autowired
    private MatchRepository matchRepository;

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

    @Test
    @Sql({"classpath:sql/add_topics.sql", "classpath:sql/add_users.sql",
            "classpath:sql/add_matches.sql", "classpath:sql/add_rounds.sql",
            "classpath:sql/add_round_scores.sql"})
    public void shouldReturnCorrectResultsOnFindScoresByTopicId() {
        String topicId1 = topicRepository.findByName("Ukraine history").getId();
        String topicId2 = topicRepository.findByName("EPAM in location").getId();

        Sort sort = JpaSort.unsafe(Sort.Direction.DESC, "SUM(COALESCE(rs.score, 0))");
        Page<UserDTO> result1 = userRepository.findScoresByTopicId(topicId1, PageRequest.of(0, 30, sort));
        Page<UserDTO> result2 = userRepository.findScoresByTopicId(topicId2, PageRequest.of(0, 30, sort));

        assertEquals(10, result1.getNumberOfElements());
        assertEquals(10, result2.getNumberOfElements());

        assertEquals(9L, (long) result1.getContent().get(0).getScore());
        assertEquals(3L, (long) result1.getContent().get(1).getScore());
        assertEquals(6L, (long) result2.getContent().get(0).getScore());
        assertEquals(6L, (long) result2.getContent().get(1).getScore());
    }

    @Test
    @Sql({"classpath:sql/add_topics.sql", "classpath:sql/add_users.sql",
            "classpath:sql/add_matches.sql", "classpath:sql/add_rounds.sql",
            "classpath:sql/add_round_scores.sql"})
    public void shouldReturnCorrectResultsOnFindScoresByTopicName() {
        String topic1 = "Ukraine history";
        String topic2 = "EPAM in location";

        Sort sort = JpaSort.unsafe(Sort.Direction.DESC, "SUM(COALESCE(rs.score, 0))");
        Page<UserDTO> result1 = userRepository.findScoresByTopicName(topic1, PageRequest.of(0, 30, sort));
        Page<UserDTO> result2 = userRepository.findScoresByTopicName(topic2, PageRequest.of(0, 30, sort));

        assertEquals(10, result1.getNumberOfElements());
        assertEquals(10, result2.getNumberOfElements());

        assertEquals(9L, (long) result1.getContent().get(0).getScore());
        assertEquals(3L, (long) result1.getContent().get(1).getScore());
        assertEquals(6L, (long) result2.getContent().get(0).getScore());
        assertEquals(6L, (long) result2.getContent().get(1).getScore());
    }

    @Test
    @Sql({"classpath:sql/add_topics.sql", "classpath:sql/add_users.sql",
            "classpath:sql/add_matches.sql", "classpath:sql/add_rounds.sql",
            "classpath:sql/add_round_scores.sql"})
    public void shouldReturnCorrectResultsOnFindTotalScores() {
        Sort sort = JpaSort.unsafe(Sort.Direction.DESC, "SUM(COALESCE(rs.score, 0))");
        Page<UserDTO> result = userRepository.findTotalScores(PageRequest.of(0, 30, sort));

        assertEquals(10, result.getNumberOfElements());

        assertEquals(15L, (long) result.getContent().get(0).getScore());
        assertEquals(9L, (long) result.getContent().get(1).getScore());
    }

    @Test
    @Sql({"classpath:sql/add_topics.sql", "classpath:sql/add_users.sql",
            "classpath:sql/add_matches.sql", "classpath:sql/add_rounds.sql",
            "classpath:sql/add_round_scores.sql"})
    public void shouldReturnCorrectResultsOnFindScoresByRoundId() {
        String roundId1 = roundRepository.findAll().stream()
                .filter(r -> r.getCreatedAt().toString().equals("2016-06-22T19:10:22Z"))
                .findFirst().get().getId();
        String roundId2 = roundRepository.findAll().stream()
                .filter(r -> r.getCreatedAt().toString().equals("2016-06-22T19:10:20Z"))
                .findFirst().get().getId();

        Sort sort = JpaSort.unsafe(Sort.Direction.DESC, "SUM(COALESCE(rs.score, 0))");
        List<UserDTO> result1 = userRepository.findScoresByRoundId(roundId1, sort);
        List<UserDTO> result2 = userRepository.findScoresByRoundId(roundId2, sort);

        assertEquals(2, result1.size());
        assertEquals(2, result2.size());

        assertEquals(9L, (long) result1.get(0).getScore());
        assertEquals(3L, (long) result1.get(1).getScore());
        assertEquals(6L, (long) result2.get(0).getScore());
        assertEquals(6L, (long) result2.get(1).getScore());
    }

    @Test
    @Sql({"classpath:sql/add_topics.sql", "classpath:sql/add_users.sql",
            "classpath:sql/add_matches.sql", "classpath:sql/add_rounds.sql",
            "classpath:sql/add_round_scores.sql"})
    public void shouldReturnCorrectResultsOnFindScoresByMatchId() {
        String matchId = matchRepository.findAll().stream()
                .filter(m -> m.getCreatedAt().toString().equals("2016-06-22T19:10:20Z"))
                .findFirst().get().getId();

        Sort sort = JpaSort.unsafe(Sort.Direction.DESC, "SUM(COALESCE(rs.score, 0))");
        List<UserDTO> result = userRepository.findScoresByMatchId(matchId, sort);

        assertEquals(2, result.size());

        assertEquals(15L, (long) result.get(0).getScore());
        assertEquals(9L, (long) result.get(1).getScore());
    }
}