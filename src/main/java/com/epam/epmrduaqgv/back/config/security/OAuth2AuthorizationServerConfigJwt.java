package com.epam.epmrduaqgv.back.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;

import java.util.Collections;

@Configuration
@EnableAuthorizationServer
public class OAuth2AuthorizationServerConfigJwt extends AuthorizationServerConfigurerAdapter {

    @Value("${client_id}")
    private String FRONT_CLIENT_ID;
    @Value("${client_secret}")
    private String FRONT_CLIENT_SECRET;

    private static final String[] grantTypes = {"password", "refresh_token"};
    private static final String[] scopes = {"read", "write"};

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private TokenStore tokenStore;

    @Autowired
    @Qualifier("userDetailsServiceImpl")
    private UserDetailsService userDetailsService;

    @Autowired
    @Qualifier("authenticationManagerBean")
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtAccessTokenConverter tokenConverter;

    @Override
    public void configure(AuthorizationServerSecurityConfigurer oauthServer) {
        oauthServer.tokenKeyAccess("permitAll()")
                .checkTokenAccess("isAuthenticated()");
    }

    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        clients.inMemory()
                .withClient(FRONT_CLIENT_ID)
                .secret(passwordEncoder.encode(FRONT_CLIENT_SECRET))
                .authorizedGrantTypes(grantTypes)
                .scopes(scopes);
    }

    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) {
        endpoints.tokenStore(tokenStore)
                .tokenEnhancer(getTokenEnhancerChain())
                .authenticationManager(authenticationManager)
                .userDetailsService(userDetailsService);
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    private TokenEnhancerChain getTokenEnhancerChain() {
        final TokenEnhancerChain tokenEnhancerChain = new TokenEnhancerChain();
        tokenEnhancerChain.setTokenEnhancers(Collections.singletonList(tokenConverter));
        return tokenEnhancerChain;
    }
}