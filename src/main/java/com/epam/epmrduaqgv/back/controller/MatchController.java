package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.dto.MatchDTO;
import com.epam.epmrduaqgv.back.dto.PageDTO;
import com.epam.epmrduaqgv.back.dto.RoundDTO;
import com.epam.epmrduaqgv.back.entity.MatchEntity;
import com.epam.epmrduaqgv.back.service.MatchService;
import com.epam.epmrduaqgv.back.util.ControllerUtils;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.List;

@RestController
@RequestMapping(path = "/match")
public class MatchController {

    @Autowired
    private MatchService matchService;

    @Autowired
    private ObjectMapper objectMapper;

    @PostMapping(path = "/create")
    @ApiOperation(value = "Create a new match for the current user", authorizations = @Authorization(value = "oauth2"))
    public MatchDTO createMatch(@ApiIgnore OAuth2Authentication oauth) {
        String userId = ControllerUtils.getUserId(oauth);

        return objectMapper.convertValue(matchService.createMatch(userId), MatchDTO.class);
    }

    @PostMapping(path = "/createRound")
    @ApiOperation(value = "Create a new round for a match", authorizations = @Authorization(value = "oauth2"))
    public RoundDTO createRound(@RequestParam("matchId") String matchId,
                                @RequestParam("topicId") String topicId) {
        return matchService.createRound(matchId, topicId);
    }

    @GetMapping(path = "/getRounds")
    @ApiOperation(value = "Get list of rounds for a match", authorizations = @Authorization(value = "oauth2"))
    public List<RoundDTO> getRoundsByMatchId(@RequestParam("matchId") String matchId) {
        return matchService.getRoundsByMatchId(matchId);
    }

    @GetMapping("/my")
    @ApiOperation(value = "Get matches of the current user", authorizations = @Authorization(value = "oauth2"))
    public PageDTO<MatchDTO> getMyMatches(@ApiIgnore OAuth2Authentication oauth,
                                       @RequestParam(value = "page", defaultValue = "0") int page,
                                       @RequestParam(value = "pageSize", defaultValue = "30") int pageSize) {
        String userId = ControllerUtils.getUserId(oauth);

        Page<MatchEntity> matchEntityPage = matchService.getMatchesByUserId(userId, page, pageSize);
        List<MatchDTO> matchDTOs = objectMapper.convertValue(matchEntityPage.getContent(),
                new TypeReference<List<MatchDTO>>(){});

        return PageDTO.of(matchDTOs, page, pageSize,
                matchEntityPage.getNumberOfElements(), matchEntityPage.getTotalElements());
    }
}
