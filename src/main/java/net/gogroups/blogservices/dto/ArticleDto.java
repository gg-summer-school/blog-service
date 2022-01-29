package net.gogroups.blogservices.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.gogroups.blogservices.config.AppConfig;
import net.gogroups.blogservices.exception.CustomIOException;
import net.gogroups.blogservices.exception.ResourceNotFoundException;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.Contributor;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ArticleDto {

    private String id;
    private String title;
    private String articleAbstract;
    private String toc;
    private BigDecimal price;
    private String  userId;
    private String categoryId;
    private String categoryName;
    private String contentType;
    private List<Contributor> contributors;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private byte[] coverPage;



    public ArticleDto convertArticleToArticleDto(Article article) {
        ArticleDto articleDto = new ArticleDto();
        articleDto.setId(article.getId());
        articleDto.setTitle(this.title = article.getTitle());
        articleDto.setArticleAbstract(this.articleAbstract = article.getArticleAbstract());
        articleDto.setPrice(article.getPrice());
        articleDto.setToc(article.getToc());
        articleDto.setUserId(article.getUser().getId());
        articleDto.setCategoryId(article.getCategory().getId());
        articleDto.setCategoryName(article.getCategory().getName());
        articleDto.setContributors(article.getContributors());
        articleDto.setCreatedAt(article.getCreatedAt());
        articleDto.setUpdatedAt(article.getUpdatedAt());
        articleDto.setContentType(this.getFileExtension(article.getCoverPage()));
        articleDto.setCoverPage(this.getImageBytes(article));
        return articleDto;
    }

    public List<ArticleDto> convertArticlesToArticleDtos(List<Article>  articles){
        List<ArticleDto> articleDtos = articles.
                stream().map(article -> this.convertArticleToArticleDto(article)).collect(Collectors.toList());
        return articleDtos;
    }


    private  byte[] getImageBytes(Article article){
        byte[] bytes;
        File file = new File(AppConfig.FILEMAINDIRECTORY + "/" +AppConfig.ARTICLECOVERPAGEBASEDIRECTORY+ "/"+ article.getCategory().getName()+ "/" + article.getCoverPage());
        try {
            InputStream inputStream = new FileInputStream(file.getPath());
            bytes = (inputStream.readAllBytes());
        } catch (IOException e) {
            throw new CustomIOException("Could not read file content");
        }
        return bytes;
    }

    private String getFileExtension(String coverPage) {
        if(StringUtils.isBlank(coverPage)){
            throw new ResourceNotFoundException("Article CoverPage not found");
        }
        return "image/"+coverPage.split("\\.")[1];
    }


}
