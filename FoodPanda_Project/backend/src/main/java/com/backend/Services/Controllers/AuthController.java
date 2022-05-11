package com.backend.Services.Controllers;

import com.backend.Data.DTOs.LocationDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Services.Response.ApiResponse;
import com.backend.Services.Response.ApiResponseBuilder;
import com.backend.Services.Services.LocationService;
import com.backend.Services.Services.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Controller that controls the data flow for the login/register part
 * Authentification controller for login/register requests
 */
@RestController
@RequestMapping("/auth")
public class AuthController {
    /**
     * Reference autowired to the user Service implemented in the same package
     * @see UserService
     */
    @Autowired
    private UserService userService;
    /**
     * Reference autowired to the location Service implemented in the same package
     * @see LocationService
     */
    @Autowired
    private LocationService locationService;

    /**
     * Logger for the class
     */
    private static final Logger logger = Logger.getLogger(AuthController.class);

    /**
     * Register related post mapping method
     * @param userDto new user to be introduced into the database
     * @return the response entity corresponding to the success/fail of the request
     */
    @PostMapping("/register")
    public ResponseEntity<ApiResponse> createUser(@RequestBody UserDto userDto) {
        logger.info("Called AuthController::createUser");
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AuthController::createUser");

        try {
            userDto = userService.createUser(userDto);
            logger.info("User created with information "+userDto.toString());

            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully registered new user " + userDto.getEmail())
                    .withHttpHeader(httpHeaders)
                    .withData(userDto)
                    .build();
        } catch (Exception ex) {
            logger.error("Error from AuthController::createUser with error "+ex.getMessage());
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    /**
     * Login related post mapping method
     * @param userDTO the user that needs to be logged
     * @return the response entity corresponding to the success/fail of the request
     */
    @PostMapping("/login")
    public ResponseEntity<ApiResponse> loginUser(@RequestBody UserDto userDTO) {
        logger.info("Called AuthController::loginUser");
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AuthController::loginUser");

        try {
            UserDto user = userService.findUser(userDTO.getEmail(), userDTO.getPassword());
            logger.info("User logs into application with credentials: "+user.toString());
            return new ApiResponseBuilder<>(HttpStatus.OK.value(),  "Successfully logged in user.")
                    .withHttpHeader(httpHeaders)
                    .withData(user)
                    .build();

        } catch (Exception ex) {
            logger.error("Error from AuthController::loginUser with error "+ex.getMessage());
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    /**
     * Get all the locations for the register portion
     * @return a list of all locations available
     */
    @GetMapping("/register/location")
    public ResponseEntity<ApiResponse> getLocations() {
        logger.info("Called AuthController::getLocations");
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "AuthController::getLocations");
        try {
            List<LocationDto> locationDto = locationService.getAllLocations();
            logger.info("Returning from AuthController::getLocations information:");
            locationDto.forEach(logger::info);

            return new ApiResponseBuilder<>(HttpStatus.OK.value(),  "Successfully logged in user.")
                    .withHttpHeader(httpHeaders)
                    .withData(locationDto)
                    .build();

        } catch (Exception ex) {
            logger.error("Error from AuthController::getLocations with error "+ex.getMessage());
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
