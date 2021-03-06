package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.MatchEntity;
import com.epam.epmrduaqgv.back.entity.UserEntity;
import com.epam.epmrduaqgv.back.model.MatchState;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;

import java.time.Instant;
import java.util.Arrays;
import java.util.List;

import static com.epam.epmrduaqgv.back.model.MatchState.*;
import static java.util.stream.Collectors.toList;
import static org.junit.Assert.*;

@DataJpaTest
@RunWith(SpringRunner.class)
public class MatchRepositoryTest {

    @Autowired
    private MatchRepository matchRepository;

    @Autowired
    private RoundRepository roundRepository;

    @Autowired
    private UserRepository userRepository;

    @Test
    public void shouldHandleCreationTimeAndUpdatedTimeOnSave() throws InterruptedException {
        MatchEntity matchEntity = MatchEntity.builder().build();
        matchRepository.saveAndFlush(matchEntity);

        assertNotNull(matchEntity.getCreatedAt());
        assertNotNull(matchEntity.getUpdatedAt());

        Instant updatedTime = matchEntity.getUpdatedAt();

        Thread.sleep(500);
        matchEntity.setMatchState(FINISHED);
        matchRepository.saveAndFlush(matchEntity);

        assertNotEquals(updatedTime, matchEntity.getUpdatedAt());
    }

    @Sql({"classpath:sql/add_users.sql", "classpath:sql/add_matches.sql"})
    @Test
    public void shouldReturnCorrectResultsOnFindByPlayerWithUserId() {
        UserEntity userEntity1 = userRepository.findByEmail("test1@gmail.com");
        UserEntity userEntity2 = userRepository.findByEmail("test2@gmail.com");
        UserEntity userEntity3 = userRepository.findByEmail("test4@gmail.com");

        Page<MatchEntity> result1 = matchRepository.findByPlayerWithUserId(userEntity1.getId(), PageRequest.of(0, 10));
        Page<MatchEntity> result2 = matchRepository.findByPlayerWithUserId(userEntity2.getId(), PageRequest.of(0, 10));
        Page<MatchEntity> result3 = matchRepository.findByPlayerWithUserId(userEntity2.getId(), PageRequest.of(0, 3));
        Page<MatchEntity> result4 = matchRepository.findByPlayerWithUserId(userEntity2.getId(), PageRequest.of(1, 3));
        Page<MatchEntity> result5 = matchRepository.findByPlayerWithUserId(userEntity3.getId(), PageRequest.of(0, 10));

        assertEquals(5, result1.getNumberOfElements());
        assertEquals(6, result2.getNumberOfElements());
        assertEquals(3, result3.getNumberOfElements());
        assertEquals(3, result4.getNumberOfElements());
        assertEquals(1, result5.getNumberOfElements());
    }

    @Sql({"classpath:sql/add_users.sql", "classpath:sql/add_matches.sql"})
    @Test
    public void shouldReturnCorrectResultsOnFindMatchesInProgressByUserIdWhereLastActivityDifferenceIsMoreThan() {
        String userId1 = userRepository.findByEmail("test1@gmail.com").getId();
        String userId2 = userRepository.findByEmail("test2@gmail.com").getId();

        List<MatchEntity> result1 = matchRepository.findMatchesInProgressByUserIdWhereLastActivityDifferenceIsMoreThan(userId1, 240000);
        List<MatchEntity> result2 = matchRepository.findMatchesInProgressByUserIdWhereLastActivityDifferenceIsMoreThan(userId1, 230000);
        List<MatchEntity> result3 = matchRepository.findMatchesInProgressByUserIdWhereLastActivityDifferenceIsMoreThan(userId2, 240000);
        List<MatchEntity> result4 = matchRepository.findMatchesInProgressByUserIdWhereLastActivityDifferenceIsMoreThan(userId2, 230000);

        assertEquals(1, result1.size());
        assertEquals(2, result2.size());
        assertEquals(2, result3.size());
        assertEquals(3, result4.size());
    }

