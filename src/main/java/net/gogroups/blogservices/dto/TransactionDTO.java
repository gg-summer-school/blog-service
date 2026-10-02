package net.gogroups.blogservices.dto;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.gogroups.blogservices.model.Contributor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class TransactionDTO {

	private String id;
    private String nameOfArticle;
    private LocalDateTime createdAt;

}
