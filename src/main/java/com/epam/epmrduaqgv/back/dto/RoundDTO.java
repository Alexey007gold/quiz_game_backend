package com.epam.epmrduaqgv.back.dto;

import com.epam.epmrduaqgv.back.model.RoundState;
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
public class RoundDTO {

    private String id;

    private String matchId;

    private String topicId;

    private RoundState roundState;

    private Instant createdAt;

    private Instant updatedAt;

    private List<QuestionDTO> questions;
}
