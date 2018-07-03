package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.UserEntity;
import com.epam.epmrduaqgv.back.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
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
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String email) {
        UserEntity userEntity = userService.findByEmail(email);

        if (userEntity != null) {
            SimpleGrantedAuthority role = new SimpleGrantedAuthority("ROLE_USER");
            List<GrantedAuthority> authorities = Collections.singletonList(role);

            return new User(email, userEntity.getPassword(), authorities);
        } else {
            throw new UsernameNotFoundException(email);
        }
    }
}
