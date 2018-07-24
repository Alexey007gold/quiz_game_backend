package com.epam.epmrduaqgv.back.dto;

import com.epam.epmrduaqgv.back.model.MatchState;
import lombok.*;

import java.time.Instant;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder
@ToString
@Getter
@Setter
public class MatchDTO {

    private String id;

    private MatchState matchState;

    private Instant createdAt;

    private Instant updatedAt;

    private List<PlayerDTO> players;
}
