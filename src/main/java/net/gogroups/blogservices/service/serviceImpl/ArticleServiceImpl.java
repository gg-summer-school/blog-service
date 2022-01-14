package net.gogroups.blogservices.service.serviceImpl;


import net.gogroups.blogservices.exception.ForbiddenException;
import net.gogroups.blogservices.exception.NotFoundException;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.Category;
import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.repository.ArticleRepository;
import net.gogroups.blogservices.repository.CategoryRepository;
import net.gogroups.blogservices.repository.UserRepository;
import net.gogroups.blogservices.service.ArticleService;
import net.gogroups.blogservices.util.ArticleUpload;
import net.gogroups.blogservices.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ArticleServiceImpl  implements ArticleService {

    @Autowired
    ArticleRepository articleRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    CategoryRepository categoryRepository;
    private Util util = new Util();
    private ArticleUpload articleUpload = new ArticleUpload();


    @Override
    public void createArticle(Article article, String categoryId, MultipartFile coverPage, MultipartFile document) {
        boolean isActive = this.checkIfUserIsActive();
        User publisher = this.getUserByToken();
        if(!isActive){
            throw new ForbiddenException("User account is suspended");
        }
        Optional<Category>  category = categoryRepository.findById(categoryId);
        category.orElseThrow(() -> new NotFoundException("Category not found"));
        article.setCoverPage(StringUtils.cleanPath(coverPage.getOriginalFilename()));
        article.setDocument(StringUtils.cleanPath(document.getOriginalFilename()));
        article.setCategory(category.get());
        article.setId(util.generateId());
        article.setUser(publisher);
        articleRepository.save(article);
        this.articleUpload.uploadArticleWithCoverPage(category.get(), coverPage, document);
    }

    @Override
    public boolean checkIfUserIsActive() {
        User authUser = this.getUserByToken();
        boolean isActive = true;
        if(!authUser.isActive()){
            isActive = false;
        }
        return isActive;
    }

    @Override
    public Article editArticle(String articleId, String categoryId, Article editArticle) {
        Article article = this.getArticleByPublisher(articleId, categoryId);
        article.setTitle(editArticle.getTitle());
        article.setArticleAbstract(editArticle.getArticleAbstract());
        article.setToc(editArticle.getToc());
        article.setPrice(editArticle.getPrice());
        Article updatedArticle = articleRepository.saveAndFlush(article);
        return updatedArticle;

    }

    @Override
    public void deleteArticle(String articleId, String categoryId) {
        Article article = this.getArticleByPublisher(articleId, categoryId);
        articleRepository.delete(article);
    }

    @Override
    public List<Article> getAllArticles() {
        return articleRepository.findAll();
    }

    @Override
    public List<Article> getAllArticlesByPublisher() {
        User authUser =  this.getUserByToken();
        List<Article> articles = articleRepository.findAll().
                stream().filter((article -> article.getUser().getId().equals(authUser.getId()))).
                collect(Collectors.toList());
        return articles;
    }

    @Override
    public Article getArticleByPublisher(String articleId, String categoryId) {
        User authUser =  this.getUserByToken();
        Optional<Article> article = articleRepository.findAll().stream().
                filter((art) -> art.getId().equals(articleId) && art.getCategory().getId().equals(categoryId))
                .findFirst();
        article.orElseThrow(() -> new NotFoundException("Resource not Found"));
        if(!article.get().getUser().getId().equals(authUser.getId())){
            throw new ForbiddenException("Permission denied");
        }
        return article.get();
    }

    @Override
    public Article getSingleArticle(String articleId) {
        Optional<Article> article = articleRepository.findById(articleId);
        article.orElseThrow(() -> new NotFoundException("Resource not found"));
        return article.get();
    }

    //to be implemented
    public User getUserByToken(){
        Optional<User> user  = userRepository.findAll().stream().findFirst();
        return user.get();
    }
}
