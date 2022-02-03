package net.gogroups.blogservices.controller;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import net.gogroups.blogservices.config.AppConfig;
import net.gogroups.blogservices.dto.ArticleDto;
import net.gogroups.blogservices.dto.ArticleResponse;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.payload.request.ArticlePayload;
import net.gogroups.blogservices.payload.request.UpdateArticlePayload;
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
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Date;
import java.util.List;

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
    private final ArticleUpload articleUpload = new ArticleUpload();
    private final ArticleDto articleDto = new ArticleDto();


    @ApiOperation(value = "", authorizations = {
            @Authorization(value = "jwtToken") })
    @PostMapping("protected/publishers/{publisherId}/articles/categories/{categoryId}")
    @PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<SuccessResponse> createArticle(@PathVariable("categoryId") String categoryId,
                                           @PathVariable("publisherId") String publisherId,
                                           @Valid @RequestBody ArticlePayload articlePayload){
        Article article = this.modelMapper.map(articlePayload, Article.class);
        Article createdArticle = this.articleService.createArticle(article, categoryId, publisherId);
        return new ResponseEntity<>(new SuccessResponse("article created successfully", new Date(), createdArticle.getId()), HttpStatus.CREATED);
    }


    @ApiOperation(value = "", authorizations = {
            @Authorization(value = "jwtToken") })
    @PutMapping(path = "protected/publishers/{publisherId}/articles/{articleId}/file-uploads",
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<SuccessResponse> uploadFile(@PathVariable String articleId,
                                        @PathVariable String publisherId,
                                        @RequestPart("files") List<MultipartFile> multipartFiles){
        List<MultipartFile> files = this.articleUpload.getFileContentType(multipartFiles);
        MultipartFile coverPage = files.get(0);
        MultipartFile document = files.get(1);
        this.articleService.uploadArticleWithCoverPageImage(articleId, publisherId, coverPage, document);
        return new ResponseEntity<>(new SuccessResponse("Files uploaded successfully", new Date(), ""), HttpStatus.OK);
    }

    @ApiOperation(value = "", authorizations = {
            @Authorization(value = "jwtToken") })
    @PutMapping("protected/publishers/{publisherId}/articles/{articleId}/categories/{categoryId}")
    @PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<ArticleDto> editArticle(@PathVariable  String articleId,
                                                  @PathVariable String categoryId, @PathVariable String publisherId,
                                                  @RequestBody UpdateArticlePayload updateArticlePayload){
        Article article = modelMapper.map(updateArticlePayload, Article.class);
        Article updatedArticle = this.articleService.editArticle(articleId, categoryId, publisherId, article);
        ArticleDto articleDto = this.articleDto.convertArticleToArticleDto(updatedArticle);
        return new ResponseEntity<>(articleDto, HttpStatus.ACCEPTED);
    }


    @GetMapping("public/articles")
    public ResponseEntity<ArticleResponse> getAllArticles(
            @RequestParam(value = "pageNo", defaultValue = AppConfig.PAGENUMBER, required = false) int pageNo,
            @RequestParam(value = "pageSize", defaultValue = AppConfig.PAGESIZE, required = false) int pageSize,
            @RequestParam(value = "sortBy", defaultValue = AppConfig.SORTBY, required = false) String sortBy,
            @RequestParam(value = "sortDir", defaultValue = AppConfig.SORTDIRECTION, required = false) String sortDir
            ){
        ArticleResponse articleResponses = this.articleService.getAllArticles(pageNo, pageSize,  sortBy, sortDir);
        return new ResponseEntity<>(articleResponses, HttpStatus.OK);
    }

    @GetMapping("protected/publishers/{publisherId}/articles")
    @ApiOperation(value = "", authorizations = {
            @Authorization(value = "jwtToken") })
    @PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<List<ArticleDto>> getAllArticlesByPublisher(@PathVariable String publisherId){
        List<Article> articles = this.articleService.getAllArticlesByPublisher(publisherId);
        List<ArticleDto> articleDtos = this.articleDto.convertArticlesToArticleDtos(articles);
        return new ResponseEntity<>(articleDtos, HttpStatus.OK);
    }

    @ApiOperation(value = "", authorizations = {
            @Authorization(value = "jwtToken") })
    @GetMapping("protected/publisher/{publisherId}/articles/{articleId}/categories/{categoryId}")
    @PreAuthorize("hasRole('PUBLISHER')")
    public ResponseEntity<ArticleDto> getArticleByPublisher(@PathVariable String articleId,
                                                            @PathVariable String categoryId,
                                                            @PathVariable String publisherId ) {
        Article article = this.articleService.getArticleByPublisher(articleId,categoryId, publisherId);
        ArticleDto articleDto = this.articleDto.convertArticleToArticleDto(article);
        return new ResponseEntity<>(articleDto,HttpStatus.OK);
    }

    @GetMapping("public/articles/{articleId}")
    public ResponseEntity<ArticleDto> getArticle(@PathVariable String articleId){
        Article article = this.articleService.getSingleArticle(articleId);
        ArticleDto articleDto = this.articleDto.convertArticleToArticleDto(article);
        return new ResponseEntity<>(articleDto,HttpStatus.OK);
    }

    @GetMapping("protected/users/{userId}/paid-articles")
    @ApiOperation(value = "", authorizations = {
            @Authorization(value = "jwtToken") })
    @PreAuthorize("hasRole('PUBLISHER') or hasRole('READER') or hasRole('ADMIN')")
    public ResponseEntity<List<ArticleDto>> getPaidArticlesByUser(@PathVariable("userId") String userId){
        List<Article> articles = this.articleService.getAllBoughtArticles(userId);
        List<ArticleDto> articleDtos = this.articleDto.convertArticlesToArticleDtos(articles);
        return new ResponseEntity<>(articleDtos, HttpStatus.OK);
    }

    @GetMapping("protected/users/{userId}/paid-articles/{articleId}")
    @ApiOperation(value = "", authorizations = {
            @Authorization(value = "jwtToken") })
    @PreAuthorize("hasRole('PUBLISHER') or hasRole('READER') or hasRole('ADMIN')")
    public ResponseEntity<ArticleDto> getPaidArticleByUser(@PathVariable String userId,
                                                           @PathVariable String articleId){
        Article article = this.articleService.getBoughtArticle(userId, articleId);
        ArticleDto articleDto = this.articleDto.convertArticleToArticleDto(article);
        return new ResponseEntity<>(articleDto, HttpStatus.OK);
    }

    @GetMapping("public/articles-search")
    public ResponseEntity<List<ArticleDto>> searchArticlesByTitle(@RequestParam("title") String title){
        List<Article> articles = this.articleService.searchArticlesByTitle(title);
        List<ArticleDto> articleDtos = this.articleDto.convertArticlesToArticleDtos(articles);
        return new ResponseEntity<>(articleDtos, HttpStatus.OK);
    }

    @GetMapping("public/articles/preview/{articleId}")
    public ResponseEntity<Resource> previewFile(@PathVariable("articleId") String articleId,
                                                 HttpServletRequest request) throws IOException {
        Resource resource = this.articleService.loadFileAsResource(articleId);
        String contentType;
        contentType  = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(contentType))
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }

    @GetMapping("public/article-cover-pages/preview/{articleId}")
    public ResponseEntity<Resource> previewFileCoverPage(@PathVariable("articleId") String articleId,
                                                HttpServletRequest request) throws IOException {
        Resource resource = this.articleService.loadArticleCoverPage(articleId);
        String contentType;
        contentType  = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(contentType))
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }

    @GetMapping("public/articles/categories")
    public ResponseEntity<List<ArticleDto>> getArticlesByCategories(@RequestParam("categoryId") String categoryId){
        List<Article> articles = this.articleService.getArticlesByCategory(categoryId);
        List<ArticleDto> articleDtoList =  this.articleDto.convertArticlesToArticleDtos(articles);
        return new ResponseEntity<>(articleDtoList, HttpStatus.OK);
    }

    @GetMapping("public/articles-search-by-year")
    public ResponseEntity<List<ArticleDto>> searchArticlesByYear(@RequestParam("year") int year){
        List<Article> articles = this.articleService.searchArticlesByYear(year);
        List<ArticleDto> articleDtos = this.articleDto.convertArticlesToArticleDtos(articles);
        return new ResponseEntity<>(articleDtos, HttpStatus.OK);
    }

    @GetMapping("protected/users/{userId}/articles/{articleId}/check-if-user-has-bought-article")
    @ApiOperation(value = "", authorizations = {
            @Authorization(value = "jwtToken") })
    public ResponseEntity<?> checkIfUserHasBoughtArticle(@PathVariable String userId, @PathVariable String articleId){
        boolean hasBought = this.articleService.checkIfUserHasBoughtArticle(articleId, userId);
        return new ResponseEntity<>(hasBought, HttpStatus.OK);
    }




}
