package com.backend.services;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.LocationDto;
import com.backend.Data.DTOs.RoleDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Data.Entities.Location;
import com.backend.Data.Entities.Role;
import com.backend.Data.Entities.UserClass;
import com.backend.Data.Repositories.LocationRepository;
import com.backend.Data.Repositories.RoleRepository;
import com.backend.Data.Repositories.UserRepository;
import com.backend.Services.Services.LocationService;
import com.backend.Services.Services.UserService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.ArrayList;
import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.when;

public class UserServiceTest {

    @InjectMocks
    private UserService userService;

    @InjectMocks
    private LocationService locationService;

    @Mock
    private LocationRepository locationRepository;

    @Mock
    private UserRepository userRepository;

    @Mock
    private RoleRepository roleRepository;

    @Mock
    private PasswordEncoder passwordEncoder;

    private UserClass testUser;

    @BeforeEach
    void setUp(){
        MockitoAnnotations.openMocks(this);
        locationService = new LocationService(locationRepository);
        userService = new UserService(userRepository,roleRepository,locationService,passwordEncoder);

        testUser = new UserClass();
        testUser.setEmail("sth@gmail.com");
        testUser.setPassword("sth@gmail.com");
        testUser.setName("name");
        Location location = new Location();
        location.setCity("Cluj");
        testUser.setLocation(location);
    }

    @Test
    void getUserDtoById(){
        int id = 1;
        try{
            when(userRepository.getById(id)).thenReturn(testUser);

            UserDto userDto = userService.getUserDtoById(id);

            Assertions.assertEquals(userDto.getEmail(),testUser.getEmail());
            Assertions.assertEquals(userDto.getPassword(),testUser.getPassword());
            Assertions.assertEquals(userDto.getLocation().getCity(),testUser.getLocation().getCity());
        }catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Test
    void getAllByLocationAndRole() throws Exception {
        int nrUsers = 10;
        int nrLocations = 3;
        List<Location> locations = new ArrayList<>();
        for(int i=0;i<nrLocations;i++){
            Location location = new Location();
            if(i%nrLocations==0){
                location.setCity("Cluj");
            }
            else if(i%nrLocations==1){
                location.setCity("Craiova");
            }
            else{
                location.setCity("Timisoara");
            }
            locations.add(location);
        }

        Role role = new Role(0,"Buyer");
        List<UserClass> users = new ArrayList<>();
        for(int i=0;i<nrUsers;i++){
            UserClass userClass = new UserClass();
            if(i%2==0){
                role.setName("Admin");
            }else{
                role.setName("Buyer");
            }
            userClass.setRole(role);
            userClass.setLocation(locations.get(i%nrLocations));
            if(userClass.getLocation().getCity().equals("Cluj")&& userClass.getRole().getName().equals("Buyer")){
                users.add(userClass);
            }
        }

        role.setName("Buyer");
        when(userRepository.getAllByLocationAndRole(anyString(),any())).thenReturn(users);

        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        List<UserDto> userDtos = userService.getAllByLocationAndRole("Cluj", mapStructMapper.roleToRoleDto(role));

        Assertions.assertEquals(users.size(),userDtos.size());

    }

    @Test
    void getAllByLocationNameAndRole() throws Exception {
        int nrUsers = 10;
        int nrLocations = 3;
        List<Location> locations = new ArrayList<>();
        for(int i=0;i<nrLocations;i++){
            Location location = new Location();
            if(i%nrLocations==0){
                location.setCity("Cluj");
            }
            else if(i%nrLocations==1){
                location.setCity("Craiova");
            }
            else{
                location.setCity("Timisoara");
            }
            locations.add(location);
        }

        Role role = new Role(0,"Buyer");
        List<UserClass> users = new ArrayList<>();
        for(int i=0;i<nrUsers;i++){
            UserClass userClass = new UserClass();
            userClass.setName("restaurant");
            if(i%2==0){
                role.setName("Admin");
            }else{
                role.setName("Buyer");
            }
            userClass.setRole(role);
            userClass.setLocation(locations.get(i%nrLocations));
            if(userClass.getLocation().getCity().equals("Cluj")&& userClass.getRole().getName().equals("Buyer")){
                users.add(userClass);
            }
        }

        role.setName("Buyer");
        when(userRepository.getByPartialNameAndLocation(anyString(),any(),anyString())).thenReturn(users);

        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        List<UserDto> userDtos = userService.getAllByLocationNameAndRole("rest", mapStructMapper.roleToRoleDto(role),"Cluj");

        Assertions.assertEquals(users.size(),userDtos.size());

    }

    @Test
    void createUser() throws Exception {
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        Location city = new Location(0,"Cluj",0.0f,0.0f);
        LocationDto cityDto = mapStructMapper.locationToLocationDto(city);

        when(locationRepository.findByCity(any())).thenReturn(city);
        when(userRepository.save(any())).thenReturn(testUser);

        Role role = new Role(0,"Buyer");
        testUser.setRole(role);

        UserDto userDto = userService.createUser(mapStructMapper.userToUserDto(testUser));

        Assertions.assertEquals(testUser.getEmail(),userDto.getEmail());
        Assertions.assertEquals(testUser.getPassword(),userDto.getPassword());
        Assertions.assertEquals(testUser.getRole().getName(),mapStructMapper.roleDtoToRole(userDto.getRole()).getName());
    }

    @Test
    void findUser() throws Exception {
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        Location city = new Location(0,"Cluj",0.0f,0.0f);

        when(locationRepository.findByCity(any())).thenReturn(city);
        when(userRepository.findByEmail(anyString())).thenReturn(testUser);
        when(passwordEncoder.matches(any(),any())).thenReturn(Boolean.TRUE);

        Role role = new Role(0,"Buyer");
        testUser.setRole(role);
        UserDto userDto = userService.findUser(testUser.getEmail(),testUser.getPassword());

        Assertions.assertEquals(testUser.getEmail(),userDto.getEmail());
        Assertions.assertEquals(testUser.getPassword(),userDto.getPassword());
        Assertions.assertEquals(testUser.getRole().getName(),mapStructMapper.roleDtoToRole(userDto.getRole()).getName());

    }

    @Test
    void getRoleByName(){
        Role role = new Role(0,"Buyer");
        when(roleRepository.getByName(any())).thenReturn(role);

        RoleDto roleDto = userService.getRoleByName("Buyer");

        Assertions.assertEquals(role.getName(),roleDto.getName());
    }

}
