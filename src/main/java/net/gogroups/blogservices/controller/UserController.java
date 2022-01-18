package net.gogroups.blogservices.controller;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import lombok.RequiredArgsConstructor;
import net.gogroups.blogservices.dto.ApproveUserPayload;
import net.gogroups.blogservices.dto.SuspendUserPayload;
import net.gogroups.blogservices.dto.TransactionDTO;
import net.gogroups.blogservices.dto.TransactionPayload;
import net.gogroups.blogservices.dto.UserDTO;
import net.gogroups.blogservices.model.Transaction;
import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.service.UserService;
import net.gogroups.blogservices.util.SuccessResponse;

@RequestMapping("/api/")
@RestController
@RequiredArgsConstructor
public class UserController {
	
	private final UserService userService;
	
	 @Autowired
	    private ModelMapper modelMapper;
	
	 //	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("protected/users")
	public ResponseEntity<List<UserDTO>> getAllUsers() {
		List<User> allUsers = userService.getAllUsers();
		List<UserDTO> allUsersDtos = allUsers.stream().map((allUser -> 
		this.modelMapper.map(allUser, UserDTO.class))).collect(Collectors.toList());
		return new ResponseEntity<>(allUsersDtos, HttpStatus.OK);
	}
	
//	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("protected/users/{user_id}")
	public ResponseEntity<UserDTO> getUser(@PathVariable String user_id) {
		User aUser = userService.getAUser(user_id);
		UserDTO userDto = modelMapper.map(aUser, UserDTO.class);
		return new ResponseEntity<>(userDto, HttpStatus.OK);
	}
	
	
//	@PreAuthorize("hasRole('ADMIN')")
	@PutMapping("protected/approve/user/{user_id}")
	public String approvePublisher(@PathVariable String user_id,  
			@Valid @RequestBody ApproveUserPayload approveUserPayload) {
		User user = modelMapper.map(approveUserPayload, User.class);
		String approvedPublisher = userService.approvePublisher(user_id, user);
		return approvedPublisher;
	}
	
//	@PreAuthorize("hasRole('ADMIN')")
	@PutMapping("protected/suspend/user/{user_id}")
	public String suspendAUer(@PathVariable String user_id, 
			@Valid @RequestBody SuspendUserPayload suspendUserPayload) {
		User user = modelMapper.map(suspendUserPayload, User.class);
		String suspendedUser = userService.suspendUser(user_id, user);
		return suspendedUser;
	}
	
//	@PreAuthorize("hasRole('ADMIN')")
	@PutMapping("protected/reactivate/user/{user_id}")
	public String reactivateAUer(@PathVariable String user_id, 
			@Valid @RequestBody SuspendUserPayload suspendUserPayload) {
		User user = modelMapper.map(suspendUserPayload, User.class);
		String activatedUser = userService.reActivateUser(user_id, user);
		return activatedUser;
	}
	
//	@PreAuthorize("hasRole('READER') or hasRole('PUBLISHER') or hasRole('ADMIN')")
	@PostMapping("protected/transactions/user/{user_id}/article/{article_id}")
	public ResponseEntity<?> payForArticleByUser(@PathVariable String user_id, @PathVariable String article_id, 
			@Valid @RequestBody TransactionPayload transactionPayload) {
		Transaction transaction = modelMapper.map(transactionPayload, Transaction.class);
		Transaction payForArticle = userService.payForArticle(user_id, article_id, transaction);
		
		String message = payForArticle.getNameOfArticle() + " payed successfully " + "with Id " + payForArticle.getId();
		
		return new ResponseEntity<>(new SuccessResponse(message, new Date(), ""), HttpStatus.CREATED);
	}
	
//	@PreAuthorize("hasRole('READER') or hasRole('PUBLISHER') or hasRole('ADMIN')")
	@GetMapping("protected/transactions/user/{user_id}")
	public ResponseEntity<List<TransactionDTO>> getAllTransactionsOfAUser(@PathVariable String user_id) {
		List<Transaction> allTransactionsOfAUser = userService.getAllTransactionsOfAUser(user_id);
		List<TransactionDTO> allTransactionDTOs = allTransactionsOfAUser.stream().map((
				transaction -> this.modelMapper.map(transaction, TransactionDTO.class)))
				.collect(Collectors.toList());
		return new ResponseEntity<>(allTransactionDTOs, HttpStatus.OK);
				
	}
	
}
