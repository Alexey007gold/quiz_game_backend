package com.epam.epmrduaqgv.back.security;

import com.epam.epmrduaqgv.back.AuthenticationHelper;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import java.time.LocalDateTime;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional
public class Oauth2SecurityITTest {

    @Autowired
    private WebApplicationContext webApplicationContext;

    private MockMvc mockMvc;

    private static final String EMAIL = "test@gmail.com";
    private static final String PASSWORD = "password";

    @Before
    public void setUp() {
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext)
                .apply(SecurityMockMvcConfigurers.springSecurity())
                .build();
    }

    @Test
    public void healthEndpointIsAccessibleWithoutAuthentication() throws Exception {
        String result = mockMvc.perform(get("/health"))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        //check the response can be parsed as a date
        LocalDateTime.parse(result.replace("\"", ""));
    }

    @Test
    @Sql(value = "classpath:sql/add_user.sql")
    public void securedHealthEndpointIsAccessibleForAuthenticatedUser() throws Exception {
        final String accessToken = AuthenticationHelper.obtainAccessToken(mockMvc, EMAIL, PASSWORD);

        String result = mockMvc.perform(get("/secureHealth")
                .header("Authorization", "Bearer " + accessToken))
                .andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();

        //check the response can be parsed as a date
        LocalDateTime.parse(result.replace("\"", ""));
    }

    @Test
    public void securedHealthEndpointIsNotAccessibleWithoutAuthentication() throws Exception {
        mockMvc.perform(get("/secureHealth"))
                .andExpect(status().isUnauthorized());
    }
}
