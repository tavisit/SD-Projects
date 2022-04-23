package com.backend.Services.Services;

import com.backend.Common.exceptions.NotFoundException;
import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.RoleDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Data.Entities.Role;
import com.backend.Data.Entities.UserClass;
import com.backend.Data.Repositories.RoleRepository;
import com.backend.Data.Repositories.UserRepository;
import com.backend.Services.Validators.UserValidator;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private LocationService locationService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    public UserDto getUserDtoById(Integer id){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.userToUserDto(userRepository.getById(id));
    }

    public List<UserDto>  getAllByLocationAndRole(String location, RoleDto role){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.listUserToUserDto(
                userRepository.getAllByLocationAndRole(
                        location,
                        mapStructMapper.roleDtoToRole(role)
                ));
    }

    public List<UserDto>  getAllByLocationNameAndRole(String name,RoleDto role,String location ){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.listUserToUserDto(
                userRepository.getByPartialNameAndLocation(
                        name,
                        mapStructMapper.roleDtoToRole(role),
                        location));
    }

    public UserDto createUser(@NotNull UserDto userDTO) throws Exception {
        if(userDTO.getRole()==null) throw new Exception("Invalid Role");

        userDTO.setRole(this.getRoleByName(userDTO.getRole().getName()));
        userDTO.setLocation(locationService.getLocationByName(userDTO.getLocation().getCity()));
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

    public RoleDto getRoleByName(String name){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.roleToRoleDto(roleRepository.getByName(name));
    }
}
