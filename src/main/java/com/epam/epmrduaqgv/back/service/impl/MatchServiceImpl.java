package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.MatchEntity;
import com.epam.epmrduaqgv.back.entity.PlayerEntity;
import com.epam.epmrduaqgv.back.repository.MatchRepository;
import com.epam.epmrduaqgv.back.repository.PlayerRepository;
import com.epam.epmrduaqgv.back.service.MatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
public class MatchServiceImpl implements MatchService {

    @Autowired
    private MatchRepository matchRepository;

    @Autowired
    private PlayerRepository playerRepository;

    @Override
    public MatchEntity createMatch(String userId) {
        MatchEntity matchEntity = MatchEntity.builder()
                .build();
        matchEntity = matchRepository.save(matchEntity);

        PlayerEntity playerEntity = PlayerEntity.builder()
                .userId(userId)
                .matchId(matchEntity.getId())
                .playerNumber(1)
                .build();
        playerRepository.save(playerEntity);

        matchEntity.setPlayers(Collections.singletonList(playerEntity));
        return matchEntity;
    }

    @Override
    public Page<MatchEntity> getMatchesByUserId(String userId, int page, int pageSize) {
        PageRequest pageRequest = PageRequest.of(page, pageSize, Sort.Direction.DESC, "updatedAt");
        return matchRepository.findByPlayerWithUserId(userId, pageRequest);
    }
}