    @Sql({"classpath:sql/add_users.sql", "classpath:sql/add_matches.sql"})
    @Test
    public void shouldReturnCorrectResultsOnFindMatchesInProgressWhereLastActivityDifferenceIsMoreThan() {
        List<MatchEntity> result1 = matchRepository.findMatchesInProgressWhereLastActivityDifferenceIsMoreThan(240000);
        List<MatchEntity> result2 = matchRepository.findMatchesInProgressWhereLastActivityDifferenceIsMoreThan(230000);

        assertEquals(2, result1.size());
        assertEquals(3, result2.size());
    }

    @Sql({"classpath:sql/add_users.sql", "classpath:sql/add_matches.sql",
            "classpath:sql/add_topics.sql", "classpath:sql/add_rounds.sql"})
    @Test
    public void shouldReturnCorrectResultsOnGetMatchStateByRoundId() {
        String roundId = roundRepository.findAll().stream()
                .filter(r -> r.getCreatedAt().toString().equals("2016-06-22T19:10:22Z"))
                .findFirst().get().getId();

        MatchState result = matchRepository.getMatchStateByRoundId(roundId);

        assertEquals(IN_PROGRESS, result);
    }

    @Sql({"classpath:sql/add_users.sql", "classpath:sql/add_matches.sql",
            "classpath:sql/add_topics.sql", "classpath:sql/add_rounds.sql"})
    @Test
    public void shouldUpdateDbOnUpdateMatchState() {
        List<String> matchIds = matchRepository.findAll().stream()
                .filter(m -> m.getCreatedAt().toString().equals("2016-06-22T19:10:20Z") ||
                        m.getCreatedAt().toString().equals("2016-06-22T19:10:21Z"))
                .map(MatchEntity::getId)
                .collect(toList());

        int result = matchRepository.updateMatchState(matchIds, FINISHED);

        assertEquals(2, result);
    }

    @Sql({"classpath:sql/add_users.sql", "classpath:sql/add_matches.sql",
            "classpath:sql/add_topics.sql", "classpath:sql/add_rounds.sql"})
    @Test
    public void shouldUpdateDbOnUpdateMatchUpdatedAt() {
        String matchId = matchRepository.findAll().stream()
                .filter(m -> m.getCreatedAt().toString().equals("2016-06-22T19:10:20Z"))
                .map(MatchEntity::getId).findFirst().get();

        int result = matchRepository.updateMatchUpdatedAt(matchId);

        assertEquals(1, result);
    }

    @Sql({"classpath:sql/add_users.sql", "classpath:sql/add_matches.sql",
            "classpath:sql/add_topics.sql", "classpath:sql/add_rounds.sql"})
    @Test
    public void shouldUpdateDbOnUpdateMatchUpdatedAtByRoundId() {
        String roundId = matchRepository.findAll().stream()
                .filter(m -> m.getCreatedAt().toString().equals("2016-06-22T19:10:20Z"))
                .findFirst().get()
                .getRounds().get(0).getId();

        int result = matchRepository.updateMatchUpdatedAtByRoundId(roundId);

        assertEquals(1, result);
    }

    @Sql({"classpath:sql/add_users.sql", "classpath:sql/add_matches.sql"})
    @Test
    public void shouldReturnCorrectResultsOnFindByPlayerWithUserIdAndMatchStateIn() {
        String userId = userRepository.findByEmail("test1@gmail.com").getId();

        List<MatchEntity> result1 = matchRepository.findByPlayerWithUserIdAndMatchStateIn(userId,
                Arrays.asList(WAITING_FOR_OPPONENT, IN_PROGRESS));
        List<MatchEntity> result2 = matchRepository.findByPlayerWithUserIdAndMatchStateIn(userId,
                Arrays.asList(FINISHED));

        assertEquals(4, result1.size());
        assertEquals(1, result2.size());
    }

