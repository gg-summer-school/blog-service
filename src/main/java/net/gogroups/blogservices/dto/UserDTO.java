package net.gogroups.blogservices.dto;

import java.util.List;

import lombok.*;
import net.gogroups.blogservices.model.*;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
	
	 private String id;
	 private String name;
	 private String email;
	 private boolean active;
	 private boolean isApproved;
	 private List<Role> role;
	
}
