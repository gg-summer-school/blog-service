package net.gogroups.blogservices.payload.request;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SignupRequest {

	@Email
	@NotBlank
	@NotNull
    private String email;
	@NotBlank
	@NotNull
    private String name;
	@NotBlank
	@NotNull
	
    private String role;
	@NotBlank
	@NotNull
	@Size(min = 8)
    private String password;
	
    @Size(min=3, message="Reason should have atleast 3 characters")
    private String reason;


}
