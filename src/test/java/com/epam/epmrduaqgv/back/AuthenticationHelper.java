package com.epam.epmrduaqgv.back;

import org.springframework.boot.json.JacksonJsonParser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import java.util.Properties;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.httpBasic;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

public class AuthenticationHelper {

    private static final String CONTENT_TYPE = "application/json;charset=UTF-8";

    private AuthenticationHelper() {
    }


    public static String obtainAccessToken(MockMvc mockMvc, String username, String password) throws Exception {
        Properties properties = PropertyLoader.loadApplicationProperties();
        String clientId = properties.getProperty("client_id");
        String clientSecret = properties.getProperty("client_secret");

        final MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "password");
        params.add("client_id", clientId);
        params.add("username", username);
        params.add("password", password);


        ResultActions result = mockMvc.perform(post("/oauth/token")
                .params(params)
                .with(httpBasic(clientId, clientSecret))
                .accept(CONTENT_TYPE));


        String resultString = result.andReturn().getResponse().getContentAsString();

        JacksonJsonParser jsonParser = new JacksonJsonParser();
        return jsonParser.parseMap(resultString).get("access_token").toString();
    }
}