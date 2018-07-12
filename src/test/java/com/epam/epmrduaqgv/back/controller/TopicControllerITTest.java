package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.AuthenticationHelper;
import com.epam.epmrduaqgv.back.service.TopicService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Transactional
@SpringBootTest
@RunWith(SpringRunner.class)
public class TopicControllerITTest {

    private static final String EMAIL = "test@gmail.com";
    private static final String PASSWORD = "password";

    @Autowired
    private WebApplicationContext webApplicationContext;

    private MockMvc mockMvc;

    @MockBean
    private TopicService topicService;

    @MockBean
    private ObjectMapper objectMapper;

    @Before
    public void setUp() {
        mockMvc = MockMvcBuilders
                .webAppContextSetup(webApplicationContext)
                .apply(SecurityMockMvcConfigurers.springSecurity())
                .build();
    }

    @Test
    public void getAllTopicsIsNotAccessibleWithoutAuthentication() throws Exception {
        mockMvc.perform(get("/topic/all")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isUnauthorized());
    }

    @Test
    public void findTopicByIdOrNameIsNotAccessibleWithoutAuthentication() throws Exception {
        mockMvc.perform(get("/topic")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isUnauthorized());
    }

    @Test
    @Sql(scripts = "classpath:sql/add_user.sql")
    public void getAllTopicsIsAccessibleWithAuthentication() throws Exception {
        final String accessToken = AuthenticationHelper.obtainAccessToken(mockMvc, EMAIL, PASSWORD);
        TypeFactory typeFactory = TypeFactory.defaultInstance();

        when(objectMapper.getTypeFactory()).thenReturn(typeFactory);

        mockMvc.perform(get("/topic/all")
                .header("Authorization", "Bearer " + accessToken)
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }

    @Test
    @Sql(scripts = "classpath:sql/add_user.sql")
    public void findTopicByIdOrNameIsAccessibleWithAuthentication() throws Exception {
        final String accessToken = AuthenticationHelper.obtainAccessToken(mockMvc, EMAIL, PASSWORD);

        mockMvc.perform(get("/topic")
                .header("Authorization", "Bearer " + accessToken)
                .contentType(MediaType.APPLICATION_JSON)
                .param("id", "some_id"))
                .andExpect(status().isOk());
    }
}