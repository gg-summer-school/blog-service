package net.gogroups.blogservices.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.gogroups.blogservices.model.Category;
import net.gogroups.blogservices.model.Contributor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ArticleDto {

    private String id;
    private String title;
    private String articleAbstract;
    private String toc;
    private String coverPage;
    private String document;
    private BigDecimal price;
    private String  userId;
    private String categoryId;
    private List<Contributor> contributors;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

}
