package com.epam.epmrduaqgv.back.config.security;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;

@Configuration
@EnableResourceServer
public class OAuth2ResourceServerConfigJwt extends ResourceServerConfigurerAdapter {

    @Value("${spring.h2.console.enabled:false}")
    private boolean h2consoleEnabled;

    @Value("${spring.h2.console.path:}")
    private String h2consolePath;

    @Override
    public void configure(HttpSecurity http) throws Exception {
        ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry urlRegistry = http.authorizeRequests()
                .antMatchers("/health", "/register").permitAll()
                .antMatchers("/swagger-ui.html",
                        "/swagger-resources/**",
                        "/webjars/**",
                        "/v2/api-docs/**").permitAll();
        if (h2consoleEnabled) {
            urlRegistry = urlRegistry
                    .antMatchers(h2consolePath + "/**")
                    .permitAll();
            http.headers().frameOptions().disable();
        }
        urlRegistry.anyRequest().authenticated();
    }
}