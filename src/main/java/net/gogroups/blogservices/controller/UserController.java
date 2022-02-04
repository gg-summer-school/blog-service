package net.gogroups.blogservices.controller;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import net.gogroups.blogservices.model.ERole;
import net.gogroups.blogservices.model.Transaction;
import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.payload.request.*;
import net.gogroups.blogservices.payload.response.MessageResponse;
import net.gogroups.blogservices.service.UserService;
import net.gogroups.blogservices.util.SuccessResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.nio.file.attribute.UserPrincipalNotFoundException;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import net.gogroups.blogservices.dto.TransactionDTO;
import net.gogroups.blogservices.dto.UserDTO;
import net.gogroups.blogservices.dto.UserDetailsDTO;
import net.gogroups.blogservices.exception.ResourceNotFoundException;

@RestController
@RequestMapping("/api/protected/")
@CrossOrigin()
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	PasswordEncoder encoder;

	@Autowired
	private ModelMapper modelMapper;

	@ApiOperation(value = "This method is used to get user details.", authorizations = {
			@Authorization(value = "jwtToken") })
	@GetMapping("/users/user_profile")
	public ResponseEntity<?> retrieveUserDetails() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		Optional<User> user = userService.loadUserDetails(userDetails.getUsername());
		UserDetailsDTO userDetailsDTO = new UserDetailsDTO(user.get().getId(), user.get().getName(),
				user.get().getEmail(), user.get().getArticles(), user.get().getRole());

		return new ResponseEntity<>(userDetailsDTO, HttpStatus.OK);
	}

	@ApiOperation(value = "This method is used to edit user details.", authorizations = {
			@Authorization(value = "jwtToken") })
	@PatchMapping("/users/user_profile")
	public ResponseEntity<User> editUserInfo(@Valid @RequestBody UserPayload editUserPayload) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();

		User editUser = this.modelMapper.map(editUserPayload, User.class);
		User user = userService.loadUserDetails(userDetails.getUsername()).get();

		if (!(user == null)) {
			user.setName(editUser.getName());
			user.setEmail(editUser.getEmail());

			return new ResponseEntity<>(userService.editUser(user), HttpStatus.ACCEPTED);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

	@ApiOperation(value = "This method is used to edit user password", authorizations = {
			@Authorization(value = "jwtToken") })
	@PatchMapping("/users/user_profile/change_password")
	public ResponseEntity<MessageResponse> changePassword(
			@Valid @RequestBody UserPasswordChangePayload oldUserPasswordPayload) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();

		User user = userService.loadUserDetails(userDetails.getUsername()).get();
		User editUserPassword = this.modelMapper.map(user, User.class);

		if (user == null)
			return new ResponseEntity<>(new MessageResponse("User does not exist"), HttpStatus.NOT_FOUND);

		else if (!(encoder.matches(oldUserPasswordPayload.getOldPassword(), editUserPassword.getPassword())))
			return new ResponseEntity<>(new MessageResponse("Passwords donot match"), HttpStatus.BAD_REQUEST);
		else {
			editUserPassword.setPassword(encoder.encode(oldUserPasswordPayload.getNewPassword()));
			userService.editUser(user);
			return new ResponseEntity<>(new MessageResponse("Password Updated"), HttpStatus.ACCEPTED);
		}
	}

	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("users/readers")
	public ResponseEntity<List<UserDTO>> getReaders() {

		List<User> allReaders = userService.getAllReaders();

		List<UserDTO> listOfReadersDTOs = getListOfUserResourceDTOs(allReaders);

		return new ResponseEntity<>(listOfReadersDTOs, HttpStatus.OK);
	}

	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("users/publishers/{isApproved}")
	public ResponseEntity<List<UserDTO>> getPublishers(@PathVariable boolean isApproved) {

		List<User> publishers = userService.getAllPublishers(isApproved);
		List<UserDTO> listOfPublishersDTOs = getListOfUserResourceDTOs(publishers);

		return new ResponseEntity<>(listOfPublishersDTOs, HttpStatus.OK);
	}

	@PatchMapping("approve/users/{publisher_id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<SuccessResponse> approvePublisher(@PathVariable String publisher_id,
			@Valid @RequestBody ApproveUserPayload approveUserPayload) {
		User user = modelMapper.map(approveUserPayload, User.class);
		userService.approvePublisher(publisher_id, user);
		String message = "Publisher is approved";

		return new ResponseEntity<>(new SuccessResponse(message, new Date(), ""), HttpStatus.OK);
	}

	@PreAuthorize("hasRole('ADMIN')")
	@PatchMapping("suspend/users/{user_id}")
	public ResponseEntity<SuccessResponse> suspendUser(@PathVariable String user_id,
			@Valid @RequestBody SuspendUserPayload suspendUserPayload) {
		User user = modelMapper.map(suspendUserPayload, User.class);
		userService.suspendUser(user_id, user);
		String message = "User is suspended";

		return new ResponseEntity<>(new SuccessResponse(message, new Date(), ""), HttpStatus.OK);
	}

	@PreAuthorize("hasRole('ADMIN')")
	@PatchMapping("reactivate/users/{user_id}")
	public ResponseEntity<SuccessResponse> reactivateUser(@PathVariable String user_id,
			@Valid @RequestBody SuspendUserPayload suspendUserPayload) {
		User user = modelMapper.map(suspendUserPayload, User.class);
		userService.reActivateUser(user_id, user);

		String message = "User is reactivated";
		return new ResponseEntity<>(new SuccessResponse(message, new Date(), ""), HttpStatus.OK);
	}

	@PreAuthorize("hasRole('READER') or hasRole('PUBLISHER') or hasRole('ADMIN')")
	@PostMapping("transactions/users/{user_id}/articles/{article_id}")
	public ResponseEntity<?> payForArticleByUser(@PathVariable String user_id, @PathVariable String article_id,
			@Valid @RequestBody TransactionPayload transactionPayload) {
		Transaction transaction = modelMapper.map(transactionPayload, Transaction.class);
		Transaction payForArticle = userService.payForArticle(user_id, article_id, transaction);

		String message = payForArticle.getNameOfArticle() + " payed successfully " + "with Id " + payForArticle.getId();

		return new ResponseEntity<>(new SuccessResponse(message, new Date(), ""), HttpStatus.CREATED);
	}

	@PreAuthorize("hasRole('READER') or hasRole('PUBLISHER')")
	@GetMapping("/transactions/users/{user_id}")
	public ResponseEntity<List<TransactionDTO>> getAllTransactionsOfAUser(@PathVariable String user_id) {
		List<Transaction> allTransactionsOfAUser = userService.getAllTransactionsOfAUser(user_id);
		List<TransactionDTO> allTransactionDTOs = allTransactionsOfAUser.stream()
				.map((transaction -> this.modelMapper.map(transaction, TransactionDTO.class)))
				.collect(Collectors.toList());
		return new ResponseEntity<>(allTransactionDTOs, HttpStatus.OK);

	}

	//@PreAuthorize("hasRole('ADMIN')")
	@PatchMapping("add-role/users/{user_id}")
	public ResponseEntity<SuccessResponse> addRole(@PathVariable String user_id,
			@RequestBody RolePayload addRolePayload) {
		
		ERole userRole = modelMapper.map(addRolePayload.getRole(), ERole.class);
		userService.addRole(user_id, userRole);
		String message = "Role added successfully";
		return ResponseEntity.ok(new SuccessResponse(message, new Date(), ""));
	}
	
	@PreAuthorize("hasRole('ADMIN')")
	@PatchMapping("remove-role/users/{user_id}")
	public ResponseEntity<SuccessResponse> removeRole(@PathVariable String user_id,
			@RequestBody RolePayload removeRolePayload) {
			ERole userRole = modelMapper.map(removeRolePayload.getRole(), ERole.class);
			userService.removeRole(user_id, userRole);
			String message = "Role removed successfully";

			return ResponseEntity.ok(new SuccessResponse(message, new Date(), ""));
		
	}

	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("/users/{user_name}")
	public ResponseEntity<List<UserDTO>> searchUser(@PathVariable String user_name) {
		List<User> users = userService.searchUsers(user_name);
		List<UserDTO> userDTOs = getListOfUserResourceDTOs(users);

		return new ResponseEntity<>(userDTOs, HttpStatus.OK);
	}


	@PreAuthorize("hasRole('ADMIN')")
	@DeleteMapping("users/{publisher_id}")
	public ResponseEntity<SuccessResponse> declinePulisher(@PathVariable("publisher_id") String publisher_id) {
		userService.declinePublisher(publisher_id);
		String message = "Publisher is declined";
		return new ResponseEntity<>(new SuccessResponse(message, new Date(), ""), HttpStatus.OK);
	}

	private List<UserDTO> getListOfUserResourceDTOs(List<User> users) {

		List<UserDTO> userDTOs = users.stream().map((user -> this.modelMapper.map(user, UserDTO.class)))
				.collect(Collectors.toList());
		return userDTOs;
	}
}
