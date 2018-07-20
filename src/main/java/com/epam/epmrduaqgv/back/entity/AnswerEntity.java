package com.epam.epmrduaqgv.back.entity;

import lombok.*;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder
@ToString
@Getter
@Setter
@Entity
@Table(name = "answers", schema = "qgv")
public class AnswerEntity {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    @Column(name = "question_id", nullable = false)
    private String questionId;

    @Column(name = "value", nullable = false)
    private String value;

    @Column(name = "correct", nullable = false)
    private boolean correct;
}
