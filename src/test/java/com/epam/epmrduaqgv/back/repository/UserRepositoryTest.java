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

import static org.junit.Assert.*;

@DataJpaTest
@RunWith(SpringRunner.class)
public class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TopicRepository topicRepository;

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
    @Sql({"classpath:sql/add_users.sql", "classpath:sql/add_topics.sql", "classpath:sql/add_scores.sql"})
    public void shouldReturnCorrectResultsOnFindScoresByTopicId() {
        String topicId1 = topicRepository.findByName("Ukraine history").getId();
        String topicId2 = topicRepository.findByName("General IT").getId();
        Page<UserDTO> result1 = userRepository.findScoresByTopicId(topicId1, PageRequest.of(0, 7));
        Page<UserDTO> result2 = userRepository.findScoresByTopicId(topicId1, PageRequest.of(1, 7));

        Page<UserDTO> result3 = userRepository.findScoresByTopicId(topicId2, PageRequest.of(0, 7));
        Page<UserDTO> result4 = userRepository.findScoresByTopicId(topicId2, PageRequest.of(1, 7));

        Page<UserDTO> result5 = userRepository.findScoresByTopicId("not existent id", PageRequest.of(2, 4));

        assertEquals(7, result1.getNumberOfElements());
        assertEquals(3, result2.getNumberOfElements());

        assertEquals(7, result3.getNumberOfElements());
        assertEquals(3, result4.getNumberOfElements());

        assertEquals(0, result5.getNumberOfElements());
    }

    @Test
    @Sql({"classpath:sql/add_users.sql", "classpath:sql/add_topics.sql", "classpath:sql/add_scores.sql"})
    public void shouldReturnCorrectResultsOnFindScoresByTopicName() {
        String topic1 = "Ukraine history";
        String topic2 = "General IT";
        Page<UserDTO> result1 = userRepository.findScoresByTopicName(topic1, PageRequest.of(0, 7));
        Page<UserDTO> result2 = userRepository.findScoresByTopicName(topic1, PageRequest.of(1, 7));

        Page<UserDTO> result3 = userRepository.findScoresByTopicName(topic2, PageRequest.of(0, 7));
        Page<UserDTO> result4 = userRepository.findScoresByTopicName(topic2, PageRequest.of(1, 7));

        Page<UserDTO> result5 = userRepository.findScoresByTopicName("not existent name", PageRequest.of(2, 4));

        assertEquals(7, result1.getNumberOfElements());
        assertEquals(3, result2.getNumberOfElements());

        assertEquals(7, result3.getNumberOfElements());
        assertEquals(3, result4.getNumberOfElements());

        assertEquals(0, result5.getNumberOfElements());
    }

    @Test
    @Sql({"classpath:sql/add_users.sql", "classpath:sql/add_topics.sql", "classpath:sql/add_scores.sql"})
    public void shouldReturnCorrectResultsOnFindTotalScores() {
        Page<UserDTO> result1 = userRepository.findTotalScores(PageRequest.of(0, 4));
        Page<UserDTO> result2 = userRepository.findTotalScores(PageRequest.of(1, 4));
        Page<UserDTO> result3 = userRepository.findTotalScores(PageRequest.of(2, 4));
        Page<UserDTO> result4 = userRepository.findTotalScores(PageRequest.of(0, 20,
                JpaSort.unsafe(Sort.Direction.DESC, "SUM(s.score)")));

        assertEquals(4, result1.getNumberOfElements());
        assertEquals(4, result2.getNumberOfElements());
        assertEquals(2, result3.getNumberOfElements());
        assertEquals(10, result4.getNumberOfElements());

        assertEquals(69, (long) result4.getContent().get(0).getScore());
        assertEquals("test_user3", result4.getContent().get(0).getNickName());
    }
}