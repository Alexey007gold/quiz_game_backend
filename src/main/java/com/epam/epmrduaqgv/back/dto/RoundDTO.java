package com.epam.epmrduaqgv.back.dto;

import lombok.*;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder
@ToString
@Getter
@Setter
public class RoundDTO {

    private String roundId;

    private List<QuestionDTO> questions;
}
