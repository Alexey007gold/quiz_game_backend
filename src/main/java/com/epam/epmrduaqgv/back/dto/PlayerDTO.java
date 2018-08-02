package com.epam.epmrduaqgv.back.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder
@ToString
@Getter
@Setter
public class PlayerDTO {

    private String id;

    private String userId;

    private String matchId;

    private int playerNumber;
}
