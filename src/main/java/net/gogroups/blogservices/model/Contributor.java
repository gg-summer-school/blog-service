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
public class Contributor {
    @Id
    @Column(length = 50)
    private String id;
    private String name;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "article_contributor",
            joinColumns = @JoinColumn(name = "article_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "contributor_id",
                    referencedColumnName = "id"))
    private List<Article> article;


}
