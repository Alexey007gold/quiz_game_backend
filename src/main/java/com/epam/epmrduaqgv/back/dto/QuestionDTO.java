package com.epam.epmrduaqgv.back.dto;

import lombok.*;

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
}
