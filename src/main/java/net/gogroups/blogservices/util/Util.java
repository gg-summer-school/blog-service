package net.gogroups.blogservices.util;

import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.repository.ArticleRepository;
import net.gogroups.blogservices.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.UUID;

public class Util {

    @Autowired
    UserRepository userRepository;
    @Autowired
    ArticleRepository articleRepository;

    public String generateId(){
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }

    // to be full implemented when authentication has been implemented
    public User getUserByToken(){
        User user = new User();
        return user;
    }


}
