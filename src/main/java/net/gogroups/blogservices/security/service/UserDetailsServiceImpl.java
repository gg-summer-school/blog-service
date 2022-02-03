package net.gogroups.blogservices.security.service;

import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    UserRepository repo;

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String email) {
        User user = repo.findByEmail(email).orElseThrow(() -> new UsernameNotFoundException("User Not Found with email: " + email));
        return  UserDetailsImpl.build(user);
    }

}