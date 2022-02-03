package net.gogroups.blogservices.util;

import net.gogroups.blogservices.config.AppConfig;
import net.gogroups.blogservices.exception.BadRequestException;
import net.gogroups.blogservices.exception.CustomIOException;
import net.gogroups.blogservices.model.Category;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

public class ArticleUpload {

    private String png = "image/png";
    private String jpg = "image/jpg";
    private String jpeg = "image/jpeg";
    private String pdf = "application/pdf";
    public void uploadFile(Category category, String fileType,  MultipartFile file)  {
        AppConfig.setupFilesBaseDirectories();
        InputStream inputStream = null;
        Path  uploadDocDir = null;
        if(fileType.equals("coverPage")){
            uploadDocDir = Paths.get(AppConfig.FILEMAINDIRECTORY+ "/"+AppConfig.ARTICLECOVERPAGEBASEDIRECTORY +"/" + category.getName());
        }else if(fileType.equals("article")){
            uploadDocDir = Paths.get(AppConfig.FILEMAINDIRECTORY+ "/"+AppConfig.ARTICLEBASEDIRECTORY+"/"+category.getName());
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
        Path filePath = uploadDocDir.resolve(StringUtils.cleanPath(file.getOriginalFilename()));
        try {
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new CustomIOException("could not copy file data");
        }

    }

    public List<MultipartFile> getFileContentType(List<MultipartFile> files){
        List<MultipartFile> articles = new ArrayList<>();
        if(files.isEmpty()){
           throw new BadRequestException("File list is empty");
        }
        files.stream().forEach(multipartFile -> {
            if( multipartFile.getContentType().equals(this.png)||
                    multipartFile.getContentType().equals(this.jpg)||
                    multipartFile.getContentType().equals(this.jpeg)){
                MultipartFile   coverPage = multipartFile;
                articles.add(coverPage);
            }else if(multipartFile.getContentType().equals(this.pdf)){
                MultipartFile document = multipartFile;
                articles.add(document);
            }else {
                throw new BadRequestException("File type not supported");
            }
        });
        return articles;
    }

}
