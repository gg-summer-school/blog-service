package net.gogroups.blogservices.service.serviceImpl;

import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.gogroups.blogservices.exception.ResourceNotFoundException;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.Transaction;
import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.repository.ArticleRepository;
import net.gogroups.blogservices.repository.TransactionRepository;
import net.gogroups.blogservices.repository.UserRepository;
import net.gogroups.blogservices.service.TransactionService;

@Service
public class TransactionServiceImpl implements TransactionService{

	@Autowired
	public UserRepository userRepository;
	
	@Autowired
	public ArticleRepository articleRepository;
	
	@Autowired
	public TransactionRepository transactionRepository;
	
	@Override
	public Transaction payForArticle(String user_id, String article_id, Transaction transaction) {
		Optional<User> user = userRepository.findById(user_id);
		Optional<Article> article = articleRepository.findById(article_id);
		
		if(!user.isPresent()) {
			throw new ResourceNotFoundException("User not found with id- "+ user_id);
		}
		if(!article.isPresent()) {
			throw new ResourceNotFoundException("Article not found with id- "+ article_id);
		}
		
		user.get().getId();
		article.get().getId();
		transaction.setUser(user.get());
		transaction.setArticle(article.get());
		return transactionRepository.save(transaction);		
	}
	
	@Override
	public List<Transaction> getAllTransactionsOfAUser(String user_id) {
		
		Optional<User> userId = userRepository.findById(user_id);
		
		if(!userId.isPresent()) {
			throw new ResourceNotFoundException("User not found with id- "+ user_id);
		}
		List<Transaction> allTransactionsOfAUser = userId.get().getTransactions();
		
		return allTransactionsOfAUser;	
		}


}
