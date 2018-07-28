package com.epam.epmrduaqgv.back.entity;

import com.epam.epmrduaqgv.back.model.MatchState;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.time.Instant;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder
@ToString
@Getter
@Setter
@Entity
@Table(name = "matches", schema = "qgv")
public class MatchEntity {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    @Builder.Default
    @Column(name = "match_state", nullable = false)
    private MatchState matchState = MatchState.WAITING_FOR_OPPONENT;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false)
    private Instant createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private Instant updatedAt;

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "match_id")
    @OrderBy("playerNumber ASC")
    private List<PlayerEntity> players;

    @OneToMany
    @JoinColumn(name = "match_id")
    @OrderBy("createdAt ASC")
    private List<RoundEntity> rounds;
}
