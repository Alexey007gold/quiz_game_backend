package com.epam.epmrduaqgv.back;

import com.epam.epmrduaqgv.back.config.security.token.CustomAccessTokenConverter;
import com.epam.epmrduaqgv.back.config.security.token.CustomTokenEnhancer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.oauth2.provider.token.DefaultTokenServices;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;

import java.util.Arrays;

@SpringBootApplication
public class QuizGameBackApplication {

    @Value("${signing_key}")
    private String signingKey;

    @Value("${access_token.expiration_time.seconds}")
    private int accessTokenExpirationSeconds;

    @Value("${refresh_token.expiration_time.seconds}")
    private int refreshTokenExpirationSeconds;

    public static void main(String[] args) {
        SpringApplication.run(QuizGameBackApplication.class, args);
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
        tokenEnhancerChain.setTokenEnhancers(Arrays.asList(new CustomTokenEnhancer(), accessTokenConverter()));
        return tokenEnhancerChain;
    }

    @Bean
    public TokenStore tokenStore() {
        return new JwtTokenStore(accessTokenConverter());
    }

    @Bean
    public JwtAccessTokenConverter accessTokenConverter() {
        final JwtAccessTokenConverter converter = new JwtAccessTokenConverter();
        converter.setAccessTokenConverter(new CustomAccessTokenConverter());
        converter.setSigningKey(signingKey);
        return converter;
    }
}
