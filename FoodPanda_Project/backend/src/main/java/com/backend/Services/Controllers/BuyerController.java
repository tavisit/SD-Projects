package com.backend.Services.Controllers;

import com.backend.Data.DTOs.OrderWithDetailsDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Services.Response.ApiResponse;
import com.backend.Services.Response.ApiResponseBuilder;
import com.backend.Services.Services.BuyerFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/buyer")
public class BuyerController {
    @Autowired
    private BuyerFacade buyerFacade;

    @PostMapping("/getOrders")
    public ResponseEntity<ApiResponse> getAllOrders(@RequestBody UserDto userDto){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "BuyerController::getAllOrders");
        try {
            List<OrderWithDetailsDto> orders = buyerFacade.getOrders(userDto);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(orders)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @PostMapping("/getOrders/{status}")
    public ResponseEntity<ApiResponse> getOrdersWithStatus(@RequestBody UserDto userDto,@PathVariable String status){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "BuyerController::getOrdersWithStatus");
        try {
            List<OrderWithDetailsDto> orders = buyerFacade.getOrders(userDto);
            List<OrderWithDetailsDto> actualReturnValue =
                    orders.stream().filter(orderWithDetailsDto ->
                            orderWithDetailsDto.getOrder().getStatus().getName().equalsIgnoreCase(status)).collect(Collectors.toList());
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(actualReturnValue)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
