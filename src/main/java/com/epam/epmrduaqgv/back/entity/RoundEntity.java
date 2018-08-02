package com.epam.epmrduaqgv.back.entity;

import com.epam.epmrduaqgv.back.model.RoundState;
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
@Table(name = "rounds", schema = "qgv")
public class RoundEntity {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    @Column(name = "match_id", nullable = false)
    private String matchId;

    @Column(name = "topic_id", nullable = false)
    private String topicId;

    @Builder.Default
    @Column(name = "round_state", nullable = false)
    private RoundState roundState = RoundState.NOT_STARTED;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false)
    private Instant createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private Instant updatedAt;

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "round_id")
    List<RoundQuestionEntity> questions;
}
