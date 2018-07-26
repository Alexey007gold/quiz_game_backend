package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.MatchEntity;
import com.epam.epmrduaqgv.back.entity.PlayerEntity;
import com.epam.epmrduaqgv.back.repository.MatchRepository;
import com.epam.epmrduaqgv.back.repository.PlayerRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class MatchServiceImplTest {

    @InjectMocks
    private MatchServiceImpl matchService;

    @Mock
    private MatchRepository matchRepository;

    @Mock
    private PlayerRepository playerRepository;

    @Test
    public void shouldCallRepositoriesWithCorrectArgsOnCreateMatch() {
        String id = "id";
        String userId = "some user id";
        MatchEntity matchEntity = MatchEntity.builder()
                .id(id).build();
        when(matchRepository.save(any())).thenReturn(matchEntity);

        MatchEntity result = matchService.createMatch(userId);

        ArgumentCaptor<PlayerEntity> playerEntityCaptor = ArgumentCaptor.forClass(PlayerEntity.class);
        verify(matchRepository).save(any());
        verify(playerRepository).save(playerEntityCaptor.capture());

        PlayerEntity playerEntityArgument = playerEntityCaptor.getValue();
        assertEquals(1, playerEntityArgument.getPlayerNumber());
        assertEquals(0, playerEntityArgument.getPoints());
        assertEquals(matchEntity.getId(), playerEntityArgument.getMatchId());
        assertEquals(userId, playerEntityArgument.getUserId());
        assertEquals(matchEntity, result);
    }

    @Test
    public void shouldCallRepositoryMethodOnGetMatchesByUserId() {
        String userId = "some user id";
        int page = 1;
        int pageSize = 5;
        Page pageMock = mock(Page.class);
        when(matchRepository.findByPlayerWithUserId(eq(userId), any())).thenReturn(pageMock);


        Page<MatchEntity> result = matchService.getMatchesByUserId(userId, page, pageSize);


        ArgumentCaptor<String> userIdArgCaptor = ArgumentCaptor.forClass(String.class);
        ArgumentCaptor<Pageable> pageableArgCaptor = ArgumentCaptor.forClass(Pageable.class);
        verify(matchRepository).findByPlayerWithUserId(userIdArgCaptor.capture(), pageableArgCaptor.capture());

        String userIdArgValue = userIdArgCaptor.getValue();
        Pageable pageableArgValue = pageableArgCaptor.getValue();

        assertEquals(userId, userIdArgValue);
        assertEquals(page, pageableArgValue.getPageNumber());
        assertEquals(pageSize, pageableArgValue.getPageSize());
        assertEquals(pageMock, result);
    }
}