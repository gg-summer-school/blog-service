package net.gogroups.blogservices.service;

import java.util.List;
import java.util.Optional;

import net.gogroups.blogservices.model.Transaction;
import net.gogroups.blogservices.model.User;

import net.gogroups.blogservices.model.ERole;

public interface UserService {

    User editUser(User user);

    Optional<User> loadUserDetails(String email);
	
	List<User> getAllReaders();
	
	List<User> getAllPublishers(boolean isApproved);
	
	User getAUser(String user_id);
	
	void approvePublisher(String user_id, User user);
	
	void suspendUser(String user_id, User user);
	
	void reActivateUser(String user_id, User user);
	
	void addRole(String user_id, ERole role);
	
    Transaction payForArticle(String user_id, String article_id, Transaction transaction);
	
	List<Transaction> getAllTransactionsOfAUser(String user_id);
	
	List<User> searchUsers(String name);
	
	void declinePublisher(String user_id);
	
}
