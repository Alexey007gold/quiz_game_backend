package com.epam.epmrduaqgv.back.repository;

import com.epam.epmrduaqgv.back.entity.QuestionEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.assertEquals;

@DataJpaTest
@RunWith(SpringRunner.class)
public class QuestionRepositoryTest {

    @Autowired
    private QuestionRepository questionRepository;


    @Test
    @Sql({"classpath:sql/add_topics.sql",
            "classpath:sql/add_questions_and_answers.sql"})
    public void shouldReturnSavedEntityOnSave() {
        List<QuestionEntity> result1 = questionRepository.findByTopicName("Ukraine history");
        List<QuestionEntity> result2 = questionRepository.findByTopicName("General IT");

        assertEquals(2, result1.size());
        assertEquals(1, result2.size());
    }

}