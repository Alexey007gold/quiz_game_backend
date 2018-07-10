package com.epam.epmrduaqgv.back.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder
@ToString
@Getter
@Setter
public class UserDTO {

    private String email;

    private String nickName;

    private Long score;
}
