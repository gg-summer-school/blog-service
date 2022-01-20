package net.gogroups.blogservices.controller;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import net.gogroups.blogservices.model.ERole;
import net.gogroups.blogservices.model.Transaction;
import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.model.UserDetailsDTO;
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
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;




import net.gogroups.blogservices.dto.TransactionDTO;
import net.gogroups.blogservices.dto.UserDTO;

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
		UserDetailsDTO userDetailsDTO = new UserDetailsDTO(user.get().getId(),
										user.get().getName(),
										user.get().getEmail(),
										user.get().getArticles(),
										user.get().getRole());

		return new ResponseEntity<>(userDetailsDTO, HttpStatus.OK);
    }


    @ApiOperation(value = "This method is used to edit user details.", authorizations = {
            @Authorization(value = "jwtToken") })
	//@PreAuthorize("hasRole('ADMIN') or hasRole('READER') or hasRole('PUBLISHER')")
    @PutMapping("/users/user_profile")
    public ResponseEntity<User> editUserInfo( @Valid @RequestBody UserPayload editUserPayload) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();

		User editUser = this.modelMapper.map(editUserPayload, User.class);
        User user = userService.loadUserDetails(userDetails.getUsername()).get();

        if (!(user == null)) {
            user.setName(editUser.getName());
            user.setEmail(editUser.getEmail());

            return new ResponseEntity<>(userService.editUser(user), HttpStatus.CREATED);

        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

	@ApiOperation(value = "This method is used to edit user password", authorizations = {
			@Authorization(value = "jwtToken") })
//	@PreAuthorize("hasRole('ADMIN') or hasRole('READER') or hasRole('PUBLISHER')")
	@PatchMapping("/users/user_profile/change_password")
	public ResponseEntity<MessageResponse> changePassword( @Valid @RequestBody UserPasswordChangePayload oldUserPasswordPayload) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();

		User user = userService.loadUserDetails(userDetails.getUsername()).get();
		User editUserPassword = this.modelMapper.map(user, User.class);
//		editUserPassword.setPassword(oldUserPasswordPayload.getNewPassword());


		if (user == null)
			return new ResponseEntity<>(new MessageResponse("User does not exist"), HttpStatus.NOT_FOUND);

		else if(!(encoder.matches(oldUserPasswordPayload.getOldPassword(),editUserPassword.getPassword())))
			return new ResponseEntity<>(new MessageResponse("Passwords donot match"),HttpStatus.BAD_REQUEST);
		else{
			editUserPassword.setPassword(encoder.encode(oldUserPasswordPayload.getNewPassword()));
			userService.editUser(user);
			return new ResponseEntity<>(new MessageResponse("Password Updated"),HttpStatus.CREATED);
		}
	}

	 	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("users/readers")
	public ResponseEntity<List<UserDTO>> getReaders() {
		
		List<User> allReaders = userService.getAllReaders();
		List<UserDTO> allReadersDtos = allReaders.stream().map((reader -> 
		this.modelMapper.map(reader, UserDTO.class))).collect(Collectors.toList());
		
		return new ResponseEntity<>(allReadersDtos, HttpStatus.OK);
	}
	
	//@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("users/publishers/{isApproved}")
	public ResponseEntity<List<UserDTO>> getPublishers(@PathVariable boolean isApproved) {
		
		List<User> publishers = userService.getAllPublishers(isApproved);
		List<UserDTO> publishersDTOs = publishers.stream().map((publisher -> 
		this.modelMapper.map(publisher, UserDTO.class))).collect(Collectors.toList());
		
		return new ResponseEntity<>(publishersDTOs, HttpStatus.OK);
	}
	//	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("users/{user_id}")
	public ResponseEntity<UserDTO> getUser(@PathVariable String user_id) {
		User aUser = userService.getAUser(user_id);
		UserDTO userDto = modelMapper.map(aUser, UserDTO.class);
		return new ResponseEntity<>(userDto, HttpStatus.OK);
	}
	
	
	//@PreAuthorize("hasRole('ADMIN')")
	@PutMapping("approve/user/{user_id}")
	public String approvePublisher(@PathVariable String user_id,  
			@Valid @RequestBody ApproveUserPayload approveUserPayload) {
		User user = modelMapper.map(approveUserPayload, User.class);
		String approvedPublisher = userService.approvePublisher(user_id, user);
		return approvedPublisher;
	}
	
	//@PreAuthorize("hasRole('ADMIN')")
	@PutMapping("suspend/user/{user_id}")
	public String suspendAUer(@PathVariable String user_id, 
			@Valid @RequestBody SuspendUserPayload suspendUserPayload) {
		User user = modelMapper.map(suspendUserPayload, User.class);
		String suspendedUser = userService.suspendUser(user_id, user);
		return suspendedUser;
	}
	
	//@PreAuthorize("hasRole('ADMIN')")
	@PutMapping("reactivate/user/{user_id}")
	public String reactivateAUer(@PathVariable String user_id, 
			@Valid @RequestBody SuspendUserPayload suspendUserPayload) {
		User user = modelMapper.map(suspendUserPayload, User.class);
		String activatedUser = userService.reActivateUser(user_id, user);
		return activatedUser;
	}
	
	//@PreAuthorize("hasRole('READER') or hasRole('PUBLISHER') or hasRole('ADMIN')")
	@PostMapping("transactions/user/{user_id}/article/{article_id}")
	public ResponseEntity<?> payForArticleByUser(@PathVariable String user_id, @PathVariable String article_id, 
			@Valid @RequestBody TransactionPayload transactionPayload) {
		Transaction transaction = modelMapper.map(transactionPayload, Transaction.class);
		Transaction payForArticle = userService.payForArticle(user_id, article_id, transaction);
		
		String message = payForArticle.getNameOfArticle() + " payed successfully " + "with Id " + payForArticle.getId();
		
		return new ResponseEntity<>(new SuccessResponse(message, new Date(), ""), HttpStatus.CREATED);
	}
	
	//@PreAuthorize("hasRole('READER') or hasRole('PUBLISHER')")
	@GetMapping("/transactions/user/{user_id}")
	public ResponseEntity<List<TransactionDTO>> getAllTransactionsOfAUser(@PathVariable String user_id) {
		List<Transaction> allTransactionsOfAUser = userService.getAllTransactionsOfAUser(user_id);
		List<TransactionDTO> allTransactionDTOs = allTransactionsOfAUser.stream().map((
				transaction -> this.modelMapper.map(transaction, TransactionDTO.class)))
				.collect(Collectors.toList());
		return new ResponseEntity<>(allTransactionDTOs, HttpStatus.OK);
				
	}
	
	//@PreAuthorize("hasRole('ADMIN')")
	@PutMapping("addrole/users/{user_id}")
	public ResponseEntity<SuccessResponse> addRole(@PathVariable String user_id,
			  @RequestBody AddRolePayload addRolePayload) {
		ERole userRole = modelMapper.map(addRolePayload.getRole(), ERole.class);
		userService.addRole(user_id, userRole);		
		return ResponseEntity.ok(new SuccessResponse("Role added successfully", new Date(), ""));
	}
	
}
