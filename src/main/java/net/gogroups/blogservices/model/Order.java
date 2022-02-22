package net.gogroups.blogservices.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name="orders")
public class Order extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private boolean status;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "order_articles",
            joinColumns = @JoinColumn(name = "orders_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "article_id",
                    referencedColumnName = "id"))
    private List<Article> articles;

    @ManyToOne(fetch = FetchType.LAZY)
    private User user;
}
