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
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Arrays;
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
    private String coverPage;
    private String document;
    private List<Contributor> contributors;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;




    public ArticleDto convertArticleToArticleDto(Article article, String... userId) {
        ArticleDto articleDto = new ArticleDto();
        String fileDownloadUri = ServletUriComponentsBuilder
                .fromCurrentContextPath()
                .path("/api/public/articles/preview/").path(article.getId())
                .toUriString();
        String coverPageUrl = ServletUriComponentsBuilder
                .fromCurrentContextPath()
                .path("/api/public/article-cover-pages/preview/")
                .path(article.getId())
                .toUriString();
        articleDto.setId(article.getId());
        articleDto.setTitle(article.getTitle());
        articleDto.setArticleAbstract(article.getArticleAbstract());
        articleDto.setPrice(article.getPrice());
        articleDto.setToc(article.getToc());
        articleDto.setUserId(article.getUser().getId());
        articleDto.setCategoryId(article.getCategory().getId());
        articleDto.setCategoryName(article.getCategory().getName());
        articleDto.setContributors(article.getContributors());
        articleDto.setCreatedAt(article.getCreatedAt());
        articleDto.setUpdatedAt(article.getUpdatedAt());
        articleDto.setDocument(fileDownloadUri);
        articleDto.setCoverPage(coverPageUrl);
        return articleDto;
    }

    public List<ArticleDto> convertArticlesToArticleDtos(List<Article>  articles){
        List<ArticleDto> articleDtos = articles.
                stream().map(article -> this.convertArticleToArticleDto(article)).collect(Collectors.toList());
        return articleDtos;
    }




}
