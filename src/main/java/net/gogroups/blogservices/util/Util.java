package net.gogroups.blogservices.util;

import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class Util {

    
    public String generateId(){
        UUID uuid = UUID.randomUUID();
        return uuid.toString();
    }




}
