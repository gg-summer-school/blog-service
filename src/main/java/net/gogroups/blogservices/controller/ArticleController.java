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
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

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

    @PostMapping("protected/publishers/{publisherId}/articles/categories/{categoryId}")
    //@PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<?> createProduct(@PathVariable("categoryId") String categoryId, @PathVariable("publisherId") String publisherId, @Valid @RequestBody ArticlePayload articlePayload){
        Article article = this.modelMapper.map(articlePayload, Article.class);
        this.articleService.createArticle(article, categoryId, publisherId);
        return new ResponseEntity<>(new SuccessResponse("article created successfully", new Date()), HttpStatus.CREATED);
    }


    @PutMapping("protected/publishers/{publisherId}/articles/{articleId}/file-uploads")
    //@PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<?> uploadFile(@PathVariable String articleId, @PathVariable String publisherId, MultipartFile coverPage, MultipartFile document){
        this.articleService.uploadArticleWithCoverPageImage(articleId, coverPage, document);
        String fileDownloadUri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/downloadFile/")
                .path(document.getOriginalFilename())
                .toUriString();
        String coverPageDownloadUri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/downloadFile/")
                .path(coverPage.getOriginalFilename())
                .toUriString();
        return new ResponseEntity<>(new SuccessResponse("Files uploaded successfully",  new Date()), HttpStatus.OK);
    }

    @PutMapping("protected/publishers/{publisherId}/articles/{articleId}/categories/{categoryId}")
    //@PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<ArticleDto> editArticle(@PathVariable  String articleId,
                                                  @PathVariable String categoryId,
                                                  @PathVariable String publisherId, @RequestBody UpdateArticlePayload updateArticlePayload){
        Article article = modelMapper.map(updateArticlePayload, Article.class);
        Article updatedArticle = this.articleService.editArticle(articleId, categoryId, publisherId, article);
        ArticleDto articleDto = this.modelMapper.map(updatedArticle, ArticleDto.class);
        return new ResponseEntity<>(articleDto, HttpStatus.ACCEPTED);
    }

    @DeleteMapping("protected/publishers/{publisherId}/articles/{articleId}/categories/{categoryId}")
    //@PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<?> deleteArticle(@PathVariable String articleId, @PathVariable  String categoryId, @PathVariable  String publisherId){
        this.articleService.deleteArticle(articleId, categoryId, publisherId);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @GetMapping("public/articles")
    //@PreAuthorize("hasRole('PUBLISHER') or hasRole('ADMIN') or hasRole('READER')")
    public ResponseEntity<List<ArticleDto>> getAllArticles(){
        List<Article> articles = this.articleService.getAllArticles();
        List<ArticleDto> articleDtos =  articles.stream().map((article -> this.modelMapper.map(article,ArticleDto.class))).collect(Collectors.toList());
        return new ResponseEntity<>(articleDtos, HttpStatus.OK);
    }

    @GetMapping("protected/publishers/{publisherId}/articles")
    //@PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<List<ArticleDto>> getAllArticlesByPublisher(String publisherId){
        List<Article> articles = this.articleService.getAllArticlesByPublisher(publisherId);
        List<ArticleDto> articleDtos = articles.stream().map((article -> this.modelMapper.map(article, ArticleDto.class))).collect(Collectors.toList());
        return new ResponseEntity<>(articleDtos, HttpStatus.OK);
    }

    @GetMapping("protected/publisher/{publisherId}/articles/{articleId}/categories/{categoryId}")
    //@PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<ArticleDto> getArticleByPublisher(@PathVariable String articleId, @PathVariable String categoryId, @PathVariable String publisherId ) {
        Article article = this.articleService.getArticleByPublisher(articleId,categoryId, publisherId);
        ArticleDto articleDto = this.modelMapper.map(article, ArticleDto.class);
        return new ResponseEntity<>(articleDto,HttpStatus.OK);
    }

    @GetMapping("protected/articles")
    //@PreAuthorize("hasRole('PUBLISHER') or hasRole('READER') or hasRole('ADMIN')")
    public ResponseEntity<ArticleDto> getArticle(@RequestParam("articleId") String articleId){
        Article article = this.articleService.getSingleArticle(articleId);
        ArticleDto articleDto = this.modelMapper.map(article, ArticleDto.class);
        return new ResponseEntity<>(articleDto,HttpStatus.OK);
    }

    @GetMapping("protected/users/{userId}/paid-articles")
    //@PreAuthorize("hasRole('PUBLISHER') or hasRole('READER') or hasRole('ADMIN')")
    public ResponseEntity<List<ArticleDto>> getPaidArticlesByUser(@PathVariable("userId") String userId){
        List<Article> articles = this.articleService.getAllBoughtArticles(userId);
        List<ArticleDto> articleDtos = articles.
                stream().
                map(article -> this.modelMapper.map(article, ArticleDto.class)).collect(Collectors.toList());
        return new ResponseEntity<>(articleDtos, HttpStatus.OK);
    }

    @GetMapping("protected/users/{userId}/paid-articles/{articleId}")
    //@PreAuthorize("hasRole('PUBLISHER') or hasRole('READER') or hasRole('ADMIN')")
    public ResponseEntity<ArticleDto> getPaidArticleByUser(@PathVariable String userId, @PathVariable String articleId){
        Article article = this.articleService.getBoughtArticle(userId, articleId);
        ArticleDto articleDto = this.modelMapper.map(article, ArticleDto.class);
        return new ResponseEntity<>(articleDto, HttpStatus.OK);
    }
}
