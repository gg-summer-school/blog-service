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
import java.util.stream.Collector;
import java.util.stream.Collectors;

import net.gogroups.blogservices.exception.ForbiddenException;
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

	private Util util = new Util();

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
				if (role.getRole().equals(ERole.READER)) {
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
				if (role.getRole().equals(ERole.PUBLISHER)) {
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
	public User getAUser(String user_id) {
		Optional<User> aUser = userRepository.findById(user_id);

		if (!userRepository.existsById(user_id)) {
			throw new ResourceNotFoundException("User with id: " + user_id + " not found");
		}

		return aUser.get();
	}

	@Override
	public String approvePublisher(String user_id, User user) {

		Optional<User> userId = userRepository.findById(user_id);

		System.out.println(userId.get().getRole());

		if (!userId.isPresent()) {
			throw new ResourceNotFoundException("User not found with id- " + user_id);
		}

		if (userId.get().isApproved()) {
			return "Publisher " + userId.get().getName() + " is already approved";
		} else {
			userId.get().setApproved(user.isApproved());
			userId.get().setId(userId.get().getId());
			userRepository.save(userId.get());
			return "Publisher " + userId.get().getName() + " has been approved";
		}

	}

	@Override
	public String suspendUser(String user_id, User user) {

		Optional<User> userId = userRepository.findById(user_id);

		if (!userId.isPresent()) {
			throw new ResourceNotFoundException("User not found with id- " + user_id);
		}
		if (userId.get().isActive()) {
			userId.get().setActive(user.isActive());
			userId.get().setId(userId.get().getId());
			userRepository.save(userId.get());
			return "User " + userId.get().getName() + " has been suspended";

		} else {
			return "User " + userId.get().getName() + " is already suspended";
		}

	}

	@Override
	public String reActivateUser(String user_id, User user) {

		Optional<User> userId = userRepository.findById(user_id);

		if (!userId.isPresent()) {
			throw new ResourceNotFoundException("User not found with id- " + user_id);
		}
		if (userId.get().isActive()) {
			return "User " + userId.get().getName() + " is already active";

		} else {
			userId.get().setActive(user.isActive());
			userId.get().setId(userId.get().getId());
			userRepository.save(userId.get());
			return "User " + userId.get().getName() + " has been reactivated";
		}

	}

	@Override
	public Transaction payForArticle(String user_id, String article_id, Transaction transaction) {
		Optional<User> user = userRepository.findById(user_id);
		Optional<Article> article = articleRepository.findById(article_id);

		if (!user.get().isActive()) {
			throw new ForbiddenException("User account is suspended");
		}
		if (!user.isPresent()) {
			throw new ResourceNotFoundException("User not found with id- " + user_id);
		}
		if (!article.isPresent()) {
			throw new ResourceNotFoundException("Article not found with id- " + article_id);
		}

		transaction.setId(util.generateId());
		transaction.setUser(user.get());
		transaction.setArticle(article.get());
		return transactionRepository.save(transaction);
	}

	@Override
	public List<Transaction> getAllTransactionsOfAUser(String user_id) {

		Optional<User> userId = userRepository.findById(user_id);

		if (!userId.isPresent()) {
			throw new ResourceNotFoundException("User not found with id- " + user_id);
		}
		List<Transaction> allTransactionsOfAUser = userId.get().getTransactions();
		if (allTransactionsOfAUser.isEmpty()) {
			throw new ResourceNotFoundException("No Transactions found under user with id- " + user_id);
		}
		return allTransactionsOfAUser;
	}

	@Override
	public void addRole(String user_id, ERole role) {
		Optional<User> userId = userRepository.findById(user_id);
		if (!userId.isPresent()) {
			throw new ResourceNotFoundException("User not found with id- " + user_id);
		}
		Role newRole = roleRepository.findByRole(role);
		userId.get().getRole().add(newRole);
		userRepository.save(userId.get());

	}

}
