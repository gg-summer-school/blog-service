package net.gogroups.blogservices.service.serviceImpl;

import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.repository.UserRepository;
import net.gogroups.blogservices.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

import net.gogroups.blogservices.exception.ForbiddenException;
import net.gogroups.blogservices.exception.ResourceNotFoundException;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.ERole;
import net.gogroups.blogservices.model.Transaction;
import net.gogroups.blogservices.repository.ArticleRepository;
import net.gogroups.blogservices.repository.TransactionRepository;
import net.gogroups.blogservices.util.Util;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserRepository userRepository;

	@Autowired
	public ArticleRepository articleRepository;
	
	@Autowired
	public TransactionRepository transactionRepository;
	
	private Util util = new Util();

	@Override
	public User saveUser(User user) {
		return userRepository.save(user);
	}

	@Override
	public Optional<User> loadUserDetails(String email) {
		return userRepository.findByEmail(email);
	}

	@Override
	public List<User> getAllUsers() {
		
		List<User> findAllUsers = userRepository.findAll();
		if(findAllUsers.isEmpty()) {
			throw new ResourceNotFoundException("No Users Found");
		}
		return findAllUsers;
	}
	
	@Override
	public User getAUser(String user_id) {
		Optional<User> aUser = userRepository.findById(user_id);
		
		if(!userRepository.existsById(user_id)) {
			throw new ResourceNotFoundException("User with id: "+ user_id +" not found");
		}
		
		return aUser.get();
	}

	@Override
	public String approvePublisher(String user_id, User user) {
		
		
		Optional<User> userId = userRepository.findById(user_id);
		
		System.out.println(userId.get().getRole());
		
		if(!userId.isPresent()) {
			throw new ResourceNotFoundException("User not found with id- "+ user_id);
		}
		
		if(!userId.get().getRole().contains(ERole.PUBLISHER)) {
			throw new ForbiddenException("User "+ userId.get().getName() +" is not a Publisher");

		}
			
		if(userId.get().isApproved()) {
			return "Publisher "+ userId.get().getName() +" is already approved";
		}else {
			userId.get().setApproved(user.isApproved());
			userId.get().setId(userId.get().getId());
			userRepository.save(userId.get());
		   return "Publisher "+ userId.get().getName() +" has been approved";
		}
		
	}

	@Override
	public String suspendUser(String user_id, User user) {
		
		
		Optional<User> userId = userRepository.findById(user_id);
		
		if(!userId.isPresent()) {
			throw new ResourceNotFoundException("User not found with id- "+ user_id);
		}
		if(userId.get().isActive()) {
			userId.get().setActive(user.isActive());
			userId.get().setId(userId.get().getId());
			userRepository.save(userId.get());
			return "User "+ userId.get().getName() +" has been suspended";
			
		
		}else {
			return "User "+ userId.get().getName() +" is already suspended";
		}
		
	}

	@Override
	public String reActivateUser(String user_id, User user) {
		
		Optional<User> userId = userRepository.findById(user_id);
		
		if(!userId.isPresent()) {
			throw new ResourceNotFoundException("User not found with id- "+ user_id);
		}
		if(userId.get().isActive()) {
			return "User "+ userId.get().getName() +" is already active";
			
		}else {
			userId.get().setActive(user.isActive());
			userId.get().setId(userId.get().getId());
			userRepository.save(userId.get());
			return "User "+ userId.get().getName() +" has been reactivated";
		}
		
	}
	
	@Override
	public Transaction payForArticle(String user_id, String article_id, Transaction transaction) {
		Optional<User> user = userRepository.findById(user_id);
		Optional<Article> article = articleRepository.findById(article_id);
		
		if(!user.get().isActive()) {
			throw new ForbiddenException("User account is suspended");
		}
		if(!user.isPresent()) {
			throw new ResourceNotFoundException("User not found with id- "+ user_id);
		}
		if(!article.isPresent()) {
			throw new ResourceNotFoundException("Article not found with id- "+ article_id);
		}
		
		transaction.setId(util.generateId());
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
