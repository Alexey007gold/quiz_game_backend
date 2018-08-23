package com.epam.epmrduaqgv.back.dto;

import lombok.*;

import java.time.Instant;

@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder
@ToString
@Getter
@Setter
public class MatchSmallDTO {

    private String id;

    private Instant updatedAt;
}
