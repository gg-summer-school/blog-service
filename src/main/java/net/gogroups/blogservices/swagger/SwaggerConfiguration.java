package net.gogroups.blogservices.swagger;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.*;
@EnableSwagger2
@Configuration
public class SwaggerConfiguration {

    public static final String AUTHORIZATION_HEADER = "Authorization";
    private static final Set<String> PRODUCES = new HashSet<String>(Arrays.asList("application/json"));

    private ApiKey apiKey(){
        return new ApiKey("JWT", AUTHORIZATION_HEADER, "header");
    }

    private ApiInfo apiInfo(){
        return new ApiInfo(
                "Blog Service",
                "Article Blog REST API Documentation",
                "1",
                "Terms of service",
                new Contact("Babi Beulah, Vifieh Ruth and Suh Edmond", "www.website.net", "babibyoolah@gmail.com, vifiehruth@gmail.com and suhedmond25@yahoo.com"),
                "License of API",
                "API license URL",
                Collections.emptyList()
        );
    }

    @Bean
    public Docket api(){

        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .produces(PRODUCES)
                .securityContexts(Arrays.asList(securityContext()))
                .securitySchemes(Arrays.asList(apiKey()))
                .select()
                .apis(RequestHandlerSelectors.basePackage("net.gogroups.blogservices"))
                .paths(PathSelectors.any())
                .build();
    }

    private SecurityContext securityContext(){
        return SecurityContext.builder().securityReferences(defaultAuth()).build();
    }

    private List<SecurityReference> defaultAuth(){
        AuthorizationScope authorizationScope = new AuthorizationScope("global", "accessEverything");
        AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
        authorizationScopes[0] = authorizationScope;
        return Arrays.asList(new SecurityReference("JWT", authorizationScopes));
    }

}
