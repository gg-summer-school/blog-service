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
import net.gogroups.blogservices.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


    @Override
    public void createArticle(Article article, String categoryId) {
        boolean isActive = this.checkIfUserIsActive();
        if(!isActive){
            throw new ForbiddenException("User account is suspended");
        }
        Optional<Category>  category = categoryRepository.findById(categoryId);
        category.orElseThrow(() -> new NotFoundException("Category not found"));
        article.setCategory(category.get());
        article.setId(util.generateId());
        articleRepository.save(article);
    }

    @Override
    public boolean checkIfUserIsActive() {
        User authUser = util.getUserByToken();
        boolean isActive = false;
        Optional<User> user = userRepository.findById(authUser.getId());
        if(user.get().isActive()){
            isActive = true;
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
    public List<Article> getAllArticleByPublisher() {
        User authUser =  util.getUserByToken();
        List<Article> articles = articleRepository.findAll().stream().filter((article -> article.getUser().equals(authUser))).collect(Collectors.toList());
        return articles;
    }

    @Override
    public Article getArticleByPublisher(String articleId, String categoryId) {
        User authUser =  util.getUserByToken();
        Optional<Article> article = articleRepository.findAll().stream().filter((art) -> art.getId().equals(articleId) && art.getCategory().getId().equals(categoryId)).findFirst();
        article.orElseThrow(() -> new NotFoundException("Resource not Found"));
        if(!article.get().getUser().equals(authUser)){
            throw new ForbiddenException("Permission denied");
        }
        return article.get();
    }


}
