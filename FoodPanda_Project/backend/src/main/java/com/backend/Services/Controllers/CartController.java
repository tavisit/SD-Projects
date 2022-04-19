package com.backend.Services.Controllers;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.FoodcategoryDto;
import com.backend.Data.DTOs.OrderDto;
import com.backend.Data.DTOs.RestaurantfoodDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Services.Response.ApiResponse;
import com.backend.Services.Services.BuyerFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cart/{userId}")
public class CartController {
    @Autowired
    private BuyerFacade buyerFacade;

    @GetMapping("/getCart")
    public ResponseEntity<ApiResponse> getCart(@PathVariable Integer userId){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "BuyerController::getByName");
        try {
            MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
            List<RestaurantfoodDto> userCart = buyerFacade.seeCart(buyerFacade.getClientById(userId));
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved cart")
                    .withHttpHeader(httpHeaders)
                    .withData(userCart)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
    @PostMapping("/delete")
    public ResponseEntity<ApiResponse> deleteCart(@PathVariable Integer userId){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CartController::deleteCart");
        try {
            buyerFacade.emptyCart(buyerFacade.getClientById(userId));
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully emptied Cart")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @PostMapping("/addToCart")
    public ResponseEntity<ApiResponse> addToCart(@PathVariable Integer userId, @RequestBody RestaurantfoodDto restaurantfoodDto) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CartController::addToCart");

        try {
            buyerFacade.addToCart(buyerFacade.getClientById(userId),restaurantfoodDto);
            // send email to restaurant when you order

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully added to cart")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @PostMapping("/submitOrder")
    public ResponseEntity<ApiResponse> submitOrder(@PathVariable Integer userId, @RequestBody List<RestaurantfoodDto> cartList){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "BuyerController::getByName");
        try {
            buyerFacade.createNewOrder(buyerFacade.getClientById(userId),cartList);

            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully placed order")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
