package net.gogroups.blogservices.service.serviceImpl;

import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.repository.UserRepository;
import net.gogroups.blogservices.service.UserService;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import net.gogroups.blogservices.exception.ForbiddenException;
import net.gogroups.blogservices.exception.ResourceAlreadyExistException;
import net.gogroups.blogservices.exception.ResourceNotFoundException;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.ERole;
import net.gogroups.blogservices.model.Role;
import net.gogroups.blogservices.model.Transaction;
import net.gogroups.blogservices.repository.ArticleRepository;
import net.gogroups.blogservices.repository.RoleRepository;
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

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	ModelMapper modelMapper;

    private final Util util = new Util();

	@Override
	public User editUser(User user) {
		return userRepository.save(user);
	}

	@Override
	public Optional<User> loadUserDetails(String email) {
		return userRepository.findByEmail(email);
	}

	@Override
	public List<User> getAllReaders() {

		List<User> readers = new ArrayList<>();

		List<User> findAllReaders = userRepository.findAll();
		for (User user : findAllReaders) {
			for (Role role : user.getRole()) {
				if (role.getRole().equals(ERole.ROLE_READER)) {
					readers.add(user);
				}
			}
		}

		if (readers.isEmpty()) {
			throw new ResourceNotFoundException("No Users Found");
		}

		return readers;

	}

	@Override
	public List<User> getAllPublishers(boolean approved) {

		List<User> publishers = new ArrayList<>();

		List<User> findAllPublishers = userRepository.findAll();
		for (User user : findAllPublishers) {
			for (Role role : user.getRole()) {
				if (role.getRole().equals(ERole.ROLE_PUBLISHER)) {
					publishers.add(user);
				}
			}
		}

		List<User> user = publishers.stream().filter(publisher -> publisher.isApproved() == approved)
				.collect(Collectors.toList());

		if (user.isEmpty()) {
			throw new ResourceNotFoundException("No Users found");
		}

		return user;
	}

	@Override
	public void approvePublisher(String user_id, User user) {
		 
		User user1 = checkingUserId(user_id);
		
		if (user1.isApproved()) {
			throw new  ResourceAlreadyExistException("Publisher is already approved");
		} else {
			user1.setApproved(user.isApproved());
			userRepository.save(user1);
		}

	}
	
	@Override
	public void suspendUser(String user_id, User user) {
		User user1 = checkingUserId(user_id);

		if (user1.isActive()) {
			user1.setActive(user.isActive());
			userRepository.save(user1);

		} else {
			throw new ResourceAlreadyExistException("User is already suspended");
		}

	}

	@Override
	public void reActivateUser(String user_id, User user) {
		User user1 = checkingUserId(user_id);

		if (user1.isActive()) {
			throw new ResourceAlreadyExistException("User is already active");

		} else {
			user1.setActive(user.isActive());
			userRepository.save(user1);

		}

	}

	@Override
	public Transaction payForArticle(String user_id, String article_id, Transaction transaction) {
		User user = checkingUserId(user_id);
		String message = "User account has been suspended, you can't buy this article";
		if(!user.isActive()) {
			throw new ResourceNotFoundException(message);
		}

		Optional<Article> article = articleRepository.findById(article_id);
		
		Optional<Transaction> transaction_user = transactionRepository.findById(user_id);
		Optional<Transaction> transaction_article = transactionRepository.findById(article_id);
		
		if(transaction_user.isPresent() &&  transaction_article.isPresent()) {
			throw new ResourceAlreadyExistException("This article has been paid for already");
		}

		if (!user.isActive()) {
			throw new ForbiddenException("User account is suspended");
		}
		
		if (!article.isPresent()) {
			throw new ResourceNotFoundException("Article not found with id- " + article_id);
		}

		transaction.setId(util.generateId());
		transaction.setUser(user);
		transaction.setArticle(article.get());
		return transactionRepository.save(transaction);
	}

	@Override
	public List<Transaction> getAllTransactionsOfAUser(String user_id) {

		User user = checkingUserId(user_id);

		List<Transaction> allTransactionsOfAUser = user.getTransactions();
		if (allTransactionsOfAUser.isEmpty()) {
			throw new ResourceNotFoundException("No Transactions found under user with id- " + user_id);
		}
		return allTransactionsOfAUser;
	}

	@Override
	public void addRole(String user_id, ERole role) {
		User user = checkingUserId(user_id);		
		
		Role newRole = roleRepository.findByRole(role);
		
		for( Role userRole : user.getRole()) {
			if(userRole.equals(newRole)) {
				throw new ResourceAlreadyExistException("User already has the role: " + role);
			}
		}
		
		user.getRole().add(newRole);
		
		userRepository.save(user);

	}
	
	@Override
	public void removeRole(String user_id, ERole role) {
		User user = checkingUserId(user_id);
		
		Role newRole = roleRepository.findByRole(role);
				
		user.getRole().remove(newRole);
		
		userRepository.save(user);
		
	}


	@Override
	public List<User> searchUsers(String name) {
		List<User> userName = userRepository.findByName(name);
		
		if(userName.isEmpty()) {
			throw new ResourceNotFoundException("No user(s) found with name: " + name);
		}
		return userName;
	}

	@Override
	public void declinePublisher(String user_id) {
		User user = checkingUserId(user_id);
		
		 user.getRole()
			.removeIf(role -> role.getRole().equals(ERole.ROLE_PUBLISHER));
		 
		userRepository.save(user);
		
		 
	}

	@Override
	public User getPublisherByTheirArticleId(String articleId) {
		Optional<Article> article = this.articleRepository.findById(articleId);
		article.orElseThrow(() -> new ResourceNotFoundException("Resource not found"));
		Optional<User> user = this.userRepository.findById(article.get().getUser().getId());
		return user.get();
	}


	public User checkingUserId(String user_id) {
		Optional<User> user = userRepository.findById(user_id);
		if (!user.isPresent()) {
			throw new ResourceNotFoundException("User not found with id- " + user_id);
		}
		return user.get();
	}
}
