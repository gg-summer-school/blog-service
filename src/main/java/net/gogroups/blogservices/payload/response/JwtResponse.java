package net.gogroups.blogservices.payload.response;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.List;

@Data
@RequiredArgsConstructor
public class JwtResponse {

    private final String accessToken;
    private String type = "Bearer";
    private final String refreshToken;
    private final String id;
    private final String name;
    private final String email;
    private final boolean isApproved;
    private final List<String> role;
    
}
