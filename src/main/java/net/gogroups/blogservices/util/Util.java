package net.gogroups.blogservices.util;

import net.gogroups.blogservices.exception.UnAuthorizedException;
import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.Optional;
import java.util.UUID;

@Component
public class Util {

    @Autowired
    UserRepository userRepository;

    
    public String generateId(){
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }




}
