package com.backend.Services.Controllers;


import com.backend.Data.DTOs.FoodstatusDto;
import com.backend.Services.Response.ApiResponse;
import com.backend.Services.Response.ApiResponseBuilder;
import com.backend.Services.Services.OrderService;
import com.backend.Services.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
/**
 * Controller that controls the data flow for the order component
 */
@RestController
@RequestMapping("/orders")
public class OrderController {
    /**
     * Reference autowired to the order Service implemented in the same package
     * @see OrderService
     */
    @Autowired
    OrderService orderService;

    /**
     * Get all the order's statuses stored into the database
     * @return the response entity corresponding to the success/fail of the request
     */
    @GetMapping("/viewStatuses")
    public ResponseEntity<ApiResponse> viewOrdersByState(){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "OrderController::viewOrdersByState");
        try {
            List<FoodstatusDto> orderStatusDtoList = orderService.getOrderStatuses();
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved status list")
                    .withHttpHeader(httpHeaders)
                    .withData(orderStatusDtoList)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
