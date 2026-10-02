package net.gogroups.blogservices.model;


import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Data;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Role {
    @Id
    @Column(length = 50)
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    private ERole role;

    @JsonIgnore
    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "role")
    private List<User> user;

}
