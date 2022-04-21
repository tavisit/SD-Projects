package com.backend.Services.Services;

import com.backend.Common.exceptions.NotFoundException;
import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.UserDto;
import com.backend.Data.Entities.UserClass;
import com.backend.Data.Repositories.UserRepository;
import com.backend.Services.Validators.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    public UserDto createUser(UserDto userDTO) throws Exception {
        UserValidator.isUserValid(userDTO, userRepository);
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        UserClass userClass = mapStructMapper.userDtoToUser(userDTO);
        userClass.setPassword(passwordEncoder.encode(userDTO.getPassword()));
        userClass = userRepository.save(userClass);
        return mapStructMapper.userToUserDto(userClass);
    }

    public UserDto findUser(String email, String password) throws Exception {
        UserClass userClass = userRepository.findByEmail(email);
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        if (userClass != null && passwordEncoder.matches(password, userClass.getPassword())) {
            return mapStructMapper.userToUserDto(userClass);
        } else throw new NotFoundException("Invalid username or password.");
    }
}
