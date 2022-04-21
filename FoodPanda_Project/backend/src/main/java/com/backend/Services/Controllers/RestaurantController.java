package com.backend.Services.Controllers;

import com.backend.Data.DTOs.OrderDto;
import com.backend.Data.DTOs.OrderWithDetailsDto;
import com.backend.Data.DTOs.RestaurantfoodDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Services.Response.ApiResponse;
import com.backend.Services.Services.RestaurantUserFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/restaurant/{userId}")
public class RestaurantController {

    @Autowired
    RestaurantUserFacade restaurantUserFacade;

    // view all the food
    @GetMapping("/viewMenu")
    public ResponseEntity<ApiResponse> viewMenu(@PathVariable Integer userId){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::viewMenu");
        try {
            UserDto restaurant = restaurantUserFacade.getRestaurantById(userId);
            List<RestaurantfoodDto> restaurantfoodDtoList = restaurantUserFacade.getMenu(restaurant);
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved menu")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurantfoodDtoList)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
    // view orders
    @GetMapping("/viewOrders")
    public ResponseEntity<ApiResponse> viewOrdersWithDetails(@PathVariable Integer userId){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::viewOrders");
        try {
            UserDto restaurant = restaurantUserFacade.getRestaurantById(userId);
            List<OrderWithDetailsDto> restaurantfoodDtoList = restaurantUserFacade.getOrders(restaurant);
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurantfoodDtoList)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
    // filter orders
    @GetMapping("/viewOrders/{orderState}")
    public ResponseEntity<ApiResponse> viewOrdersByState(@PathVariable Integer userId,@PathVariable String orderState){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::viewOrdersByState");
        try {
            UserDto restaurant = restaurantUserFacade.getRestaurantById(userId);
            List<OrderWithDetailsDto> restaurantfoodDtoList = restaurantUserFacade.getOrders(restaurant);
            List<OrderWithDetailsDto> restaurantFoodDtoListFiltered =
                    restaurantfoodDtoList
                            .stream()
                            .filter(restaurantFood->restaurantFood.order.getStatus().getName().equals(orderState))
                            .collect(Collectors.toList());;
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurantFoodDtoListFiltered)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    // create new food
    @PostMapping("/createFood")
    public ResponseEntity<ApiResponse> createNewFood(@PathVariable Integer userId, @RequestBody RestaurantfoodDto newFood){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::createNewFood");
        try {
            restaurantUserFacade.createNewFood(newFood);
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully created food")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    // accept/decline order
    // change status of order
    @PostMapping("/createFood/{newStatus}")
    public ResponseEntity<ApiResponse> changeStatus(@PathVariable Integer userId, @PathVariable String orderState,@RequestBody OrderDto orderDto){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::createNewFood");
        try {
            restaurantUserFacade.changeOrderStatus(orderState,orderDto);
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully updated status")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
    // export as pdf the menu
}
