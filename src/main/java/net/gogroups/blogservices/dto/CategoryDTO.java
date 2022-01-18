package net.gogroups.blogservices.dto;

import javax.validation.constraints.Size;

import lombok.*;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryDTO {
	
	private String id;
	
	@Size(min=3, message="Category should have atleast 3 characters")
	private String name;

}
