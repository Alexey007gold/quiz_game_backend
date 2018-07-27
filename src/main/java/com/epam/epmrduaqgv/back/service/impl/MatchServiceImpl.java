package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.dto.AnswerDTO;
import com.epam.epmrduaqgv.back.dto.QuestionDTO;
import com.epam.epmrduaqgv.back.dto.RoundDTO;
import com.epam.epmrduaqgv.back.entity.*;
import com.epam.epmrduaqgv.back.repository.MatchRepository;
import com.epam.epmrduaqgv.back.repository.PlayerRepository;
import com.epam.epmrduaqgv.back.repository.RoundQuestionRepository;
import com.epam.epmrduaqgv.back.repository.RoundRepository;
import com.epam.epmrduaqgv.back.service.MatchService;
import com.epam.epmrduaqgv.back.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MatchServiceImpl implements MatchService {

    @Autowired
    private MatchRepository matchRepository;

    @Autowired
    private RoundRepository roundRepository;

    @Autowired
    private PlayerRepository playerRepository;

    @Autowired
    private QuestionService inMemoryQuestionServiceImpl;

    @Autowired
    private RoundQuestionRepository roundQuestionRepository;

    @Value("${questions_in_round}")
    private Integer questionInRound;

    @Transactional
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

    @Transactional
    @Override
    public RoundDTO createRound(String matchId, String topicId) {
        RoundEntity roundEntity = RoundEntity.builder()
                .matchId(matchId)
                .topicId(topicId)
                .build();
        roundRepository.save(roundEntity);

        List<QuestionEntity> questions = inMemoryQuestionServiceImpl.findRandomQuestionsByTopicId(topicId, questionInRound);
        List<RoundQuestionEntity> roundQuestionEntityList = questions.stream()
                .map(questionEntity -> RoundQuestionEntity.builder()
                        .roundId(roundEntity.getId())
                        .question(questionEntity)
                        .build())
                .collect(Collectors.toList());
        roundQuestionRepository.saveAll(roundQuestionEntityList);

        return createRoundDTO(roundEntity, questions);
    }

    @Override
    public Page<MatchEntity> getMatchesByUserId(String userId, int page, int pageSize) {
        PageRequest pageRequest = PageRequest.of(page, pageSize, Sort.Direction.DESC, "updatedAt");
        return matchRepository.findByPlayerWithUserId(userId, pageRequest);
    }

    @Override
    public List<RoundDTO> getRoundsByMatchId(String matchId) {
        Sort sort = new Sort(Sort.Direction.ASC, "createdAt");
        List<RoundEntity> roundEntityList = roundRepository.findByMatchId(matchId, sort);
        return createRoundDTOS(roundEntityList);
    }



    /*Mapping methods*/

    private List<RoundDTO> createRoundDTOS(List<RoundEntity> roundEntityList) {
        return roundEntityList.stream()
                .map(roundEntity -> {
                    List<QuestionDTO> questionDTOList = createQuestionDTOS(roundEntity);
                    return RoundDTO.builder()
                            .roundId(roundEntity.getId())
                            .questions(questionDTOList)
                            .build();
                }).collect(Collectors.toList());
    }

    private List<QuestionDTO> createQuestionDTOS(RoundEntity roundEntity) {
        return roundEntity.getQuestions().stream()
                .map(rq -> QuestionDTO.builder()
                        .id(rq.getQuestion().getId())
                        .topicId(roundEntity.getTopicId())
                        .value(rq.getQuestion().getId())
                        .answers(createAnswerDTOS(rq.getQuestion()))
                        .build())
                .collect(Collectors.toList());
    }

    private RoundDTO createRoundDTO(RoundEntity roundEntity, List<QuestionEntity> questionEntities) {
        List<QuestionDTO> questionDTOList = createQuestionDTOS(questionEntities);
        return RoundDTO.builder()
                .roundId(roundEntity.getId())
                .questions(questionDTOList)
                .build();
    }

    private List<QuestionDTO> createQuestionDTOS(List<QuestionEntity> questionEntities) {
        return questionEntities.stream()
                .map(q -> QuestionDTO.builder()
                        .id(q.getId())
                        .topicId(q.getTopicEntity().getId())
                        .value(q.getValue())
                        .answers(createAnswerDTOS(q))
                        .build())
                .collect(Collectors.toList());
    }

    private List<AnswerDTO> createAnswerDTOS(QuestionEntity questionEntity) {
        return questionEntity.getAnswers().stream()
                .map(a -> AnswerDTO.builder()
                        .id(a.getId())
                        .questionId(a.getQuestionId())
                        .value(a.getValue())
                        .correct(a.isCorrect())
                        .build())
                .collect(Collectors.toList());
    }
}
