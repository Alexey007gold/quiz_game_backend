package com.epam.epmrduaqgv.back.facade;

import com.epam.epmrduaqgv.back.dto.MatchDTO;
import com.epam.epmrduaqgv.back.dto.MatchSmallDTO;
import com.epam.epmrduaqgv.back.dto.PageDTO;
import com.epam.epmrduaqgv.back.dto.RoundDTO;

import java.util.List;

public interface MatchFacade {
    MatchDTO getMatchForUser(String userId);

    RoundDTO createRound(String userId, String matchId, String topicId);

    MatchDTO getMatchById(String matchId);

    List<MatchDTO> getMatchesByIds(List<String> matchIds);

    PageDTO<MatchDTO> getMatchesByUserId(String userId, int page, int pageSize);

    PageDTO<MatchSmallDTO> getMatchSmallDTOByUserId(String userId, int page, int pageSize);

    List<RoundDTO> getRoundsByMatchId(String matchId);

    void saveAnswer(String userId, String roundId, String questionId, String answerId);
}
