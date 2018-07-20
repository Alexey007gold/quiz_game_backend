package com.epam.epmrduaqgv.back.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder
@ToString
@Getter
@Setter
public class AnswerDTO {

    private String id;
    private String questionId;
    private String value;
    private boolean correct;
}
