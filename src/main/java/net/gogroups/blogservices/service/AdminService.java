package net.gogroups.blogservices.service;

import java.util.List;

import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.User;

public interface AdminService {
	
	List<User> getAllUsers();
	
	User getAUser(String user_id);
	
	List<Article> getAllArticlesOfAUser(String user_id);
	
	String approvePublisher(String user_id, User user);
	
	String suspendUser(String user_id, User user);
	
	String reActivateUser(String user_id, User user);
	
}
