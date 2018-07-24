package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.MatchEntity;
import com.epam.epmrduaqgv.back.entity.UserEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;

import java.time.Instant;

import static org.junit.Assert.*;

@DataJpaTest
@RunWith(SpringRunner.class)
public class MatchRepositoryTest {

    @Autowired
    private MatchRepository matchRepository;

    @Autowired
    private UserRepository userRepository;

    @Test
    public void shouldHandleCreationTimeAndUpdatedTimeOnSave() {
        MatchEntity matchEntity = MatchEntity.builder().build();
        matchRepository.saveAndFlush(matchEntity);

        assertNotNull(matchEntity.getCreatedAt());
        assertNotNull(matchEntity.getUpdatedAt());

        Instant updatedTime = matchEntity.getUpdatedAt();

        matchEntity.setUpdatedAt(Instant.now());
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

        assertEquals(2, result1.getNumberOfElements());
        assertEquals(4, result2.getNumberOfElements());
        assertEquals(3, result3.getNumberOfElements());
        assertEquals(1, result4.getNumberOfElements());
        assertEquals(1, result5.getNumberOfElements());
    }
}