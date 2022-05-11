package com.backend.Services.Controllers;

import com.backend.Data.DTOs.OrderWithDetailsDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Services.Response.ApiResponse;
import com.backend.Services.Response.ApiResponseBuilder;
import com.backend.Services.Services.BuyerFacade;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;
/**
 * Controller that controls the data flow for the buyer component
 */
@RestController
@RequestMapping("/buyer")
public class BuyerController {

    /**
     * Logger for the class
     */
    private static final Logger logger = Logger.getLogger(BuyerController.class);

    /**
     * Buyer Facade that interacts with the controller,
     * @see com.backend.Services.Services.BuyerFacade  for more information
     */
    @Autowired
    private BuyerFacade buyerFacade;

    /**
     * Get all the orders from a user
     * @param userDto the user that is querried
     * @return the response entity corresponding to the success/fail of the request
     */
    @PostMapping("/getOrders")
    public ResponseEntity<ApiResponse> getAllOrders(@RequestBody UserDto userDto){
        logger.info("Called BuyerController::getAllOrders");
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "BuyerController::getAllOrders");
        try {
            List<OrderWithDetailsDto> orders = buyerFacade.getOrders(userDto);
            logger.info("Got all orders from user "+userDto.toString()+"with orders:");
            orders.forEach(logger::info);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(orders)
                    .build();

        } catch (Exception ex) {
            logger.error("Error from BuyerController::getAllOrders with error "+ex.getMessage());
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }

    /**
     * Get all the orders with a certain status from user
     * @param userDto the user the is querried
     * @param status the status that is searched
     * @return the response entity corresponding to the success/fail of the request
     */
    @PostMapping("/getOrders/{status}")
    public ResponseEntity<ApiResponse> getOrdersWithStatus(@RequestBody UserDto userDto,@PathVariable String status){
        logger.info("Called BuyerController::getOrdersWithStatus");
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "BuyerController::getOrdersWithStatus");
        try {
            List<OrderWithDetailsDto> orders = buyerFacade.getOrders(userDto);
            logger.info("Got all orders from user "+userDto.toString()+"with orders:");
            orders.forEach(logger::info);
            List<OrderWithDetailsDto> actualReturnValue =
                    orders.stream().filter(orderWithDetailsDto ->
                            orderWithDetailsDto.getOrder().getStatus().getName().equalsIgnoreCase(status)).collect(Collectors.toList());
            logger.info("Got all orders with status "+status+" from user "+userDto.toString()+"with orders:");
            actualReturnValue.forEach(logger::info);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(actualReturnValue)
                    .build();

        } catch (Exception ex) {
            logger.error("Error from BuyerController::getOrdersWithStatus with error "+ex.getMessage());
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
