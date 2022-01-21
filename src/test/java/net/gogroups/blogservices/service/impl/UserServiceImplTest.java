package net.gogroups.blogservices.service.impl;

import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

import net.gogroups.blogservices.exception.ResourceAlreadyExistException;
import net.gogroups.blogservices.service.UserService;

@ExtendWith(MockitoExtension.class)
public class UserServiceImplTest {
	
	private UserService userService;
	
	@Test
	void  approvePublisher_should_fail_if_publisher_is_already_approved() {
//		ResourceAlreadyExistException resourceAlreadyExistException = assertThrows(
//				ResourceAlreadyExistException.class, () -> userService.approvePublisher(null, null))
				
	}

}
