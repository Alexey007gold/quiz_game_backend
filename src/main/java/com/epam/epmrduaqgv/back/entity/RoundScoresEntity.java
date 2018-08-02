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
@Table(name = "round_scores", schema = "qgv")
public class RoundScoresEntity {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    @Column(name = "round_id", nullable = false)
    private String roundId;

    @Column(name = "player_id", nullable = false)
    private String playerId;

    @Column(name = "score", nullable = false)
    private Integer score;
}
