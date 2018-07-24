package com.epam.epmrduaqgv.back.service;

import com.epam.epmrduaqgv.back.entity.MatchEntity;
import org.springframework.data.domain.Page;

public interface MatchService {

    MatchEntity createMatch(String userId);

    Page<MatchEntity> getMatchesByUserId(String userId, int page, int pageSize);
}
