package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.PropertyLoader;
import com.epam.epmrduaqgv.back.entity.*;
import com.epam.epmrduaqgv.back.repository.MatchRepository;
import com.epam.epmrduaqgv.back.repository.PlayerRepository;
import com.epam.epmrduaqgv.back.repository.RoundQuestionRepository;
import com.epam.epmrduaqgv.back.repository.RoundRepository;
import com.epam.epmrduaqgv.back.service.QuestionService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.mockito.stubbing.Answer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.test.util.ReflectionTestUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

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
    private RoundRepository roundRepository;

    @Mock
    private PlayerRepository playerRepository;

    @Mock
    private QuestionService questionService;

    @Mock
    private RoundQuestionRepository roundQuestionRepository;

    private Integer questionInRound;


    @Before
    public void setUp() throws IOException {
        questionInRound = Integer.parseInt(PropertyLoader.loadApplicationProperties().getProperty("questions_in_round"));
        ReflectionTestUtils.setField(matchService, "questionInRound", questionInRound);
    }

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

    @Test
    public void shouldCallRepositoryMethodOnCreateRound() {
        String matchId = "some match id";
        String topicId = "some topic id";
        String round_id = "round id";
        when(roundRepository.save(any())).then((Answer<RoundEntity>) invocationOnMock -> {
            RoundEntity argument = (RoundEntity) invocationOnMock.getArguments()[0];
            argument.setId(round_id);
            return argument;
        });
        List<QuestionEntity> questionEntityList = getQuestionEntityList(questionInRound);
        when(questionService.findRandomQuestionsByTopicId(topicId, questionInRound)).thenReturn(questionEntityList);

        matchService.createRound(matchId, topicId);

        ArgumentCaptor<RoundEntity> roundEntityArgumentCaptor = ArgumentCaptor.forClass(RoundEntity.class);
        ArgumentCaptor<List> roundQuestionListArgumentCaptor = ArgumentCaptor.forClass(List.class);
        verify(roundRepository).save(roundEntityArgumentCaptor.capture());
        verify(questionService).findRandomQuestionsByTopicId(topicId, questionInRound);
        verify(roundQuestionRepository).saveAll(roundQuestionListArgumentCaptor.capture());

        RoundEntity roundEntityArgument = roundEntityArgumentCaptor.getValue();
        List<RoundQuestionEntity> roundQuestionListArgument = roundQuestionListArgumentCaptor.getValue();

        assertEquals(matchId, roundEntityArgument.getMatchId());
        assertEquals(topicId, roundEntityArgument.getTopicId());

        for (int i = 0; i < roundQuestionListArgument.size(); i++) {
            assertEquals(round_id, roundQuestionListArgument.get(i).getRoundId());
            assertEquals(questionEntityList.get(i), roundQuestionListArgument.get(i).getQuestion());
        }
    }

    @Test
    public void shouldCallRepositoryMethodOnGetRoundsByMatchId() {
        String matchId = "some match id";
        matchService.getRoundsByMatchId(matchId);

        verify(roundRepository).findByMatchId(matchId, new Sort(Sort.Direction.ASC, "createdAt"));
    }

    private List<QuestionEntity> getQuestionEntityList(int quantity) {
        List<QuestionEntity> result = new ArrayList<>();
        for (int i = 0; i < quantity; i++) {
            result.add(QuestionEntity.builder()
                    .topicEntity(TopicEntity.builder()
                            .id("")
                            .build())
                    .answers(Collections.emptyList())
                    .build());
        }
        return result;
    }
}