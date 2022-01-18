package net.gogroups.blogservices.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ArticlePayload {

    @NotNull
    @NotBlank
    private String title;

    @NotNull
    @NotBlank
    private String articleAbstract;

    @NotNull
    @NotBlank
    private String toc;

    @NotNull
    @DecimalMin(value = "1.0")
    private BigDecimal price;

    private List<ContributorPayload> contributors;



}
