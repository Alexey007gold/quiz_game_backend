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
@Table(name = "players", schema = "qgv")
public class PlayerEntity {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    @Column(name = "user_id", nullable = false)
    private String userId;

    @Column(name = "match_id", nullable = false)
    private String matchId;

    @Column(name = "player_number", nullable = false)
    private int playerNumber;

    @Builder.Default
    @Column(name = "points", nullable = false)
    private int points = 0;
}
