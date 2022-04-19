package com.backend.Services.Security;

import com.backend.Data.Entities.UserClass;
import com.backend.Data.Repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomDetailsService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;


    public List<UserClass> findUsers() {
        return userRepository.findAll();
    }

    public UserClass findUserById(String id) {
        return userRepository.getById(Integer.valueOf(id));
    }

    public UserClass findByUsername(String username) {
        return userRepository.findByEmail(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) {
        UserClass userClass = userRepository.findByEmail(username);
        if (userClass == null) {
            throw new UsernameNotFoundException(username);
        }
        return new CustomUserDetails(userClass);
    }
}