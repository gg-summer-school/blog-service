package net.gogroups.blogservices.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Article {

    @Id
    private Long id;
    private String title;
    private String articleAbstract;
    private String toc;
    private String coverPage;
    private String document;
    private BigDecimal price;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @ManyToMany
    private List<Contributor> contributor;

    @OneToMany
    private List<Transaction> transaction;


}
