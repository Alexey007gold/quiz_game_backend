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
@Table(name = "players_answers", schema = "qgv")
public class PlayersAnswersEntity {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    @Column(name = "player_id", nullable = false)
    private String playerId;

    @Column(name = "round_id", nullable = false)
    private String roundId;

    @Column(name = "question_id", nullable = false)
    private String questionId;

    @Column(name = "answer_id", nullable = false)
    private String answerId;
}
