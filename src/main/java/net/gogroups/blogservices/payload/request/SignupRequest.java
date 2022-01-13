package net.gogroups.blogservices.payload.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import net.gogroups.blogservices.model.Role;

import java.util.List;

@Getter
@AllArgsConstructor
public class SignupRequest {

    private String email;
    private String name;
    private String role;
    private String password;

    public SignupRequest(String email, String name, String password) {
        this.email = email;
        this.name = name;
        this.password = password;
    }
}
