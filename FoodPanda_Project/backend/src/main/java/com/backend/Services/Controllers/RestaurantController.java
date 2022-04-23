package com.backend.Services.Controllers;

import com.backend.Data.DTOs.*;
import com.backend.Services.Response.ApiResponse;
import com.backend.Services.Response.ApiResponseBuilder;
import com.backend.Services.Services.RestaurantUserFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/restaurant")
public class RestaurantController {

    @Autowired
    RestaurantUserFacade restaurantUserFacade;

    // view all the food
    @GetMapping("/viewMenu/{userId}")
    public ResponseEntity<ApiResponse> viewMenu(@PathVariable Integer userId){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::viewMenu");
        try {
            UserDto restaurant = restaurantUserFacade.getRestaurantById(userId);
            List<RestaurantfoodDto> restaurantfoodDtoList = restaurantUserFacade.getMenu(restaurant);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved menu")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurantfoodDtoList)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
    // view orders
    @GetMapping("/viewOrders/{userId}")
    public ResponseEntity<ApiResponse> viewOrdersWithDetails(@PathVariable Integer userId){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::viewOrdersWithDetails");
        try {
            UserDto restaurant = restaurantUserFacade.getRestaurantById(userId);
            List<OrderWithDetailsDto> restaurantfoodDtoList = restaurantUserFacade.getOrders(restaurant);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurantfoodDtoList)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
    // view orders
    @GetMapping("/getCategories")
    public ResponseEntity<ApiResponse> getFoodCategories(){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::getFoodCategories");
        try {
            List<FoodcategoryDto> foodcategoryDtoList = restaurantUserFacade.getAllCategories();
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(foodcategoryDtoList)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
    // filter orders
    @GetMapping("/viewOrders/{userId}/{orderState}")
    public ResponseEntity<ApiResponse> getOrdersByState(@PathVariable("userId") Integer userId,@PathVariable("orderState") String orderState){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::getOrdersByState");
        try {
            UserDto restaurant = restaurantUserFacade.getRestaurantById(userId);
            List<OrderWithDetailsDto> restaurantfoodDtoList =
                    restaurantUserFacade.getOrders(restaurant)
                            .stream()
                            .filter(restaurantFood->restaurantFood.order.getStatus().getName().equals(orderState))
                            .collect(Collectors.toList());
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurantfoodDtoList)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    // create new food
    @PostMapping("/createFood")
    public ResponseEntity<ApiResponse> createNewFood(@RequestBody RestaurantfoodDto newFood){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::createNewFood");
        try {
            restaurantUserFacade.createNewFood(newFood);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully created food")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    // accept/decline order
    // change status of order
    @PostMapping("/changeStatus/{newStatus}")
    public ResponseEntity<ApiResponse> changeStatus(@PathVariable String newStatus,@RequestBody OrderDto orderDto){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::changeStatus");
        try {
            restaurantUserFacade.changeOrderStatus(newStatus,orderDto);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully updated status")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
    // export as pdf the menu
}
