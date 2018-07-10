package com.epam.epmrduaqgv.back.service.impl;

import com.epam.epmrduaqgv.back.entity.UserEntity;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.Collection;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class UserDetailsServiceImplTest {

    @InjectMocks
    private UserDetailsServiceImpl userDetailsService;

    @Mock
    private UserServiceImpl userService;

    @Test
    public void shouldReturnCorrectObjectOnLoadUserByUsername() {
        String email = "email";
        String pass = "pass";
        UserEntity testUser = UserEntity.builder()
                .email(email)
                .nickName("testUser")
                .password(pass)
                .build();
        when(userService.findByEmail(email)).thenReturn(testUser);

        UserDetails result = userDetailsService.loadUserByUsername(email);
        Collection<? extends GrantedAuthority> authorities = result.getAuthorities();

        verify(userService).findByEmail(email);

        assertEquals(email, result.getUsername());
        assertEquals(pass, result.getPassword());
        assertEquals(1, authorities.size());
        assertEquals("ROLE_USER", authorities.stream().findFirst().get().getAuthority());
    }

    @Test(expected = UsernameNotFoundException.class)
    public void shouldThrowExceptionOnLoadUserByUsername() {
        userDetailsService.loadUserByUsername("notRegistered@e.mail");
    }
}