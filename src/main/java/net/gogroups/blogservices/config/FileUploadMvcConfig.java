package net.gogroups.blogservices.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.file.Path;
import java.nio.file.Paths;

@Configuration
public class FileUploadMvcConfig implements WebMvcConfigurer {

    @Value("${gogroroups.app.articleDocumentDirectoryName}")
    private String coverPageDir;
    @Value("${gogroups.app.articleCoverPageDirectoryName}")
    private String articleDocDir;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        Path uploadCoverPageDir = Paths.get(this.coverPageDir);
        Path uploadDocDir = Paths.get(this.articleDocDir);
        String uploadCoverPagePath = uploadCoverPageDir.toFile().getAbsolutePath();
        String uploadDocPath = uploadDocDir.toFile().getAbsolutePath();
        registry.addResourceHandler(this.coverPageDir+"/**").addResourceLocations("file:/"+ uploadCoverPagePath + "/");
        registry.addResourceHandler(this.articleDocDir+"/**").addResourceLocations("file:/"+ uploadDocPath + "/");
    }
}
