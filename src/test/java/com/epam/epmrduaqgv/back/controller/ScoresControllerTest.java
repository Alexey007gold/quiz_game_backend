package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.AuthenticationHelper;
import com.epam.epmrduaqgv.back.dto.PageDTO;
import com.epam.epmrduaqgv.back.dto.UserDTO;
import com.epam.epmrduaqgv.back.repository.TopicRepository;
import com.epam.epmrduaqgv.back.service.UserService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.SpyBean;
import org.springframework.data.domain.Sort;
import org.springframework.http.MediaType;
import org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import static org.junit.Assert.*;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Transactional
@SpringBootTest
@RunWith(SpringRunner.class)
@Sql(scripts = {"classpath:sql/add_user.sql", "classpath:sql/add_users.sql",
        "classpath:sql/add_topics.sql", "classpath:sql/add_scores.sql"})
public class ScoresControllerTest {

    private static final String EMAIL = "test@gmail.com";
    private static final String PASSWORD = "password";
    private static final String PATH = "/scores";

    @Autowired
    private WebApplicationContext webApplicationContext;

    private MockMvc mockMvc;

    @SpyBean
    private UserService userService;

    @Autowired
    private TopicRepository topicRepository;

    @Autowired
    private ObjectMapper objectMapper;

    @Before
    public void setUp() {
        mockMvc = MockMvcBuilders
                .webAppContextSetup(webApplicationContext)
                .apply(SecurityMockMvcConfigurers.springSecurity())
                .build();
    }

