package net.gogroups.blogservices.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

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

}
