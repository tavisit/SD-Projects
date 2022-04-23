package com.backend.Services.Controllers;

import com.backend.Data.DTOs.RestaurantfoodDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Services.Response.ApiResponse;
import com.backend.Services.Response.ApiResponseBuilder;
import com.backend.Services.Services.BuyerFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/restaurantInfo")
public class RestaurantInformationController {
    @Autowired
    private BuyerFacade buyerFacade;

    @GetMapping("/getAll/{location}")
    public ResponseEntity<ApiResponse> getAll(@PathVariable String location){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantInformationController::getAll");
        try {
            List<UserDto> restaurants = buyerFacade.getAllRestaurants(location);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved restaurants")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurants)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
    @GetMapping("/getByName/{location}/{restaurantName}")
    public ResponseEntity<ApiResponse> getByName(@PathVariable("restaurantName") String restaurantName,@PathVariable("location") String location){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantInformationController::getByName");
        try {
            List<UserDto> restaurants = buyerFacade.getByName(restaurantName,location);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved restaurants")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurants)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/getById/{restaurantID}")
    public ResponseEntity<ApiResponse> getRestaurantMenu(@PathVariable Integer restaurantID){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantInformationController::getRestaurantMenu");
        try {
            UserDto restaurant = buyerFacade.getRestaurantById(restaurantID);
            List<RestaurantfoodDto> restaurantfoodDtoList = buyerFacade.getMenu(restaurant);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved restaurants")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurantfoodDtoList)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

}
