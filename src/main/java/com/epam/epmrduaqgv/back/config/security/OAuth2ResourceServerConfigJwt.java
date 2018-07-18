package com.epam.epmrduaqgv.back.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;

@Configuration
@EnableResourceServer
public class OAuth2ResourceServerConfigJwt extends ResourceServerConfigurerAdapter {

    @Autowired
    private DefaultTokenServices tokenService;

    @Value("${access_token.expiration_time.seconds}")
    private int accessTokenExpirationSeconds;

    @Value("${refresh_token.expiration_time.seconds}")
    private int refreshTokenExpirationSeconds;

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/health", "/register").permitAll()
                .antMatchers("/swagger-ui.html",
                        "/swagger-resources/**",
                        "/webjars/**",
                        "/v2/api-docs/**").permitAll()
                .anyRequest().authenticated();
    }

    @Override
    public void configure(final ResourceServerSecurityConfigurer config) {
        tokenService.setAccessTokenValiditySeconds(accessTokenExpirationSeconds);
        tokenService.setRefreshTokenValiditySeconds(refreshTokenExpirationSeconds);
        config.tokenServices(tokenService);
    }
}