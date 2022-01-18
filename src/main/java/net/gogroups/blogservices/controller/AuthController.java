package net.gogroups.blogservices.controller;

import io.swagger.annotations.ApiOperation;
import net.gogroups.blogservices.exception.TokenRefreshException;
import net.gogroups.blogservices.model.ERole;
import net.gogroups.blogservices.model.RefreshToken;
import net.gogroups.blogservices.model.Role;
import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.payload.request.LoginRequest;
import net.gogroups.blogservices.payload.request.SignupRequest;
import net.gogroups.blogservices.payload.request.TokenRefreshRequest;
import net.gogroups.blogservices.payload.response.JwtResponse;
import net.gogroups.blogservices.payload.response.MessageResponse;
import net.gogroups.blogservices.payload.response.TokenRefreshResponse;
import net.gogroups.blogservices.repository.RoleRepository;
import net.gogroups.blogservices.repository.UserRepository;
import net.gogroups.blogservices.security.service.RefreshTokenService;
import net.gogroups.blogservices.security.service.UserDetailsImpl;
import net.gogroups.blogservices.security.jwt.JwtUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.security.auth.login.AccountNotFoundException;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

//@CrossOrigin(origins = "4200")
@RestController
@RequestMapping("/api/public/auth")
public class AuthController {

    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    PasswordEncoder encoder;

    @Autowired
    JwtUtils jwtUtils;

    @Autowired
    RefreshTokenService refreshTokenService;

    @PostMapping("/signin")
    public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginRequest loginRequest)
            throws AccountNotFoundException {

        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getEmail(), loginRequest.getPassword()));

        SecurityContextHolder.getContext().setAuthentication(authentication);

        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

        String jwt = jwtUtils.generateJwtToken(userDetails);

        List<String> roles = userDetails.getAuthorities().stream().map(item -> item.getAuthority())
                .collect(Collectors.toList());

        RefreshToken refreshToken = refreshTokenService.createRefreshToken(userDetails.getUserId());

        return ResponseEntity.ok(new JwtResponse(jwt, refreshToken.getToken(), userDetails.getUserId(),
                userDetails.getName(),  userDetails.getEmail(), roles));
    }

    @ApiOperation(value = "For the refresh token")
    @PostMapping("/refreshtoken")
    public ResponseEntity<?> refreshtoken(@Valid @RequestBody TokenRefreshRequest request) {
        String requestRefreshToken = request.getRefreshToken();

        return refreshTokenService.findByToken(requestRefreshToken).map(refreshTokenService::verifyExpiration)
                .map(RefreshToken::getUser).map(user -> {
                    String token = jwtUtils.generateTokenFromEmail(user.getEmail());
                    return ResponseEntity.ok(new TokenRefreshResponse(token, requestRefreshToken));
                })
                .orElseThrow(() -> new TokenRefreshException(requestRefreshToken, "Refresh token is not in database!"));
    }

    @PostMapping("/signup")
    public ResponseEntity<?> registerUser(@Valid @RequestBody SignupRequest signUpRequest) {

        if (userRepository.existsByEmail(signUpRequest.getEmail())) {
            return ResponseEntity
                    .badRequest()
                    .body(new MessageResponse("Error: Email is already in use!"));
        }

        // Create new user's account
        String strRoles = signUpRequest.getRole();
        List<Role> roles = new ArrayList<>();

        User user = new User(UUID.randomUUID().toString(),
                signUpRequest.getEmail(),
                signUpRequest.getName(),
                encoder.encode(signUpRequest.getPassword()),
                true,
                false);

        if(strRoles.equals("PUBLISHER")) {
            Role userRole = roleRepository.findByRole(ERole.PUBLISHER);
            roles.add(userRole);
        } else {
            Role userRole = roleRepository.findByRole(ERole.READER);
            roles.add(userRole);
        }

        user.setRole(roles);

        userRepository.save(user);

        return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
    }
}