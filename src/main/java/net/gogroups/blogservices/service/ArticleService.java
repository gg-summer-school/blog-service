package net.gogroups.blogservices.service;

import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.User;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ArticleService {
    public Article createArticle(Article article, String categoryId, String userId);
    public boolean checkIfUserIsActive( String userId);
    public Article editArticle(String articleId, String categoryId, String publisherId, Article article);
    public void deleteArticle(String articleId, String categoryId, String publisherId);
    public List<Article> getAllArticles();
    public List<Article> getAllArticlesByPublisher(String userId);
    public Article  getArticleByPublisher(String articleId, String categoryId, String userId);
    public Article getSingleArticle(String articleId);
    public User getUserByToken(String userId);
    public void uploadArticleWithCoverPageImage(String categoryId, MultipartFile coverPage, MultipartFile document);
    public List<Article> getAllBoughtArticles(String userId);
    public Article getBoughtArticle(String userId, String articleId);
}
