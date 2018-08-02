package com.epam.epmrduaqgv.back.entity;

import lombok.*;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.time.Instant;

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

    @Column(name = "last_activity_at")
    private Instant lastActivityAt;
}
