package net.gogroups.blogservices.dto;

import java.nio.file.Path;
import java.nio.file.Paths;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.gogroups.blogservices.config.AppConfig;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.Category;
import net.gogroups.blogservices.model.Contributor;

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
    private String coverPage;
    private String document;
    private BigDecimal price;
    private String  userId;
    private String categoryId;
    private String categoryName;
    private List<Contributor> contributors;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;



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
        articleDto.setDocument("/" + AppConfig.FILEMAINDIRECTORY+ "/" +
                AppConfig.ARTICLEBASEDIRECTORY + "/" +
                article.getCategory().getName() + "/" +article.getDocument());
         
        Path path = Paths.get(AppConfig.FILEMAINDIRECTORY+ "/" +
                AppConfig.ARTICLECOVERPAGEBASEDIRECTORY + "/" +
                article.getCategory().getName() + "/" +article.getCoverPage());
        String filePath = path.toAbsolutePath().toString();
        System.out.println(filePath);
        articleDto.setCoverPage((AppConfig.FILEMAINDIRECTORY+ "/" +
                AppConfig.ARTICLECOVERPAGEBASEDIRECTORY + "/" +
                article.getCategory().getName() + "/" +article.getCoverPage()));
        return articleDto;
    }

    public List<ArticleDto> convertArticlesToArticleDtos(List<Article>  articles){
        List<ArticleDto> articleDtos = articles.
                stream().map(article -> this.convertArticleToArticleDto(article)).collect(Collectors.toList());
        return articleDtos;
    }


}
