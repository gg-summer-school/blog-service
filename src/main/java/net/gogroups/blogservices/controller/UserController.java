package net.gogroups.blogservices.controller;

import net.gogroups.blogservices.security.jwt.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
//@Api(tags = "User")
@CrossOrigin(origins = "http://localhost:4200")
public class UserController {
//    @Autowired
//    UserSerivce userService;

    @Autowired
    JwtUtils jwtUtils;

//    @ApiOperation(value = "This method is used to get user details.", authorizations = {
//            @Authorization(value = "jwtToken") })
//    @GetMapping("/user-profile")
//    @ResponseBody
//    public ResponseEntity<?> retrieveUserDetails(Authentication authentication) {
//        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//        return new ResponseEntity<>(userService.loadUserDetails(userDetails.getUsername()), HttpStatus.OK);
//    }
//
//    @ApiOperation(value = "This method is used to get all the users.", authorizations = {
//            @Authorization(value = "jwtToken") })
//    @GetMapping("/users")
//    public ResponseEntity<?> retrieveAllUses(Authentication authentication) {
//        if (authentication.getAuthorities().toString().equals("[ROLE_ADMIN]")) {
//            return new ResponseEntity<>(userService.getAllUsers(), HttpStatus.OK);
//        } else
//            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
//    }

//    @ApiOperation(value = "This method is used to get edit user details.", authorizations = {
//            @Authorization(value = "jwtToken") })
//    @PutMapping("/users/user-profile")
//    @ResponseBody
//    public ResponseEntity<User> editUserInfo(Authentication authentication, @Valid @RequestBody User editUser) {
//        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//        User user = userService.loadUserDetails(userDetails.getUsername()).get();
//
//        if (!(user == null)) {
//            user.setName(editUser.getName());
//            user.setUsername(editUser.getUsername());
//            user.setEmail(editUser.getEmail());
//
//            return new ResponseEntity<>(userService.saveUser(user), HttpStatus.NO_CONTENT);
//
//        } else {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//    }
//
//    @ApiOperation(value = "This method is used to delete a user.", authorizations = {
//            @Authorization(value = "jwtToken") })
//    @DeleteMapping("/users/{userId}")
//    @ResponseBody
//    public ResponseEntity<HttpStatus> deleteUserById(Authentication authentication, @PathVariable long userId) {
//        if (authentication.getAuthorities().toString().equals("[ROLE_ADMIN]")) {
//            userService.deleteUser(userId);
//            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
//        } else
//            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
//    }

}
