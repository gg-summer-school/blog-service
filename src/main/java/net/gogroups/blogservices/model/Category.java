package net.gogroups.blogservices.model;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Size;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Category {
    @Id
    @Column(length = 50)
    private String id;
    
    @Size(min=3, message="Category should have atleast 3 characters")
    private String name;

    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL)
    private List<Article> articles;
}
