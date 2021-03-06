package com.epam.epmrduaqgv.back.service;

import com.epam.epmrduaqgv.back.dto.MatchDTO;
import com.epam.epmrduaqgv.back.dto.RoundDTO;
import com.epam.epmrduaqgv.back.entity.MatchEntity;
import org.springframework.data.domain.Page;

import java.util.List;

public interface MatchService {

    MatchDTO getMatchForUser(String userId);

    RoundDTO createRound(String userId, String matchId, String topicId);

    MatchEntity getMatchById(String matchId);

    List<MatchEntity> getMatchesByIds(List<String> matchIds);

    Page<MatchEntity> getMatchesByUserId(String userId, int page, int pageSize);

    List<RoundDTO> getRoundsByMatchId(String matchId);

    boolean shouldUserStartRound(String userId, MatchEntity matchEntity);

    void finishAllInactiveMatches();

    void finishInactiveMatchesForUser(String userId);
}
