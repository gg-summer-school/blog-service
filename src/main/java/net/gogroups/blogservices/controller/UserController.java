package net.gogroups.blogservices.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import net.gogroups.blogservices.dto.UserDTO;
import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.payload.response.MessageResponse;
import net.gogroups.blogservices.security.jwt.JwtUtils;
import net.gogroups.blogservices.service.UserService;
import org.modelmapper.ModelMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/protected/users/")
@Api(tags = "User")
@CrossOrigin(origins = "http://localhost:4200")
public class UserController {
    @Autowired
    UserService userService;

    @ApiOperation(value = "This method is used to get user details.", authorizations = {
            @Authorization(value = "jwtToken") })
    @GetMapping("/user_profile")
    @ResponseBody
    public ResponseEntity<?> retrieveUserDetails(Authentication authentication) {
//        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        //userDetails.getUsername())
        return new ResponseEntity<>(userService.loadUserDetails("lucy22"), HttpStatus.OK);
    }


    @ApiOperation(value = "This method is used to get edit user details.", authorizations = {
            @Authorization(value = "jwtToken") })
    @PutMapping("/user_profile")
    @ResponseBody
    public ResponseEntity<User> editUserInfo(Authentication authentication, @Valid @RequestBody User editUser) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User user = userService.loadUserDetails(userDetails.getUsername()).get();

        if (!(user == null)) {
            user.setName(editUser.getName());
            user.setEmail(editUser.getEmail());
            user.setUsername(editUser.getEmail());

            return new ResponseEntity<>(userService.saveUser(user), HttpStatus.NO_CONTENT);

        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}