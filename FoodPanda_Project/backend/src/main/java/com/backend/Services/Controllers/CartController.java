package com.backend.Services.Controllers;

import com.backend.Data.DTOs.*;
import com.backend.Services.Response.ApiResponse;
import com.backend.Services.Response.ApiResponseBuilder;
import com.backend.Services.Services.BuyerFacade;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Controller that controls the data flow for the cart part
 */
@RestController
@RequestMapping("/cart")
public class CartController {
    /**
     * Buyer Facade that interacts with the controller,
     * @see com.backend.Services.Services.BuyerFacade  for more information
     */
    @Autowired
    private BuyerFacade buyerFacade;

    /**
     * Get the cart from a certain user
     * @param userSite the user that has the required cart
     * @return the response entity corresponding to the success/fail of the request
     */
    @PostMapping("/getCart")
    public ResponseEntity<ApiResponse> getCart(@RequestBody UserDto userSite){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CartController::getCart");
        try {
            List<RestaurantfoodDto> userCart = buyerFacade.seeCart(userSite);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved cart")
                    .withHttpHeader(httpHeaders)
                    .withData(userCart)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    /**
     * Delete the cart from a certain user
     * @param userSite the user that needs to be updated
     * @return the response entity corresponding to the success/fail of the request
     */
    @PostMapping("/delete")
    public ResponseEntity<ApiResponse> deleteCart(@RequestBody UserDto userSite){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CartController::deleteCart");
        try {
            UserDto userDto = userSite;
            userDto = buyerFacade.emptyCart(userDto);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully emptied Cart")
                    .withHttpHeader(httpHeaders)
                    .withData(userDto)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    /**
     * Add to the cart of a user a certain food menu
     * @param addCartDto the complex object that represents the user and the new food
     * @return the response entity corresponding to the success/fail of the request
     */
    @PostMapping("/addToCart")
    public ResponseEntity<ApiResponse> addToCart(@RequestBody AddCartDto addCartDto){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CartController::addToCart");

        try {
            UserDto userDto = buyerFacade.addToCart(addCartDto.getUserDto(),addCartDto.getRestaurantfoodDto());
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully added to cart")
                    .withHttpHeader(httpHeaders)
                    .withData(userDto)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    /**
     * Submit an order from a user with additional information received in path
     * @param userSite the user that placed the order
     * @param orderAdditional the additional information submitted by the user
     * @return the response entity corresponding to the success/fail of the request
     */
    @PostMapping("/submitOrder/{orderAdditional}")
    public ResponseEntity<ApiResponse> submitOrder(@RequestBody UserDto userSite,@PathVariable String orderAdditional){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "CartController::submitOrder");
        try {
            UserDto userDto = userSite;
            userDto = buyerFacade.createNewOrder(userDto,userDto.getMyCart(), new ObjectMapper().readValue(orderAdditional, OrderAdditionalDto.class));

            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully placed order")
                    .withHttpHeader(httpHeaders)
                    .withData(userDto)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
