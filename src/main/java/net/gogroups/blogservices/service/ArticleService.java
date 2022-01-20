package net.gogroups.blogservices.service;

import net.gogroups.blogservices.dto.ArticleResponse;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.User;
import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ArticleService {
    public Article createArticle(Article article, String categoryId, String userId);
    public boolean checkIfUserIsActive( String userId);
    public Article editArticle(String articleId, String categoryId, String publisherId, Article article);
    public void deleteArticle(String articleId, String categoryId, String publisherId);
    public ArticleResponse getAllArticles(int pageNo, int pageSize, String sortBy, String sortDir);
    public List<Article> getAllArticlesByPublisher(String userId);
    public Article  getArticleByPublisher(String articleId, String categoryId, String userId);
    public Article getSingleArticle(String articleId);
    public User getUserByToken(String userId);
    public void uploadArticleWithCoverPageImage(String categoryId, String publisherId, MultipartFile coverPage, MultipartFile document);
    public List<Article> getAllBoughtArticles(String userId);
    public Article getBoughtArticle(String userId, String articleId);
    public List<Article> searchArticlesByTitle(String title);
    public  Resource loadFileAsResource(String articleId);
    public List<Article> getArticlesByCategory(String categoryId);
    public List<Article> searchArticlesByYear(int year);

}
