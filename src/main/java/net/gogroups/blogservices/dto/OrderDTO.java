package net.gogroups.blogservices.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.gogroups.blogservices.model.Article;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class OrderDTO {

    private Long id;
    private List<Article> articles = new ArrayList<>();
    private String userId;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public OrderDTO(List<Article> articles, String userId) {
        this.articles = articles;
        this.userId = userId;
    }

}
