package net.gogroups.blogservices.model;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.Data;

import javax.persistence.*;
import java.util.List;


@NoArgsConstructor
@Getter
@Setter
@Entity
@Data
public class Role {
    @Id
    @Column(length = 50)
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    private ERole role;

    @ManyToMany(mappedBy = "role")
    private List<User> user;

    public Role(Long id, ERole role){
        this.id = id;
        this.role = role;
    }
}