    @Test
    public void shouldCallRightServiceMethodOnGetHighScoresWithDefaultParams() throws Exception {
        UserDTO userDTO = getUserDTO();
        final String accessToken = AuthenticationHelper.obtainAccessToken(mockMvc, EMAIL, PASSWORD);

        String contentAsString = mockMvc.perform(get(PATH)
                .header("Authorization", "Bearer " + accessToken)
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        PageDTO<UserDTO> result = objectMapper.readValue(contentAsString, new TypeReference<PageDTO<UserDTO>>() {});

        ArgumentCaptor<Integer> pageArgCaptor = ArgumentCaptor.forClass(Integer.class);
        ArgumentCaptor<Integer> pageSizeArgCaptor = ArgumentCaptor.forClass(Integer.class);
        ArgumentCaptor<Sort.Direction> directionArgCaptor = ArgumentCaptor.forClass(Sort.Direction.class);
        verify(userService).findTotalScores(pageArgCaptor.capture(), pageSizeArgCaptor.capture(), directionArgCaptor.capture());

        assertEquals(30, result.getPageSize());
        assertEquals(11, result.getNumberOfElements());
        assertNotEquals(userDTO, result.getData().get(0));
        assertEquals(0, (int) pageArgCaptor.getValue());
        assertEquals(30, (int) pageSizeArgCaptor.getValue());
        assertTrue(directionArgCaptor.getValue().isDescending());
    }

    @Test
    public void shouldCallRightServiceMethodOnGetHighScoresWithGivenParams() throws Exception {
        final String accessToken = AuthenticationHelper.obtainAccessToken(mockMvc, EMAIL, PASSWORD);

        String contentAsString = mockMvc.perform(get(PATH)
                .header("Authorization", "Bearer " + accessToken)
                .contentType(MediaType.APPLICATION_JSON)
                .param("page", "3")
                .param("pageSize", "3")
                .param("order", "ASC"))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        PageDTO<UserDTO> result = objectMapper.readValue(contentAsString, new TypeReference<PageDTO<UserDTO>>() {});

        ArgumentCaptor<Integer> pageArgCaptor = ArgumentCaptor.forClass(Integer.class);
        ArgumentCaptor<Integer> pageSizeArgCaptor = ArgumentCaptor.forClass(Integer.class);
        ArgumentCaptor<Sort.Direction> directionArgCaptor = ArgumentCaptor.forClass(Sort.Direction.class);
        verify(userService).findTotalScores(pageArgCaptor.capture(), pageSizeArgCaptor.capture(), directionArgCaptor.capture());

        assertEquals(3, result.getPageSize());
        assertEquals(2, result.getNumberOfElements());
        assertEquals(3, (int) pageArgCaptor.getValue());
        assertEquals(3, (int) pageSizeArgCaptor.getValue());
        assertTrue(directionArgCaptor.getValue().isAscending());
    }

    @Test
    public void shouldCallRightServiceMethodOnGetHighScoresWhenTopicIdIsSet() throws Exception {
        final String accessToken = AuthenticationHelper.obtainAccessToken(mockMvc, EMAIL, PASSWORD);

        String topicId = topicRepository.findByName("Ukraine history").getId();
        String contentAsString = mockMvc.perform(get(PATH)
                .header("Authorization", "Bearer " + accessToken)
                .contentType(MediaType.APPLICATION_JSON)
                .param("topicId", topicId))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        PageDTO<UserDTO> result = objectMapper.readValue(contentAsString, new TypeReference<PageDTO<UserDTO>>() {});

        ArgumentCaptor<String> topicArgCaptor = ArgumentCaptor.forClass(String.class);
        ArgumentCaptor<Integer> pageArgCaptor = ArgumentCaptor.forClass(Integer.class);
        ArgumentCaptor<Integer> pageSizeArgCaptor = ArgumentCaptor.forClass(Integer.class);
        ArgumentCaptor<Sort.Direction> directionArgCaptor = ArgumentCaptor.forClass(Sort.Direction.class);
        verify(userService).findScoresByTopicId(topicArgCaptor.capture(), pageArgCaptor.capture(),
                pageSizeArgCaptor.capture(), directionArgCaptor.capture());

        assertEquals(30, result.getPageSize());
        assertEquals(11, result.getNumberOfElements());
        assertEquals(topicId, topicArgCaptor.getValue());
        assertEquals(0, (int) pageArgCaptor.getValue());
        assertEquals(30, (int) pageSizeArgCaptor.getValue());
        assertTrue(directionArgCaptor.getValue().isDescending());
    }

    @Test
    public void shouldCallRightServiceMethodOnGetHighScoresWhenTopicNameIsSet() throws Exception {
        final String accessToken = AuthenticationHelper.obtainAccessToken(mockMvc, EMAIL, PASSWORD);

        String topicName = "Ukraine history";
        String contentAsString = mockMvc.perform(get(PATH)
                .header("Authorization", "Bearer " + accessToken)
                .contentType(MediaType.APPLICATION_JSON)
                .param("topicName", topicName))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        PageDTO<UserDTO> result = objectMapper.readValue(contentAsString, new TypeReference<PageDTO<UserDTO>>() {});

        ArgumentCaptor<String> topicArgCaptor = ArgumentCaptor.forClass(String.class);
        ArgumentCaptor<Integer> pageArgCaptor = ArgumentCaptor.forClass(Integer.class);
        ArgumentCaptor<Integer> pageSizeArgCaptor = ArgumentCaptor.forClass(Integer.class);
        ArgumentCaptor<Sort.Direction> directionArgCaptor = ArgumentCaptor.forClass(Sort.Direction.class);
        verify(userService).findScoresByTopicName(topicArgCaptor.capture(), pageArgCaptor.capture(),
                pageSizeArgCaptor.capture(), directionArgCaptor.capture());

        assertEquals(30, result.getPageSize());
        assertEquals(11, result.getNumberOfElements());
        assertEquals(topicName, topicArgCaptor.getValue());
        assertEquals(0, (int) pageArgCaptor.getValue());
        assertEquals(30, (int) pageSizeArgCaptor.getValue());
        assertTrue(directionArgCaptor.getValue().isDescending());
    }

    @Test
    public void scoresEndpointIsNotAccessibleWithoutAuthentication() throws Exception {
        mockMvc.perform(get(PATH)
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isUnauthorized());
    }

    private UserDTO getUserDTO() {
        return UserDTO.builder()
                .email(EMAIL)
                .nickName("test_user")
                .score(0L)
                .build();
    }
}