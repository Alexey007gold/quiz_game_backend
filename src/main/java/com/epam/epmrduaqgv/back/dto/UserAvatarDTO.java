package com.epam.epmrduaqgv.back.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder
@ToString
@Getter
@Setter
public class UserAvatarDTO {

    private String userId;

    private byte[] value;
}
