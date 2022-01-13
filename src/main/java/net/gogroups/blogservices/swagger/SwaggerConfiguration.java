package net.gogroups.blogservices.swagger;

//@Configuration
//@EnableSwagger2
public class SwaggerConfiguration {

//    public static final String AUTHORIZATION_HEADER = "Authorization";
//
//    public static final Contact DEFAULT_CONTACT = new Contact("www.gogroups.net", "", "someoneh@gmail.com");
//
//    public static final ApiInfo DEFAULT_API_INFO = new ApiInfo("Product Catalog", "Product Catalog Description", "1.0",
//            "urn:tos", DEFAULT_CONTACT, "Apache 2.0", "http://www.apache.org/licenses/LICENSE-2.0", Arrays.asList());
//
//    private static final Set<String> DEFAULT_PRODUCES_AND_CONSUMES = new HashSet<String>(
//            Arrays.asList("application/json"));
//
//    private ApiKey apiKey() {
//        return new ApiKey("JWT", AUTHORIZATION_HEADER, "header");
//    }
//    @Configuration
//    public class SpringFoxConfig {
//        @Bean
//        public Docket api() {
//            return new Docket(DocumentationType.SWAGGER_2)
//                    .select()
//                    .apis((Predicate<RequestHandler>) RequestHandlerSelectors.basePackage("net.gogroups.blogservices"))
//                    .paths((Predicate<String>) PathSelectors.any())
//                    .build();
//        }
//    }

//    @Bean
//    public Docket api() {
//        return new Docket(DocumentationType.SWAGGER_2).apiInfo(DEFAULT_API_INFO).produces(DEFAULT_PRODUCES_AND_CONSUMES)
//                .consumes(DEFAULT_PRODUCES_AND_CONSUMES).securityContexts(Arrays.asList(securityContext()))
//                .securitySchemes(Arrays.asList(apiKey())).select()
//                .apis(RequestHandlerSelectors.basePackage("net.gogroups.blogservices"))
//                .paths(PathSelectors.any()).build();
//    }

//    private SecurityContext securityContext() {
//        return SecurityContext.builder().securityReferences(defaultAuth()).build();
//    }
//
//    private List<SecurityReference> defaultAuth() {
//        AuthorizationScope authorizationScope = new AuthorizationScope("global", "accessEverything");
//        AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
//        authorizationScopes[0] = authorizationScope;
//        return Arrays.asList(new SecurityReference("JWT", authorizationScopes));
//    }

}

