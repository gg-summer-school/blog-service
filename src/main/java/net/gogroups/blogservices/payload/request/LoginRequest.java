package net.gogroups.blogservices.payload.request;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Getter;

@Getter
public class LoginRequest {

	@NotNull
	@NotBlank
    private String email;
	@NotNull
	@NotBlank
    private String password;
}
