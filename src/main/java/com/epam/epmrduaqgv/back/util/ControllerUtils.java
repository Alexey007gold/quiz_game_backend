package com.epam.epmrduaqgv.back.util;

import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;

import java.util.Map;

/**
 * Useful methods for controllers
 */
public class ControllerUtils {

    private ControllerUtils() {}

    @SuppressWarnings("unchecked")
    public static String getUserId(OAuth2Authentication oauth2) {
        OAuth2AuthenticationDetails details = (OAuth2AuthenticationDetails) oauth2.getDetails();
        Map<String, ?> decodedDetails = (Map<String, ?>) details.getDecodedDetails();
        return (String) decodedDetails.get("id");
    }
}
