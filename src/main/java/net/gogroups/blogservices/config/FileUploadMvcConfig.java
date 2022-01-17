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


    @Autowired
    AppConfig appConfig = new AppConfig();
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        Path uploadCoverPageDir = Paths.get(this.appConfig.getFilesMainDirectory()+"/"+this.appConfig.getArticlesCoverPageBaseDirectory());
        Path uploadDocDir = Paths.get(this.appConfig.getFilesMainDirectory()+"/"+this.appConfig.getArticlesBaseDirectory());
        String uploadCoverPagePath = uploadCoverPageDir.toFile().getAbsolutePath();
        String uploadDocPath = uploadDocDir.toFile().getAbsolutePath();
        registry.addResourceHandler(this.appConfig.getFilesMainDirectory()+"/"+this.appConfig.getArticlesCoverPageBaseDirectory()+"/**").addResourceLocations("file:/"+ uploadCoverPagePath + "/");
        registry.addResourceHandler(this.appConfig.getFilesMainDirectory()+"/"+this.appConfig.getArticlesBaseDirectory()+"/**").addResourceLocations("file:/"+ uploadDocPath + "/");
    }
}
