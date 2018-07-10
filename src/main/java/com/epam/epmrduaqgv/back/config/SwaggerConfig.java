package com.epam.epmrduaqgv.back.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.annotations.ApiIgnore;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger.web.SecurityConfiguration;
import springfox.documentation.swagger.web.SecurityConfigurationBuilder;
import springfox.documentation.swagger.web.UiConfiguration;
import springfox.documentation.swagger.web.UiConfigurationBuilder;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Configuration
@EnableSwagger2
public class SwaggerConfig {

    @Value("${swagger.api.title}")
    private String apiTitle;

    @Value("${swagger.api.description}")
    private String apiDescription;

    @Value("${swagger.api.version}")
    private String apiVersion;

    @Value("${swagger.api.contact.name}")
    private String contactName;

    @Value("${swagger.api.contact.url}")
    private String contactUrl;

    @Value("${swagger.api.contact.email}")
    private String contactEmail;

    @Value("${swagger.ui.oauth2.clientId}")
    private String swaggerAppClientId;

    @Value("${swagger.ui.oauth2.clientSecret}")
    private String swaggerClientSecret;

    @Value("${swagger.ui.oauth2.token.url}")
    private String swaggerTokenURL;

    @Bean
    public Docket apiConfig() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.epam.epmrduaqgv.back.controller"))
                .paths(PathSelectors.any())
                .build()
                .ignoredParameterTypes(ApiIgnore.class)
                .useDefaultResponseMessages(false)
                .securitySchemes(Collections.singletonList(oauth2()))
                .securityContexts(Collections.singletonList(securityContext()));
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title(apiTitle)
                .contact(new Contact(contactName, contactUrl, contactEmail))
                .description(apiDescription)
                .version(apiVersion)
                .build();
    }

    @Bean
    public UiConfiguration uiConfig() {
        return UiConfigurationBuilder.builder()
                .displayRequestDuration(true)
                .validatorUrl(null)
                .build();
    }

    @Bean
    public SecurityScheme oauth2() {
        List<AuthorizationScope> authorizationScopeList = Arrays.asList(
                new AuthorizationScope("read", "read all"),
                new AuthorizationScope("write", "access all"));

        List<GrantType> grantTypes =
                Collections.singletonList(new ResourceOwnerPasswordCredentialsGrant(swaggerTokenURL));

        return new OAuth("oauth2", authorizationScopeList, grantTypes);
    }

    @Bean
    public SecurityConfiguration security() {
        return SecurityConfigurationBuilder.builder()
                .clientId(swaggerAppClientId)
                .clientSecret(swaggerClientSecret)
                .appName(apiTitle)
                .scopeSeparator(",")
                .build();
    }

    private SecurityContext securityContext() {
        return SecurityContext.builder().securityReferences(defaultAuth())
                .forPaths(PathSelectors.ant("/**"))
                .build();
    }

    private List<SecurityReference> defaultAuth() {
        AuthorizationScope[] authorizationScopes = new AuthorizationScope[]{
                new AuthorizationScope("global", "accessEverything")};
        return Collections.singletonList(new SecurityReference("apiKey", authorizationScopes));
    }
}
