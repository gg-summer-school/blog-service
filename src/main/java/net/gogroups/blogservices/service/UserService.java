package net.gogroups.blogservices.service;

import java.util.List;
import java.util.Optional;

import net.gogroups.blogservices.model.User;

public interface UserService {

    public User saveUser(User user);

    public Optional<User> loadUserDetails(String email);

    public Optional<User> getUserById(String id);

    public List<User> getAllUsers();

}
