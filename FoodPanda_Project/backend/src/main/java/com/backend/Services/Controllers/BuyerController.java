package com.backend.Services.Controllers;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.OrderDto;
import com.backend.Data.DTOs.OrderXFoodDto;
import com.backend.Data.DTOs.RestaurantfoodDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Data.Entities.OrderXFood;
import com.backend.Data.Entities.UserClass;
import com.backend.Services.Response.ApiResponse;
import com.backend.Services.Services.BuyerFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/buyer/{userId}")
public class BuyerController {
    @Autowired
    private BuyerFacade buyerFacade;


    @GetMapping("/getAll")
    public ResponseEntity<ApiResponse> getAll(){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "BuyerController::getAll");
        try {
            List<UserClass> restaurants = buyerFacade.getAllRestaurants();
            MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved restaurants")
                    .withHttpHeader(httpHeaders)
                    .withData(mapStructMapper.listUserToUserDto(restaurants))
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
    @GetMapping("/getByName/{restaurantName}")
    public ResponseEntity<ApiResponse> getByName(@PathVariable String restaurantName){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "BuyerController::getByName");
        try {
            List<UserClass> restaurants = buyerFacade.getByName(restaurantName);
            MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved restaurants")
                    .withHttpHeader(httpHeaders)
                    .withData(mapStructMapper.listUserToUserDto(restaurants))
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/getOrders")
    public ResponseEntity<ApiResponse> getOrders(@PathVariable Integer userId){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "BuyerController::getByName");
        try {
            List<OrderDto> orders = buyerFacade.getOrders(buyerFacade.getClientById(userId));
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved restaurants")
                    .withHttpHeader(httpHeaders)
                    .withData(orders)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/getOrders/{orderID}")
    public ResponseEntity<ApiResponse> getOrderDetails(@PathVariable Integer userId,@PathVariable Integer orderID){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "BuyerController::getByName");
        try {
            UserDto userDto = buyerFacade.getClientById(userId);
            List<RestaurantfoodDto> orderDetails = buyerFacade.getOrderDetails(userDto,orderID);
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved restaurants")
                    .withHttpHeader(httpHeaders)
                    .withData(orderDetails)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }


}
