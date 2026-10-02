package net.gogroups.blogservices.payload.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserPasswordChangePayload {

    @NotNull
    private String oldPassword;

    @NotNull
    private String newPassword;
}
