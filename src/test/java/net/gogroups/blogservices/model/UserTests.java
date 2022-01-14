package net.gogroups.blogservices.model;

import net.gogroups.blogservices.dto.UserDTO;
import org.junit.jupiter.api.Test;
import org.modelmapper.ModelMapper;

import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class UserTests {
    public static final ModelMapper modelMapper = new ModelMapper();

    @Test
    void verifyUserMapping(){
        UserDTO userdto = new UserDTO();
        String id = UUID.randomUUID().toString();

        userdto.setName("Jane");
        userdto.setEmail("jane@gmail.com");
        userdto.setId(id);

        User user = modelMapper.map(userdto, User.class);

        assertEquals(userdto.getName(),user.getName());
        assertEquals(userdto.getEmail(), user.getEmail());
        assertEquals(userdto.getId(),user.getId());

    }
}
