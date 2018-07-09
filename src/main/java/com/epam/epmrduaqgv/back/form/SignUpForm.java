package com.epam.epmrduaqgv.back.form;

import com.epam.epmrduaqgv.back.validation.constraint.AvailableEmail;
import com.epam.epmrduaqgv.back.validation.constraint.AvailableNickName;
import com.epam.epmrduaqgv.back.validation.constraint.ValidNickName;
import com.epam.epmrduaqgv.back.validation.constraint.ValidPassword;
import lombok.*;

import javax.validation.constraints.Email;

@Getter
@Setter
@EqualsAndHashCode
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SignUpForm {

    @Email
    @AvailableEmail
    private String email;

    @ValidPassword
    private String password;

    @ValidNickName
    @AvailableNickName
    private String nickName;
}
