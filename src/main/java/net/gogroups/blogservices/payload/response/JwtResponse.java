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
    private final List<String> role;
    private boolean isApproved;
	public JwtResponse(String accessToken,String refreshToken, String id, String name, String email,
			List<String> role, boolean isApproved) {
		super();
		this.accessToken = accessToken;
		this.refreshToken = refreshToken;
		this.id = id;
		this.name = name;
		this.email = email;
		this.role = role;
		this.isApproved = isApproved;
	}
    
    
    
}
