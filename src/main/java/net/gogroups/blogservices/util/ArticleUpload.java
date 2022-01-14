package net.gogroups.blogservices.util;

import net.gogroups.blogservices.exception.CustomIOException;
import net.gogroups.blogservices.model.Category;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class ArticleUpload {

    @Value("${gogroroups.app.articleDocumentDirectoryName}")
    private String coverPageDir;
    @Value("${gogroups.app.articleCoverPageDirectoryName}")
    private String articleDocDir;
    public void uploadArticleWithCoverPage(Category category, MultipartFile coverPage, MultipartFile document)  {
        InputStream coverPageInputStream = null;
        InputStream documentInputStream = null;
        Path uploadCoverPageDir = Paths.get(this.coverPageDir+"/"+category.getName());
        Path  uploadDocDir = Paths.get(this.articleDocDir+"/"+category.getName());
        if(!Files.exists(uploadCoverPageDir)){
            try {
                Files.createDirectory(uploadCoverPageDir);
            } catch (IOException se) {
                throw  new CustomIOException("could not create folder to store the article cover page");
            }
        }
        if(!Files.exists(uploadDocDir)){
            try {
                Files.createDirectory(uploadDocDir);
            } catch (IOException e) {
                throw  new CustomIOException("could not create folder to store the article");
            }
        }
        try {
            coverPageInputStream = coverPage.getInputStream();
        } catch (IOException e) {
           throw new CustomIOException("could not read file data");
        }
        try {
            documentInputStream = document.getInputStream();
        } catch (IOException e) {
            throw new CustomIOException("could not read file data");
        }
        Path coverPageFilePath = uploadCoverPageDir.resolve(coverPage.getName());
        Path documentFilePath = uploadDocDir.resolve(document.getName());
        try {
            Files.copy(coverPageInputStream, coverPageFilePath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new CustomIOException("could not copy file data");
        }
        try {
            Files.copy(documentInputStream, documentFilePath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new CustomIOException("could not copy file data");
        }

    }
}
