package net.gogroups.blogservices.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class User {

    @Id
    private Long id;
    private String name;
    private String email;
    private String password;
    private boolean active;
    private boolean isApproved;

    @ManyToMany(cascade = CascadeType.ALL)
    private List<Role> role;

    @OneToMany
    private List<Transaction> transactions;

    @OneToMany
    private List<Article> articles;


}
