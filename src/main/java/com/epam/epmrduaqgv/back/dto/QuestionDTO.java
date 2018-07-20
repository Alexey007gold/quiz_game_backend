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
public class QuestionDTO {

    private String id;
    private String topicId;
    private String value;
    private List<AnswerDTO> answers;
}
