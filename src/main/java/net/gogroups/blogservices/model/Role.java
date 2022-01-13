package net.gogroups.blogservices.model;

import javax.persistence.*;
import java.util.List;

@Entity
public class Role {
    @Id
    @Column(length = 50)
    private String id;

    @Enumerated(EnumType.STRING)
    private ERole role;

    @ManyToMany(mappedBy = "role")
    private List<User> user;
}
