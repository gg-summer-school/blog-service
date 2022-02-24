package net.gogroups.blogservices.payload.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class TransactionPayload {

	
	@NotNull
	@DecimalMin(value = "1.0")
	private BigDecimal totalAmount;
	
	@NotNull
	private List<OrderPayload> articles;
	
 

}
