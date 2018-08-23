package com.epam.epmrduaqgv.back.facade.impl;

import com.epam.epmrduaqgv.back.aspect.annotation.Retryable;
import com.epam.epmrduaqgv.back.dto.MatchDTO;
import com.epam.epmrduaqgv.back.dto.MatchSmallDTO;
import com.epam.epmrduaqgv.back.dto.PageDTO;
import com.epam.epmrduaqgv.back.dto.RoundDTO;
import com.epam.epmrduaqgv.back.entity.MatchEntity;
import com.epam.epmrduaqgv.back.facade.MatchFacade;
import com.epam.epmrduaqgv.back.model.MatchState;
import com.epam.epmrduaqgv.back.service.AnswerService;
import com.epam.epmrduaqgv.back.service.MatchService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

import static java.util.stream.Collectors.*;

@Service
public class MatchFacadeImpl implements MatchFacade {

    @Autowired
    private MatchService matchService;

    @Autowired
    private AnswerService answerService;

    @Autowired
    private ObjectMapper objectMapper;

    @Retryable(retryForExceptions = DataIntegrityViolationException.class, maxRetries = 4)
    @Transactional
    @Override
    public MatchDTO getMatchForUser(String userId) {
        matchService.finishInactiveMatchesForUser(userId);
        return matchService.getMatchForUser(userId);
    }

    @Override
    public RoundDTO createRound(String userId, String matchId, String topicId) {
        return matchService.createRound(userId, matchId, topicId);
    }

    @Override
    public MatchDTO getMatchById(String matchId) {
        return objectMapper.convertValue(matchService.getMatchById(matchId), MatchDTO.class);
    }

    @Override
    public List<MatchDTO> getMatchesByIds(List<String> matchIds) {
        return objectMapper.convertValue(matchService.getMatchesByIds(matchIds), new TypeReference<List<MatchDTO>>() {});
    }

    @Transactional
    @Override
    public PageDTO<MatchDTO> getMatchesByUserId(String userId, int page, int pageSize) {
        matchService.finishInactiveMatchesForUser(userId);

        Page<MatchEntity> matchEntityPage = matchService.getMatchesByUserId(userId, page, pageSize);
        List<MatchDTO> matchDTOs = objectMapper.convertValue(matchEntityPage.getContent(),
                new TypeReference<List<MatchDTO>>(){});
        for (int i = 0; i < matchDTOs.size(); i++) {
            boolean shouldStartRound = matchService.shouldUserStartRound(userId, matchEntityPage.getContent().get(i));
            matchDTOs.get(i).setShouldStartRound(shouldStartRound);
        }

        return PageDTO.of(matchDTOs, page, pageSize,
                matchEntityPage.getNumberOfElements(), matchEntityPage.getTotalElements());
    }

    @Transactional
    @Override
    public Map<MatchState, List<MatchSmallDTO>> getMatchSmallDTOMap(String userId, int page, int pageSize) {
        matchService.finishInactiveMatchesForUser(userId);

        Page<MatchEntity> matchEntityPage = matchService.getMatchesByUserId(userId, page, pageSize);

        return matchEntityPage.getContent().stream()
                .collect(groupingBy(MatchEntity::getMatchState,
                        mapping(m -> MatchSmallDTO.builder()
                                .id(m.getId())
                                .updatedAt(m.getUpdatedAt())
                                .build(),
                                toList())));
    }

    @Override
    public List<RoundDTO> getRoundsByMatchId(String matchId) {
        return matchService.getRoundsByMatchId(matchId);
    }

    @Transactional
    @Override
    public void saveAnswer(String userId, String roundId, String questionId, String answerId) {
        matchService.finishInactiveMatchesForUser(userId);
        answerService.saveAnswer(userId, roundId, questionId, answerId);
    }
}
