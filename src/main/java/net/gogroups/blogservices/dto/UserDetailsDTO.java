package net.gogroups.blogservices.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.Role;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserDetailsDTO {

    private String id;
    private String name;
    private String email;
    private List<Article> articles;
    private List<Role> role;

}
