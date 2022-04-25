package com.backend.Services.Services;

import com.backend.Common.exceptions.NotFoundException;
import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.RoleDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Data.Entities.UserClass;
import com.backend.Data.Repositories.RoleRepository;
import com.backend.Data.Repositories.UserRepository;
import com.backend.Services.Validators.UserValidator;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * The user service that manages data related to the user information
 */
@Service
public class UserService {
    /**
     * user repository used by the service
     */
    @Autowired
    private UserRepository userRepository;
    /**
     * role repository used by the service
     */
    @Autowired
    private RoleRepository roleRepository;
    /**
     * location repository used by the service
     */
    @Autowired
    private LocationService locationService;
    /**
     * password encoder object
     */
    @Autowired
    private PasswordEncoder passwordEncoder;

    /**
     * Get user by id
     * @param id the id of the user
     * @return the new user retrieved from the database
     * @throws Exception if something goes wrong with the database retrieval
     */
    public UserDto getUserDtoById(Integer id) throws Exception{
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.userToUserDto(userRepository.getById(id));
    }

    /**
     * Get all users by location and role
     * @param location the location of the suer
     * @param role the role of the user
     * @return a list of users that correspond with the data provided
     * @throws Exception if nothing is found or the database is not responding
     */
    public List<UserDto>  getAllByLocationAndRole(String location, RoleDto role) throws Exception{
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.listUserToUserDto(
                userRepository.getAllByLocationAndRole(
                        location,
                        mapStructMapper.roleDtoToRole(role)
                ));
    }

    /**
     * Get all the users by partial name, role and location
     * @param name the name that will be partially searched in the database
     * @param role the role of the user
     * @param location the location of the suer
     * @return a list of users that correspond with the data provided in the parameters
     */
    public List<UserDto>  getAllByLocationNameAndRole(String name,RoleDto role,String location ){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.listUserToUserDto(
                userRepository.getByPartialNameAndLocation(
                        name,
                        mapStructMapper.roleDtoToRole(role),
                        location));
    }

    /**
     * create a new user in the database
     * @param userDTO the user inforamtion that is retrieved from top levels
     * @return the user that was saved and retrieved from database
     * @throws Exception if the user has invalid information or database is not contactable
     */
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

    /**
     * find user by email and password combination
     * @param email the email of the user
     * @param password the password of the user
     * @return in case a match is found, a new user is returned
     * @throws Exception if the user is not found
     */
    public UserDto findUser(String email, String password) throws Exception {
        UserClass userClass = userRepository.findByEmail(email);
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        if (userClass != null && passwordEncoder.matches(password, userClass.getPassword())) {
            return mapStructMapper.userToUserDto(userClass);
        } else throw new NotFoundException("Invalid username or password.");
    }

    /**
     * Get role data type by name
     * @param name the name of the role
     * @return the role that was searched
     */
    public RoleDto getRoleByName(String name){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.roleToRoleDto(roleRepository.getByName(name));
    }
}