    @Sql({"classpath:sql/add_users.sql", "classpath:sql/add_matches.sql"})
    @Test
    public void shouldReturnCorrectResultsOnFindByPlayerWithUserIdAndMatchStateNot() {
        String userId = userRepository.findByEmail("test1@gmail.com").getId();

        List<MatchEntity> result1 = matchRepository.findByPlayerWithUserIdAndMatchStateNot(userId, WAITING_FOR_OPPONENT);
        List<MatchEntity> result2 = matchRepository.findByPlayerWithUserIdAndMatchStateNot(userId, FINISHED);
        List<MatchEntity> result3 = matchRepository.findByPlayerWithUserIdAndMatchStateNot(userId, IN_PROGRESS);

        assertEquals(3, result1.size());
        assertEquals(4, result2.size());
        assertEquals(3, result3.size());
    }

    @Sql({"classpath:sql/add_users.sql", "classpath:sql/add_matches.sql"})
    @Test
    public void shouldReturnCorrectResultsOnFindByPlayerWithUserIdAndMatchStateNotIn() {
        String userId = userRepository.findByEmail("test1@gmail.com").getId();

        List<MatchEntity> result1 = matchRepository.findByPlayerWithUserIdAndMatchStateNotIn(userId,
                Arrays.asList(WAITING_FOR_OPPONENT, FINISHED));
        List<MatchEntity> result2 = matchRepository.findByPlayerWithUserIdAndMatchStateNotIn(userId,
                Arrays.asList(IN_PROGRESS, FINISHED));
        List<MatchEntity> result3 = matchRepository.findByPlayerWithUserIdAndMatchStateNotIn(userId,
                Arrays.asList(WAITING_FOR_OPPONENT, IN_PROGRESS));

        assertEquals(2, result1.size());
        assertEquals(2, result2.size());
        assertEquals(1, result3.size());
    }

    @Sql({"classpath:sql/add_users.sql", "classpath:sql/add_matches.sql"})
    @Test
    public void shouldReturnCorrectResultsOnFindWithPlayersNumberLessThan() {
        List<MatchEntity> result = matchRepository.findWithPlayersNumberLessThan(2L);

        assertEquals(2, result.size());
    }

    @Sql({"classpath:sql/add_users.sql", "classpath:sql/add_matches.sql"})
    @Test
    public void shouldReturnCorrectResultsOnFindWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId() {
        String userId1 = userRepository.findByEmail("test1@gmail.com").getId();
        String userId2 = userRepository.findByEmail("test2@gmail.com").getId();
        String userId3 = userRepository.findByEmail("test3@gmail.com").getId();
        String userId4 = userRepository.findByEmail("test4@gmail.com").getId();

        List<MatchEntity> result1 = matchRepository.findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(3L, userId1);
        List<MatchEntity> result2 = matchRepository.findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(3L, userId2);
        List<MatchEntity> result3 = matchRepository.findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(3L, userId3);
        List<MatchEntity> result4 = matchRepository.findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(3L, userId4);
        List<MatchEntity> result5 = matchRepository.findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(2L, userId1);
        List<MatchEntity> result6 = matchRepository.findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(2L, userId2);
        List<MatchEntity> result7 = matchRepository.findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(2L, userId4);
        List<MatchEntity> result8 = matchRepository.findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(2L, userId4);
        List<MatchEntity> result9 = matchRepository.findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(4L, userId1);
        List<MatchEntity> result10 = matchRepository.findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(4L, userId2);
        List<MatchEntity> result11 = matchRepository.findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(4L, userId3);
        List<MatchEntity> result12 = matchRepository.findWithPlayersNumberLessThanAndNotContainsAPlayerWithUserId(4L, userId4);

        assertEquals(2, result1.size());
        assertEquals(1, result2.size());
        assertEquals(6, result3.size());
        assertEquals(5, result4.size());
        assertEquals(1, result5.size());
        assertEquals(1, result6.size());
        assertEquals(2, result7.size());
        assertEquals(2, result8.size());
        assertEquals(2, result9.size());
        assertEquals(1, result10.size());
        assertEquals(6, result11.size());
        assertEquals(6, result12.size());
    }
}