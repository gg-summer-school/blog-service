package net.gogroups.blogservices.util;

import net.gogroups.blogservices.config.AppConfig;
import net.gogroups.blogservices.exception.CustomIOException;
import net.gogroups.blogservices.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class ArticleUpload {

    @Autowired
    AppConfig appConfig = new AppConfig();

    public void uploadFile(Category category, String fileType,  MultipartFile file)  {
        this.appConfig.setupFilesBaseDirectories();
        System.out.println(this.appConfig.getArticlesCoverPageBaseDirectory());
        InputStream inputStream = null;
        Path  uploadDocDir = null;
        if(fileType.equals("coverPage")){
            uploadDocDir = Paths.get(this.appConfig.getFilesMainDirectory()+ "/"+this.appConfig.getArticlesCoverPageBaseDirectory() +"/" + category.getName());
        }else if(fileType.equals("article")){
            uploadDocDir = Paths.get(this.appConfig.getFilesMainDirectory()+ "/"+this.appConfig.getArticlesBaseDirectory()+"/"+category.getName());
        }
        if(!Files.exists(uploadDocDir)){
            try {
                Files.createDirectory(uploadDocDir);
            } catch (IOException e) {
                throw  new CustomIOException("could not create folder to store the file");
            }
        }
        try {
            inputStream = file.getInputStream();
        } catch (IOException e) {
            throw new CustomIOException("could not read file data");
        }
        Path filePath = uploadDocDir.resolve(file.getName());
        try {
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new CustomIOException("could not copy file data");
        }

    }



}
