package net.gogroups.blogservices.payload.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class UpdateArticlePayload {

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
    private BigDecimal price;
}
