package net.gogroups.blogservices.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.web.bind.annotation.*;

import lombok.RequiredArgsConstructor;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.service.AdminService;

@RequestMapping("/api")
@RestController
@RequiredArgsConstructor
public class AdminController {
	
	private final AdminService adminService;
	
	@GetMapping("/private/users")
	public List<User> getUsers() {
		List<User> allUsers = adminService.getAllUsers();
		
		return allUsers;
	}
	
	@GetMapping("/private/users/{user_id}")
	public User getUser(@PathVariable String user_id) {
		User aUser = adminService.getAUser(user_id);
		return aUser;
	}
	
	@GetMapping("/private/articles/users/{user_id}")
	public List<Article> getArticlesOfAUser(@PathVariable String user_id) {
		List<Article> allArticlesOfAUser = adminService.getAllArticlesOfAUser(user_id);
		
		return allArticlesOfAUser;
	}
	
	@PutMapping("/private/approve/user/{user_id}")
	public String approvePublisher(@PathVariable String user_id,  @Valid @RequestBody User user) {
		String approvedPublisher = adminService.approvePublisher(user_id, user);
		return approvedPublisher;
	}
	
	@PutMapping("/private/suspend/user/{user_id}")
	public String suspendAUer(@PathVariable String user_id, @Valid @RequestBody User user) {
		String suspendedUser = adminService.suspendUser(user_id, user);
		return suspendedUser;
	}
	
	@PutMapping("/private/reactivate/user/{user_id}")
	public String reactivateAUer(@PathVariable String user_id, @Valid @RequestBody User user) {
		String activatedUser = adminService.reActivateUser(user_id, user);
		return activatedUser;
	}
	
}
