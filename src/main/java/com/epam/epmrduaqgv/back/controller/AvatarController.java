package com.epam.epmrduaqgv.back.controller;

import com.epam.epmrduaqgv.back.dto.UserAvatarDTO;
import com.epam.epmrduaqgv.back.entity.UserAvatarEntity;
import com.epam.epmrduaqgv.back.service.UserAvatarService;
import com.epam.epmrduaqgv.back.util.ControllerUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import springfox.documentation.annotations.ApiIgnore;

import java.io.IOException;

@RestController
@RequestMapping("/avatar")
public class AvatarController {

    @Autowired
    private UserAvatarService userAvatarService;

    @Autowired
    private ObjectMapper objectMapper;

    @Value("${max_avatar_size}")
    private long maxAvatarSize;

    @PostMapping(value = "/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @ApiOperation(value = "Upload profile picture", authorizations = @Authorization(value = "oauth2"))
    public void uploadAvatar(@ApiIgnore OAuth2Authentication oauth,
                             @RequestParam("file") MultipartFile file) throws IOException {
        long size = file.getSize();
        if (size > maxAvatarSize) {
            throw new IllegalArgumentException(String.format("File size is greater than %d bytes", maxAvatarSize));
        }

        String userId = ControllerUtils.getUserId(oauth);

        userAvatarService.updateAvatar(userId, file.getBytes());
    }

    @GetMapping(produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    @ApiOperation(value = "Get profile picture by user id", authorizations = @Authorization(value = "oauth2"))
    public byte[] getAvatarAsBlob(@ApiIgnore OAuth2Authentication oauth) {
        String userId = ControllerUtils.getUserId(oauth);

        UserAvatarEntity userAvatar = userAvatarService.getUserAvatar(userId);
        return userAvatar.getValue();
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    @ApiOperation(value = "Get profile picture by user id", authorizations = @Authorization(value = "oauth2"))
    public UserAvatarDTO getAvatarAsJson(@ApiIgnore OAuth2Authentication oauth) {
        String userId = ControllerUtils.getUserId(oauth);

        UserAvatarEntity userAvatar = userAvatarService.getUserAvatar(userId);
        return objectMapper.convertValue(userAvatar, UserAvatarDTO.class);
    }
}
