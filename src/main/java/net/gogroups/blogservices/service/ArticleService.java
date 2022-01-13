package net.gogroups.blogservices.service;

import net.gogroups.blogservices.model.Article;

import java.util.List;

public interface ArticleService {
    public void createArticle(Article article, String categoryId);
    public boolean checkIfUserIsActive();
    public Article editArticle(String articleId, String categoryId, Article article);
    public void deleteArticle(String articleId, String categoryId);
    public List<Article> getAllArticles();
    public List<Article> getAllArticleByPublisher();
    public Article getArticleByPublisher (String articleId, String categoryId);

}
