package net.gogroups.blogservices.payload.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class TransactionRequest {
	private String nameOfArticle;
    private String paymentDate;
    private String price;

}
