package com.epam.epmrduaqgv.back.model;


import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;

import java.util.List;

@Getter
@Setter
@Builder
public class ExtendedUserDetails implements org.springframework.security.core.userdetails.UserDetails {

    private String id;
    private List<GrantedAuthority> authorities;
    private String password;
    private String username;
    private boolean isAccountNonExpired;
    private boolean isAccountNonLocked;
    private boolean isCredentialsNonExpired;
    private boolean isEnabled;
}
