package net.gogroups.blogservices.payload.response;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

@Getter
@AllArgsConstructor
public class JwtResponse {
    private String token;
    private String type;
    private String id;
    private String email;
    private List<String> role;
}
