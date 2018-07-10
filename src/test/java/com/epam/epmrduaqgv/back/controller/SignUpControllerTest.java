package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.PropertyLoader;
import com.epam.epmrduaqgv.back.entity.UserEntity;
import com.epam.epmrduaqgv.back.form.SignUpForm;
import com.epam.epmrduaqgv.back.service.UserService;
import com.epam.epmrduaqgv.back.validation.ValidationFailure;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@RunWith(SpringRunner.class)
public class SignUpControllerTest {

    private static final String EMAIL = "email";
    private static final String PASSWORD = "password";
    private static final String NICK_NAME = "nickName";

    @Autowired
    private WebApplicationContext webApplicationContext;

    private MockMvc mockMvc;

    @MockBean
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
    public void shouldReturnValidationErrorsOnRegister() throws Exception {
        Properties props = PropertyLoader.loadProperties("validation/validationMessages.properties");
        String emailMessage = props.getProperty("validation.message.user.email.unavailable");
        String passwordMessage = props.getProperty("validation.message.user.password.invalid");
        String nickNameUnavailableMessage = props.getProperty("validation.message.user.nick_name.unavailable");
        String nickNameInvalidMessage = props.getProperty("validation.message.user.nick_name.invalid");

        SignUpForm form = SignUpForm.builder()
                .email(EMAIL)
                .password(PASSWORD)
                .nickName("n")
                .build();
        UserEntity testUser = UserEntity.builder()
                .email(EMAIL)
                .nickName(NICK_NAME)
                .build();
        when(userService.findByEmail(EMAIL)).thenReturn(testUser);//pretend email is already used
        when(userService.findByNickName("n")).thenReturn(testUser);//pretend nick name is already used

        String contentAsString = mockMvc.perform(post("/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(form)))
                .andExpect(status().isBadRequest())
                .andReturn().getResponse().getContentAsString();

        ValidationFailure validationFailure =
                objectMapper.readValue(contentAsString, ValidationFailure.class);
        Map<String, List<String>> errors = validationFailure.getErrors();

        verify(userService, times(0)).registerUser(any());
        assertEquals(3, errors.size());
        assertTrue(errors.keySet().containsAll(Arrays.asList(EMAIL, PASSWORD, NICK_NAME)));

        //check errors are loaded from props
        assertEquals(2, errors.get(EMAIL).size());
        assertEquals(2, errors.get(NICK_NAME).size());
        assertTrue(errors.get(EMAIL).contains(emailMessage));
        assertTrue(errors.get(PASSWORD).contains(passwordMessage));
        assertTrue(errors.get(NICK_NAME).containsAll(Arrays.asList(nickNameUnavailableMessage, nickNameInvalidMessage)));
    }

    @Test
    public void shouldCallServiceOnRegister() throws Exception {
        SignUpForm form = SignUpForm.builder()
                .email("email@gmail.com")
                .password("Passw0rd")
                .nickName(NICK_NAME)
                .build();

        mockMvc.perform(post("/register")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(form)))
                .andExpect(status().isOk());

        verify(userService).registerUser(form);
    }
}