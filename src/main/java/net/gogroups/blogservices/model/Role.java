package net.gogroups.blogservices.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;


@NoArgsConstructor
@Getter
@Setter
@Entity
public class Role {
    @Id
    @Column(length = 50)
    private String id;

    @Enumerated(EnumType.STRING)
    private ERole role;

    @ManyToMany(mappedBy = "role")
    private List<User> user;

    public Role(String id, ERole role){
        this.id = id;
        this.role = role;
    }
}
