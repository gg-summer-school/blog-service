package net.gogroups.blogservices.payload.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import net.gogroups.blogservices.dto.OrderDTO;

import javax.validation.constraints.NotNull;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderPayload {

    @NotNull
    private List<OrderDTO> orders;
    @NotNull
    private  String userId;

}
