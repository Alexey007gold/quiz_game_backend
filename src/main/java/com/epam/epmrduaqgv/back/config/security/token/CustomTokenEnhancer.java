package com.epam.epmrduaqgv.back.config.security.token;

import com.epam.epmrduaqgv.back.model.ExtendedUserDetails;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;

import java.util.HashMap;
import java.util.Map;

/**
 * Adds additional info (user id) to the authentication token
 */
public class CustomTokenEnhancer implements TokenEnhancer {

    @Override
    public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {
        final Map<String, Object> additionalInfo = new HashMap<>();
        additionalInfo.put("id", getProfileId(authentication));

        ((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInfo);

        return accessToken;
    }

    private String getProfileId(Authentication authentication) {
        ExtendedUserDetails userAccountDetails = (ExtendedUserDetails) authentication.getPrincipal();
        return userAccountDetails.getId();
    }
}
