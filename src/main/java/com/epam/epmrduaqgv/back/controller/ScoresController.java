package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.dto.PageDTO;
import com.epam.epmrduaqgv.back.dto.UserDTO;
import com.epam.epmrduaqgv.back.exception.BadRequestException;
import com.epam.epmrduaqgv.back.service.UserService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ScoresController {

    @Autowired
    private UserService userService;

    @GetMapping("/scores")
    @ApiOperation(value = "Get scores data either by topic or total", authorizations = @Authorization(value = "oauth2"))
    public PageDTO<UserDTO> getHighScores(@RequestParam(value = "topicId", required = false) String topicId,
                                          @RequestParam(value = "topicName", required = false) String topicName,
                                          @RequestParam(value = "page", defaultValue = "0") int page,
                                          @RequestParam(value = "pageSize", defaultValue = "30") int pageSize,
                                          @RequestParam(value = "order", defaultValue = "DESC") Sort.Direction order) {
        if (topicId != null && topicName != null) {
            throw new BadRequestException("topicId and topicName should not be set at the same time");
        }

        Page<UserDTO> topScores;
        if (topicId != null) {
            topScores = userService.findScoresByTopicId(topicId, page, pageSize, order);
        } else if (topicName != null) {
            topScores = userService.findScoresByTopicName(topicName, page, pageSize, order);
        } else {
            topScores = userService.findTotalScores(page, pageSize, order);
        }
        return PageDTO.of(topScores);
    }
}
