package com.backend.Services.Controllers;

import com.backend.Data.DTOs.RestaurantfoodDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Services.Response.ApiResponse;
import com.backend.Services.Response.ApiResponseBuilder;
import com.backend.Services.Services.BuyerFacade;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
/**
 * Controller that controls the data flow for the restaurant information component
 */
@RestController
@RequestMapping("/restaurantInfo")
public class RestaurantInformationController {
    /**
     * Logger for the class
     */
    private static final Logger logger = Logger.getLogger(RestaurantInformationController.class);
    /**
     * Buyer Facade that interacts with the controller,
     * @see com.backend.Services.Services.BuyerFacade  for more information
     */
    @Autowired
    private BuyerFacade buyerFacade;

    /**
     * Get all restaurants that are located in a certain area
     * @param location the location of the restaurant
     * @return the response entity corresponding to the success/fail of the request
     */
    @GetMapping("/getAll/{location}")
    public ResponseEntity<ApiResponse> getAll(@PathVariable String location){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantInformationController::getAll");
        try {
            List<UserDto> restaurants = buyerFacade.getAllRestaurants(location);
            logger.info("List of restaurants retrieved with the following information:");
            restaurants.forEach(logger::info);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved restaurants")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurants)
                    .build();

        } catch (Exception ex) {
            logger.error("Error from BuyerController::getAll with error "+ex.getMessage());
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    /**
     * Get a list of restaurants by looking at the partial name of the restaurant and the location
     * @param restaurantName the partial name of the restaurant
     * @param location the location of the restaurant
     * @return the response entity corresponding to the success/fail of the request
     */
    @GetMapping("/getByName/{location}/{restaurantName}")
    public ResponseEntity<ApiResponse> getByName(@PathVariable("restaurantName") String restaurantName,@PathVariable("location") String location){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantInformationController::getByName");
        try {
            List<UserDto> restaurants = buyerFacade.getByName(restaurantName,location);
            logger.info("List of restaurants retrieved with the following information:");
            restaurants.forEach(logger::info);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved restaurants")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurants)
                    .build();

        } catch (Exception ex) {
            logger.error("Error from BuyerController::getByName with error "+ex.getMessage());
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    /**
     * Get the restarurant's menu by the restaurant ID
     * @param restaurantID the id of the restaurant
     * @return the response entity corresponding to the success/fail of the request
     */
    @GetMapping("/getById/{restaurantID}")
    public ResponseEntity<ApiResponse> getRestaurantMenu(@PathVariable Integer restaurantID){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantInformationController::getRestaurantMenu");
        try {
            UserDto restaurant = buyerFacade.getRestaurantById(restaurantID);
            logger.info("Restaurant retrieved with the following information: "+restaurant);

            List<RestaurantfoodDto> restaurantfoodDtoList = buyerFacade.getMenu(restaurant);
            logger.info("Restaurant food retrieved");
            restaurantfoodDtoList.forEach(logger::info);

            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved restaurants")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurantfoodDtoList)
                    .build();

        } catch (Exception ex) {
            logger.error("Error from BuyerController::getRestaurantMenu with error "+ex.getMessage());
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

}
