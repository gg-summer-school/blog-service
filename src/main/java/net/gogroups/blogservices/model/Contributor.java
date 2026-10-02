package net.gogroups.blogservices.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Contributor {
    @Id
    @Column(length = 50)
    private String id;
    private String name;

    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "contributors")
    @JsonIgnore
    private List<Article> articles = new ArrayList<>();




}
