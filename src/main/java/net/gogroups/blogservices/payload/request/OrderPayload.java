package net.gogroups.blogservices.payload.request;

import java.math.BigDecimal;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OrderPayload {
	
	@NotNull
	private String articleIds;
	
	@NotNull
	private String nameOfArticle;

}
