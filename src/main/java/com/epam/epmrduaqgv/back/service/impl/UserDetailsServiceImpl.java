package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.UserEntity;
import com.epam.epmrduaqgv.back.model.ExtendedUserDetails;
import com.epam.epmrduaqgv.back.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.List;

/**
 * Loads user and his authorities from DB
 */
@Component
@Primary
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String email) {
        UserEntity userEntity = userService.findByEmail(email);
        if (userEntity == null) {
            throw new UsernameNotFoundException(email);
        }

        SimpleGrantedAuthority role = new SimpleGrantedAuthority("ROLE_USER");
        List<GrantedAuthority> authorities = Collections.singletonList(role);

        return getAccountDetails(userEntity, authorities);
    }

    private ExtendedUserDetails getAccountDetails(UserEntity userEntity, List<GrantedAuthority> authorities) {
        return ExtendedUserDetails
                .builder()
                .id(userEntity.getId())
                .username(userEntity.getEmail())
                .password(userEntity.getPassword())
                .authorities(authorities)
                .isAccountNonExpired(true)
                .isAccountNonLocked(true)
                .isCredentialsNonExpired(true)
                .isEnabled(true)
                .build();
    }

}
