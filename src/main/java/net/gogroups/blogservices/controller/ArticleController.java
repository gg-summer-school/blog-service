package net.gogroups.blogservices.controller;

import net.gogroups.blogservices.dto.ArticleDto;
import net.gogroups.blogservices.dto.ArticlePayload;
import net.gogroups.blogservices.dto.UpdateArticlePayload;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.repository.UserRepository;
import net.gogroups.blogservices.service.serviceImpl.ArticleServiceImpl;
import net.gogroups.blogservices.util.SuccessResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@CrossOrigin()
@RestController
@RequestMapping("/api/")
public class ArticleController {

    @Autowired
    private ArticleServiceImpl articleService;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    UserRepository userRepository;

    @PostMapping("protected/publisher/articles/categories")
    public ResponseEntity<?> createProduct(@RequestParam("categoryId") String categoryId, @RequestParam("coverPage") MultipartFile coverPage, @RequestParam("document") MultipartFile document, @Valid @RequestBody ArticlePayload articlePayload){
        Article article = this.modelMapper.map(articlePayload, Article.class);
        this.articleService.createArticle(article, categoryId, coverPage, document);
        return new ResponseEntity<>(new SuccessResponse("article created successfully", new Date()), HttpStatus.CREATED);
    }

    @PutMapping("protected/publisher/articles/{articleId}/categories/{categoryId}")
    public ResponseEntity<ArticleDto> editArticle(@PathVariable  String articleId,
                                                  @PathVariable String categoryId, @RequestBody UpdateArticlePayload updateArticlePayload){
        Article article = modelMapper.map(updateArticlePayload, Article.class);
        Article updatedArticle = this.articleService.editArticle(articleId, categoryId, article);
        ArticleDto articleDto = this.modelMapper.map(updatedArticle, ArticleDto.class);
        return new ResponseEntity<>(articleDto, HttpStatus.ACCEPTED);
    }

    @DeleteMapping("protected/publisher/articles/{articleId}/categories/{categoryId}")
    public ResponseEntity<?> deleteArticle(@PathVariable String articleId, @PathVariable  String categoryId){
        this.articleService.deleteArticle(articleId, categoryId);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @GetMapping("public/articles")
    public ResponseEntity<List<ArticleDto>> getAllArticles(){
        List<Article> articles = this.articleService.getAllArticles();
        List<ArticleDto> articleDtos =  articles.stream().map((article -> this.modelMapper.map(article,ArticleDto.class))).collect(Collectors.toList());
        return new ResponseEntity<>(articleDtos, HttpStatus.OK);
    }

    @GetMapping("protected/publisher/articles")
    public ResponseEntity<List<ArticleDto>> getAllArticlesByPublisher(){
        List<Article> articles = this.articleService.getAllArticlesByPublisher();
        List<ArticleDto> articleDtos = articles.stream().map((article -> this.modelMapper.map(article, ArticleDto.class))).collect(Collectors.toList());
        return new ResponseEntity<>(articleDtos, HttpStatus.OK);
    }

    @GetMapping("protected/publisher/articles/{articleId}/categories/{categoryId}")
    public ResponseEntity<ArticleDto> getArticleByPublisher(@PathVariable String articleId, @PathVariable String categoryId ) {
        Article article = this.articleService.getArticleByPublisher(articleId,categoryId);
        ArticleDto articleDto = this.modelMapper.map(article, ArticleDto.class);
        return new ResponseEntity<>(articleDto,HttpStatus.OK);
    }

    @GetMapping("protected/articles")
    public ResponseEntity<ArticleDto> getArticle(@RequestParam("articleId") String articleId){
        Article article = this.articleService.getSingleArticle(articleId);
        ArticleDto articleDto = this.modelMapper.map(article, ArticleDto.class);
        return new ResponseEntity<>(articleDto,HttpStatus.OK);
    }
}
