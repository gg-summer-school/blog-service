package net.gogroups.blogservices.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.gogroups.blogservices.repository.ArticleRepository;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Article extends  BaseEntity{

    @Id
    @Column(length = 50)
    private String id;
    private String title;
    @Column(columnDefinition = "LONGTEXT")
    private String articleAbstract;
    @Column(columnDefinition = "LONGTEXT")
    private String toc;
    private String coverPage;
    private String document;
    private BigDecimal price;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    @JsonBackReference
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    @JsonBackReference
    private Category category;


    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "article_contributors",
            joinColumns = @JoinColumn(name = "article_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "contributor_id",
                    referencedColumnName = "id"))
    @JsonIgnore
    private List<Contributor> contributors = new ArrayList<>();

    @OneToMany(mappedBy = "article", cascade = CascadeType.ALL)
    @JsonIgnore
    private List<Transaction> transaction;


//    @Transient
//    public String getArticleImagePath() {
//
//        if (coverPage == null || id == null) return null;
//        return "/uploads/coverPages/"+category.getName()+"/" + coverPage;
//    }




}
