package net.gogroups.blogservices.service.serviceImpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.gogroups.blogservices.exception.ResourceNotFoundException;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.ERole;
import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.repository.UserRepository;
import net.gogroups.blogservices.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	public UserRepository userRepository;

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
	public List<Article> getAllArticlesOfAUser(String user_id) {
		
		Optional<User> userId = userRepository.findById(user_id);
		
		if(!userId.isPresent()) {
			throw new ResourceNotFoundException("User not found with id- "+ user_id);
		}
		List<Article> allArticlesOfAUser = userId.get().getArticles();
		return allArticlesOfAUser;
	}

	@Override
	public String approvePublisher(String user_id, User user) {
		
		
		Optional<User> userId = userRepository.findById(user_id);
		
		System.out.println(userId.get().getRole());
		
		if(!userId.isPresent()) {
			throw new ResourceNotFoundException("User not found with id- "+ user_id);
		}
		if(!(userId.get().getRole().equals(ERole.PUBLISHER))) {
			
		if(userId.get().isApproved()) {
			return "Publisher "+ userId.get().getName() +" is already approved";
		}else {
			userId.get().setApproved(user.isApproved());
			userId.get().setId(userId.get().getId());
			userRepository.save(userId.get());
		   return "Publisher "+ userId.get().getName() +" has been approved";
		}
		}else {
			throw new ResourceNotFoundException("User "+ userId.get().getName() +" is not a Publisher");
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


}
