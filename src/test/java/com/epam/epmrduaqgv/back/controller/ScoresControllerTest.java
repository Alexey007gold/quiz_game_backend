package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.AuthenticationHelper;
import com.epam.epmrduaqgv.back.dto.UserDTO;
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

import java.util.List;

import static org.junit.Assert.*;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@Transactional
@SpringBootTest
@RunWith(SpringRunner.class)
@Sql(scripts = {"classpath:sql/add_user.sql", "classpath:sql/add_users_with_scores.sql"})
public class ScoresControllerTest {

    private static final String EMAIL = "test@gmail.com";
    private static final String PASSWORD = "password";

    @Autowired
    private WebApplicationContext webApplicationContext;

    private MockMvc mockMvc;

    @SpyBean
    private UserService userService;

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
    public void shouldCallRepositoryMethodOnGetHighScoresWithDefaultParams() throws Exception {
        UserDTO userDTO = getUserDTO();
        final String accessToken = AuthenticationHelper.obtainAccessToken(mockMvc, EMAIL, PASSWORD);

        String contentAsString = mockMvc.perform(get("/scores")
                .header("Authorization", "Bearer " + accessToken)
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        List<UserDTO> result = objectMapper.readValue(contentAsString, new TypeReference<List<UserDTO>>() {});

        ArgumentCaptor<Integer> integerArgCaptor = ArgumentCaptor.forClass(Integer.class);
        ArgumentCaptor<Sort.Direction> directionArgCaptor = ArgumentCaptor.forClass(Sort.Direction.class);
        verify(userService).findTopScoresUserList(integerArgCaptor.capture(), directionArgCaptor.capture());

        assertEquals(10, result.size());
        assertNotEquals(userDTO, result.get(0));
        assertEquals(10, (int) integerArgCaptor.getValue());
        assertTrue(directionArgCaptor.getValue().isDescending());
    }

    @Test
    public void shouldCallRepositoryMethodOnGetHighScoresWithGivenParams() throws Exception {
        UserDTO userDTO = getUserDTO();
        final String accessToken = AuthenticationHelper.obtainAccessToken(mockMvc, EMAIL, PASSWORD);

        String contentAsString = mockMvc.perform(get("/scores")
                .header("Authorization", "Bearer " + accessToken)
                .contentType(MediaType.APPLICATION_JSON)
                .param("top", "6").param("order", "ASC"))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        List<UserDTO> result = objectMapper.readValue(contentAsString, new TypeReference<List<UserDTO>>() {});

        ArgumentCaptor<Integer> integerArgCaptor = ArgumentCaptor.forClass(Integer.class);
        ArgumentCaptor<Sort.Direction> directionArgCaptor = ArgumentCaptor.forClass(Sort.Direction.class);
        verify(userService).findTopScoresUserList(integerArgCaptor.capture(), directionArgCaptor.capture());

        assertEquals(6, result.size());
        assertEquals(userDTO, result.get(0));
        assertEquals(6, (int) integerArgCaptor.getValue());
        assertTrue(directionArgCaptor.getValue().isAscending());
    }

    @Test
    public void scoresEndpointIsNotAccessibleWithoutAuthentication() throws Exception {
        mockMvc.perform(get("/scores")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isUnauthorized());
    }

    private UserDTO getUserDTO() {
        return UserDTO.builder()
                .email("test@gmail.com")
                .nickName("test_user")
                .score(0L)
                .build();
    }
}