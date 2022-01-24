package net.gogroups.blogservices.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.file.Path;
import java.nio.file.Paths;

@Configuration
public class FileUploadMvcConfig implements WebMvcConfigurer {



    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        Path uploadCoverPageDir = Paths.get(AppConfig.FILEMAINDIRECTORY+"/"+AppConfig.ARTICLECOVERPAGEBASEDIRECTORY);
        String uploadCoverPagePath = uploadCoverPageDir.toFile().getAbsolutePath();
        registry.addResourceHandler(AppConfig.FILEMAINDIRECTORY+"/"+AppConfig.ARTICLECOVERPAGEBASEDIRECTORY+"/**").addResourceLocations("file:/"+ uploadCoverPagePath + "/");

    }
}
