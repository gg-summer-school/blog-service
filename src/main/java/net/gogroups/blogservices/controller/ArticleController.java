package net.gogroups.blogservices.controller;

import net.gogroups.blogservices.dto.ArticleDto;
import net.gogroups.blogservices.dto.UpdateArticlePayload;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.repository.UserRepository;
import net.gogroups.blogservices.service.serviceImpl.ArticleServiceImpl;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/")
public class ArticleController {

    @Autowired
    private ArticleServiceImpl articleService;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    UserRepository userRepository;


    @PostMapping("protected/articles/categories/{categoryId}")
    public ResponseEntity<?> createProduct(@RequestParam("categoryId") String categoryId, @RequestBody ArticleDto articleDto){
        Article article = modelMapper.map(articleDto, Article.class);
        this.articleService.createArticle(article, categoryId);
        return new ResponseEntity<>("success", HttpStatus.CREATED);
    }

    @PutMapping("protected/articles/{articleId}/categories/{categoryId}")
    public ResponseEntity<ArticleDto> editArticle(@RequestParam("articleId") String articleId, @RequestParam("categoryId")String categoryId, @RequestBody UpdateArticlePayload updateArticlePayload){
        Article article = modelMapper.map(updateArticlePayload, Article.class);
        Article updatedArticle = this.articleService.editArticle(articleId, categoryId, article);
        ArticleDto articleDto = modelMapper.map(updatedArticle, ArticleDto.class);
        return new ResponseEntity<>(articleDto, HttpStatus.ACCEPTED);
    }

    @DeleteMapping("protected/articles/{articleId}/categories/{categoryId}")
    public ResponseEntity<?> deleteArticle(@RequestParam("articleId") String articleId, @RequestParam("categoryId") String categoryId){
        this.articleService.deleteArticle(articleId, categoryId);
        return new ResponseEntity<>("success", HttpStatus.NO_CONTENT);
    }

    @GetMapping("public/all-articles")
    public List<ArticleDto> getAllArticles(){
        List<Article> articles = this.articleService.getAllArticles();
        return articles.stream().map((article -> modelMapper.map(article,ArticleDto.class))).collect(Collectors.toList());
    }

    @GetMapping("protected/articles/categories")
    public List<ArticleDto> getAllArticlesByPublisher(){
        List<Article> articles = this.articleService.getAllArticleByPublisher();
        return articles.stream().map((article -> modelMapper.map(article, ArticleDto.class))).collect(Collectors.toList());
    }

    @GetMapping("protected/articles/{articleId}/categories/{categoryId}")
    public ArticleDto getArticleByPublisher(@RequestParam("articleId") String articleId, @RequestParam("categoryId") String categoryId ) {
        Article article = this.articleService.getArticleByPublisher(articleId,categoryId);
        ArticleDto articleDto = modelMapper.map(article, ArticleDto.class);
       return articleDto;
    }
}
