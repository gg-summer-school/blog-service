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
import org.apache.tika.Tika;
import org.jsoup.helper.StringUtil;
import org.springframework.util.StringUtils;

import javax.xml.bind.DatatypeConverter;
import java.io.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Base64;
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
    private List<Contributor> contributors;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private String coverPage;



    public ArticleDto convertArticleToArticleDto(Article article) {
        ArticleDto articleDto = new ArticleDto();
        String base64 = this.convertImageToBase64(article);
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
        articleDto.setCoverPage("data:" + this.getFileExtension(article.getCoverPage()) + ";base64," + base64);
        return articleDto;
    }

    public List<ArticleDto> convertArticlesToArticleDtos(List<Article>  articles){
        List<ArticleDto> articleDtos = articles.
                stream().map(article -> this.convertArticleToArticleDto(article)).collect(Collectors.toList());
        return articleDtos;
    }


    private String convertImageToBase64(Article article){
        String base64Image ="";
        File file = new File(AppConfig.FILEMAINDIRECTORY + "/" +AppConfig.ARTICLECOVERPAGEBASEDIRECTORY+ "/"+ article.getCategory().getName()+ "/" + article.getCoverPage());
        try {
            InputStream inputStream = new FileInputStream(file.getPath());
            base64Image = Base64.getEncoder().encodeToString(inputStream.readAllBytes());
        } catch (FileNotFoundException e) {
           throw new CustomIOException("File not found");
        } catch (IOException e) {
            throw new CustomIOException("Could not read file content");
        }
        return base64Image;
    }

    private String getFileExtension(String coverPage) {
        if(StringUtil.isBlank(coverPage)){
            throw new ResourceNotFoundException("Article CoverPage not found");
        }
        return "image/"+coverPage.split("\\.")[1];
    }


}
