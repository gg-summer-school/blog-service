package net.gogroups.blogservices.service.serviceImpl;

import net.gogroups.blogservices.exception.ForbiddenException;
import net.gogroups.blogservices.exception.ResourceNotFoundException;
import net.gogroups.blogservices.exception.UnAuthorizedException;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.Category;
import net.gogroups.blogservices.model.Transaction;
import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.repository.ArticleRepository;
import net.gogroups.blogservices.repository.CategoryRepository;
import net.gogroups.blogservices.repository.TransactionRepository;
import net.gogroups.blogservices.repository.UserRepository;
import net.gogroups.blogservices.service.ArticleService;
import net.gogroups.blogservices.util.ArticleUpload;
import net.gogroups.blogservices.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
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
    @Autowired
    private TransactionRepository transactionRepository;
    @Autowired
    ContributorServiceImpl contributorService;


    @Override
    public Article createArticle(Article article, String categoryId, String userId) {
        boolean isActive = this.checkIfUserIsActive(userId);
        User publisher = this.getUserByToken(userId);
        if(!isActive){
            throw new ForbiddenException("User account is suspended");
        }
        Optional<Category>  category = categoryRepository.findById(categoryId);
        category.orElseThrow(() -> new ResourceNotFoundException("Category not found"));
        Article newArticle = new Article();
        newArticle.setCategory(category.get());
        newArticle.setId(util.generateId());
        newArticle.setUser(publisher);
        newArticle.setArticleAbstract(article.getArticleAbstract());
        newArticle.setPrice(article.getPrice());
        newArticle.setTitle(article.getTitle());
        newArticle.setToc(article.getToc());
        Article createdArticle = articleRepository.saveAndFlush(newArticle);
        this.contributorService.addContributors(article.getContributors(), createdArticle.getId());
        return createdArticle;

    }



    @Override
    public boolean checkIfUserIsActive(String userId) {
        User authUser = this.getUserByToken(userId);
        boolean isActive = true;
        if(!authUser.isActive()){
            isActive = false;
        }
        return isActive;
    }

    @Override
    public Article editArticle(String articleId, String categoryId, String publisherId, Article editArticle) {
        Article article = this.getArticleByPublisher(articleId, categoryId, publisherId);
        article.setTitle(editArticle.getTitle());
        article.setArticleAbstract(editArticle.getArticleAbstract());
        article.setToc(editArticle.getToc());
        article.setPrice(editArticle.getPrice());
        Article updatedArticle = articleRepository.saveAndFlush(article);
        return updatedArticle;

    }

    @Override
    public void deleteArticle(String articleId, String categoryId, String publisherId) {
        Article article = this.getArticleByPublisher(articleId, categoryId, publisherId);
        articleRepository.delete(article);
    }

    @Override
    public List<Article> getAllArticles() {
        return articleRepository.findAll();
    }

    @Override
    public List<Article> getAllArticlesByPublisher(String userId) {
        User authUser =  this.getUserByToken(userId);
        List<Article> articles = articleRepository.findAll().
                stream().filter((article -> article.getUser().getId().equals(authUser.getId()))).
                collect(Collectors.toList());
        return articles;

    }

    @Override
    public Article getArticleByPublisher(String articleId, String categoryId, String userId) {
        User authUser =  this.getUserByToken(userId);
        Optional<Article> article = articleRepository.findAll().stream().
                filter((art) -> art.getId().equals(articleId) && art.getCategory().getId().equals(categoryId))
                .findFirst();
        article.orElseThrow(() -> new ResourceNotFoundException("Resource not Found"));
        if(!article.get().getUser().getId().equals(authUser.getId())){
            throw new ForbiddenException("Permission denied");
        }
        return article.get();
    }

    @Override
    public Article getSingleArticle(String articleId) {
        Optional<Article> article = articleRepository.findById(articleId);
        article.orElseThrow(() -> new ResourceNotFoundException("Resource not found"));
        return article.get();
    }




    @Override
    public User getUserByToken(String userId){
        Optional<User> user =  userRepository.findById(userId);
        user.orElseThrow(() -> new UnAuthorizedException("Invalid user id"));
        return user.get();
    }

    @Override
    public void uploadArticleWithCoverPageImage(String articleId,  MultipartFile coverPage, MultipartFile document) {
        String articleCover = "coverPage";
        String doc = "article";
        Optional<Article>  article = articleRepository.findById(articleId);
        article.orElseThrow(() -> new ResourceNotFoundException("Category not found"));
        Category category = article.get().getCategory();
        article.get().setCoverPage(StringUtils.cleanPath(coverPage.getOriginalFilename()));
        article.get().setDocument(StringUtils.cleanPath(document.getOriginalFilename()));
        articleRepository.save(article.get());
        this.articleUpload.uploadFile(category, articleCover, coverPage);
        this.articleUpload.uploadFile(category, doc, document);
    }

    @Override
    public List<Article> getAllBoughtArticles(String userId) {
        List<Transaction> transactions = transactionRepository.findAll().
                stream().
                filter((transaction -> transaction.getUser().getId().equals(userId))).
                collect(Collectors.toList());
        List<Article> articles = new ArrayList<>();
        if(!transactions.isEmpty()){
            transactions.stream().forEach((transaction -> {
                Article article = this.getBoughtArticle(userId, transaction.getArticle().getId());
                articles.add(article);
            }));
        }
        return articles;
    }

    @Override
    public Article getBoughtArticle(String userId, String articleId) {
        Optional<Transaction> transaction = this.transactionRepository.
                findAll().
                stream().
                filter((transaction1 -> transaction1.getUser().getId().equals(userId))).
                findFirst();
        transaction.orElseThrow(() -> new ResourceNotFoundException("Resource not found"));
        Article article = this.articleRepository.findById(articleId).get();
        return article;

    }

    @Override
    public List<Article> searchArticle(String title) {
        List<Article> articles = this.articleRepository.findByTitle(title);
        return articles;
    }

}
