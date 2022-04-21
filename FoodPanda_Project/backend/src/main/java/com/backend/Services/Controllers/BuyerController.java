package com.backend.Services.Controllers;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.*;
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
import java.util.Locale;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/buyer")
public class BuyerController {
    @Autowired
    private BuyerFacade buyerFacade;

    @GetMapping("/getOrders")
    public ResponseEntity<ApiResponse> getOrders(@PathVariable Integer userId){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "BuyerController::getOrders");
        try {
            List<OrderWithDetailsDto> orders = buyerFacade.getOrders(buyerFacade.getClientById(userId));
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(orders)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    @GetMapping("/getOrders/{status}")
    public ResponseEntity<ApiResponse> getOrdersWithStatus(@PathVariable Integer userId,@PathVariable String status){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "BuyerController::getOrders");
        try {
            List<OrderWithDetailsDto> orders = buyerFacade.getOrders(buyerFacade.getClientById(userId));
            List<OrderWithDetailsDto> actualReturnValue =
                    orders.stream().filter(orderWithDetailsDto ->
                            orderWithDetailsDto.getOrder().getStatus().getName().equalsIgnoreCase(status)).collect(Collectors.toList());
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(actualReturnValue)
                    .build();

        } catch (Exception ex) {
            return new ApiResponse.ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
