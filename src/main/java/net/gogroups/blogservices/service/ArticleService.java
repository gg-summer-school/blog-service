package net.gogroups.blogservices.service;

import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.User;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ArticleService {
    public void createArticle(Article article, String categoryId, MultipartFile coverPage, MultipartFile document);
    public boolean checkIfUserIsActive();
    public Article editArticle(String articleId, String categoryId, Article article);
    public void deleteArticle(String articleId, String categoryId);
    public List<Article> getAllArticles();
    public List<Article> getAllArticlesByPublisher();
    public Article getArticleByPublisher (String articleId, String categoryId);
    public Article getSingleArticle(String articleId);
    public User getUserByToken();
}
