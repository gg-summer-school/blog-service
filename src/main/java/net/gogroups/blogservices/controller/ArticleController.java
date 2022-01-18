package net.gogroups.blogservices.controller;

import net.gogroups.blogservices.dto.ArticleDto;
import net.gogroups.blogservices.dto.ArticlePayload;
import net.gogroups.blogservices.dto.UpdateArticlePayload;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.repository.UserRepository;
import net.gogroups.blogservices.service.serviceImpl.ArticleServiceImpl;
import net.gogroups.blogservices.util.ArticleUpload;
import net.gogroups.blogservices.util.SuccessResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.IOException;
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

    private ArticleUpload articleUpload = new ArticleUpload();

    @PostMapping("protected/publishers/{publisherId}/articles/categories/{categoryId}")
    //@PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<SuccessResponse> createArticle(@PathVariable("categoryId") String categoryId,
                                           @PathVariable("publisherId") String publisherId,
                                           @Valid @RequestBody ArticlePayload articlePayload){
        Article article = this.modelMapper.map(articlePayload, Article.class);
        Article createdArticle = this.articleService.createArticle(article, categoryId, publisherId);
        return new ResponseEntity<>(new SuccessResponse("article created successfully", new Date(), createdArticle.getId()), HttpStatus.CREATED);
    }


    @PutMapping(path = "protected/publishers/{publisherId}/articles/{articleId}/file-uploads",
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    //@PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<SuccessResponse> uploadFile(@PathVariable String articleId,
                                        @PathVariable String publisherId,
                                        @RequestPart("coverPage") MultipartFile coverPage,
                                        @RequestPart("document") MultipartFile document){
        this.articleService.uploadArticleWithCoverPageImage(articleId, coverPage, document);

        return new ResponseEntity<>(new SuccessResponse("Files uploaded successfuly", new Date(), ""), HttpStatus.OK);
    }

    @PutMapping("protected/publishers/{publisherId}/articles/{articleId}/categories/{categoryId}")
    //@PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<ArticleDto> editArticle(@PathVariable  String articleId,
                                                  @PathVariable String categoryId, @PathVariable String publisherId,
                                                  @RequestBody UpdateArticlePayload updateArticlePayload){
        Article article = modelMapper.map(updateArticlePayload, Article.class);
        Article updatedArticle = this.articleService.editArticle(articleId, categoryId, publisherId, article);
        ArticleDto articleDto = this.modelMapper.map(updatedArticle, ArticleDto.class);
        return new ResponseEntity<>(articleDto, HttpStatus.ACCEPTED);
    }

    @DeleteMapping("protected/publishers/{publisherId}/articles/{articleId}/categories/{categoryId}")
    //@PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<?> deleteArticle(@PathVariable String articleId,
                                           @PathVariable  String categoryId, @PathVariable  String publisherId){
        this.articleService.deleteArticle(articleId, categoryId, publisherId);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @GetMapping("public/articles")
    //@PreAuthorize("hasRole('PUBLISHER') or hasRole('ADMIN') or hasRole('READER')")
    public ResponseEntity<List<ArticleDto>> getAllArticles(){
        List<Article> articles = this.articleService.getAllArticles();
        List<ArticleDto> articleDtos =  articles.
                stream().map((article -> this.modelMapper.map(article,ArticleDto.class))).
                collect(Collectors.toList());
        return new ResponseEntity<>(articleDtos, HttpStatus.OK);
    }

    @GetMapping("protected/publishers/{publisherId}/articles")
    //@PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<List<ArticleDto>> getAllArticlesByPublisher(@PathVariable String publisherId){
        List<Article> articles = this.articleService.getAllArticlesByPublisher(publisherId);
        List<ArticleDto> articleDtos = articles.
                stream().map((article -> this.modelMapper.map(article, ArticleDto.class))).
                collect(Collectors.toList());

        return new ResponseEntity<>(articleDtos, HttpStatus.OK);
    }

    @GetMapping("protected/publisher/{publisherId}/articles/{articleId}/categories/{categoryId}")
    //@PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<ArticleDto> getArticleByPublisher(@PathVariable String articleId,
                                                            @PathVariable String categoryId,
                                                            @PathVariable String publisherId ) {
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
                map(article -> this.modelMapper.map(article, ArticleDto.class)).
                collect(Collectors.toList());
        return new ResponseEntity<>(articleDtos, HttpStatus.OK);
    }

    @GetMapping("protected/users/{userId}/paid-articles/{articleId}")
    //@PreAuthorize("hasRole('PUBLISHER') or hasRole('READER') or hasRole('ADMIN')")
    public ResponseEntity<ArticleDto> getPaidArticleByUser(@PathVariable String userId,
                                                           @PathVariable String articleId){
        Article article = this.articleService.getBoughtArticle(userId, articleId);
        ArticleDto articleDto = this.modelMapper.map(article, ArticleDto.class);
        return new ResponseEntity<>(articleDto, HttpStatus.OK);
    }

    @GetMapping("public/articles-search")
    public ResponseEntity<List<ArticleDto>> searchArticles(@RequestParam("title") String title){
        List<Article> articles = this.articleService.searchArticle(title);
        List<ArticleDto> articleDtos = articles.
                stream().
                map(article -> this.modelMapper.map(article, ArticleDto.class)).
                collect(Collectors.toList());
        return new ResponseEntity<>(articleDtos, HttpStatus.OK);
    }

    @PostMapping("protected/articles")
    public ResponseEntity<Resource> downloadFile(@RequestParam("articleId") String articleId,  HttpServletRequest request) throws IOException {
        Resource resource = this.articleService.loadFileAsResource(articleId);
        String contentType;
        contentType  = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
        if(contentType == null) {
            contentType = "application/octet-stream";
        }
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(contentType))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }
}
