package net.gogroups.blogservices.payload.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserPayload {

    @NotNull
    private String name;
    @NotNull
    private String email;
    @NotNull
    private String password;

}
