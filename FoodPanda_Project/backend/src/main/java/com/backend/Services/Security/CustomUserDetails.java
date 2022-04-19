package com.backend.Services.Security;

import com.backend.Data.Entities.UserClass;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Collections;

public class CustomUserDetails implements UserDetails {
    private final UserClass userClass;

    public CustomUserDetails(UserClass userClass) {
        this.userClass = userClass;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        if(this.isAdmin())
            return Collections.singletonList(new SimpleGrantedAuthority("Admin"));
        if(this.isBuyer())
            return Collections.singletonList(new SimpleGrantedAuthority("Buyer"));
        return Collections.singletonList(new SimpleGrantedAuthority("Restaurant"));
    }

    public boolean isAdmin() {
        return userClass.getRole().getName().equals("Admin");
    }

    public boolean isBuyer() {
        return userClass.getRole().getName().equals("Buyer");
    }

    public boolean isRestaurant() {
        return userClass.getRole().getName().equals("Restaurant");
    }

    public UserClass getUser() {
        return userClass;
    }

    @Override
    public String getPassword() {
        return userClass.getPassword();
    }

    @Override
    public String getUsername() {
        return userClass.getEmail();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
