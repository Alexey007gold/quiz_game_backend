package com.epam.epmrduaqgv.back.config.security;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.provider.token.DefaultAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;

import java.util.Collections;

@Configuration
public class ServerSecurityConfig extends WebSecurityConfigurerAdapter {

    @Value("${signing_key}")
    private String signingKey;

    @Value("${access_token.expiration_time.seconds}")
    private int accessTokenExpirationSeconds;

    @Value("${refresh_token.expiration_time.seconds}")
    private int refreshTokenExpirationSeconds;

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    public TokenStore tokenStore() {
        return new JwtTokenStore(accessTokenConverter());
    }

    @Bean
    public JwtAccessTokenConverter accessTokenConverter() {
        final JwtAccessTokenConverter converter = new JwtAccessTokenConverter();
        converter.setAccessTokenConverter(new DefaultAccessTokenConverter());
        converter.setSigningKey(signingKey);
        return converter;
    }

    @Bean
    public DefaultTokenServices defaultAuthorizationServerTokenServices() {
        final DefaultTokenServices defaultTokenServices = new DefaultTokenServices();
        defaultTokenServices.setTokenStore(tokenStore());
        defaultTokenServices.setSupportRefreshToken(true);
        defaultTokenServices.setAccessTokenValiditySeconds(accessTokenExpirationSeconds);
        defaultTokenServices.setRefreshTokenValiditySeconds(refreshTokenExpirationSeconds);
        defaultTokenServices.setTokenEnhancer(getTokenEnhancerChain());
        return defaultTokenServices;
    }

    @Bean
    public TokenEnhancerChain getTokenEnhancerChain() {
        final TokenEnhancerChain tokenEnhancerChain = new TokenEnhancerChain();
        tokenEnhancerChain.setTokenEnhancers(Collections.singletonList(accessTokenConverter()));
        return tokenEnhancerChain;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}