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
@Table(name = "questions", schema = "qgv")
public class QuestionEntity {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    @Column(name = "topic_id", nullable = false)
    private String topicId;

    @Column(name = "value", nullable = false)
    private String value;
}
