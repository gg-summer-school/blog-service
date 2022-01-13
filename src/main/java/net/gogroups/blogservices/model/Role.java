package net.gogroups.blogservices.model;

import javax.persistence.*;
import java.util.List;

@Entity
public class Role {
    @Id
    private Long id;

    @Enumerated(EnumType.STRING)
    private ERole role;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "user_role",
            joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "role_id",
                    referencedColumnName = "id"))
    private List<User> user;
}
