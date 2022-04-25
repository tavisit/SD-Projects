package com.backend.Services.Controllers;

import com.backend.Data.DTOs.*;
import com.backend.Services.Response.ApiResponse;
import com.backend.Services.Response.ApiResponseBuilder;
import com.backend.Services.Services.PdfMaker;
import com.backend.Services.Services.RestaurantUserFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
/**
 * Controller that controls the data flow for the restaurant component
 */
@RestController
@RequestMapping("/restaurant")
public class RestaurantController {
    /**
     * Restaurant User Facade that interacts with the controller,
     * @see com.backend.Services.Services.RestaurantUserFacade  for more information
     */
    @Autowired
    RestaurantUserFacade restaurantUserFacade;

    /**
     * Get all the food that is available for the restaurant with a certain id
     * @param userId the id of the user
     * @return the response entity corresponding to the success/fail of the request
     */
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

    /**
     * Get all the complex orders with a list of food menus attached to it corresponding to a certain restaurant
     * @see OrderWithDetailsDto for more information on the implementation of the data type
     * @param userId the id of the user
     * @return the response entity corresponding to the success/fail of the request
     */
    @GetMapping("/viewOrders/Simple/{userId}")
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

    /**
     * Get all the food categories available in the database
     * @return the response entity corresponding to the success/fail of the request
     */
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

    /**
     * Get all the orders from a certain user that have a certain state
     * @param userId the id of the user
     * @param orderState the state of the order
     * @return the response entity corresponding to the success/fail of the request
     */
    @GetMapping("/viewOrders/ByState/{userId}/{orderState}")
    public ResponseEntity<ApiResponse> getOrdersByState(@PathVariable Integer userId,@PathVariable String orderState){
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::getOrdersByState");
        try {
            UserDto restaurant = restaurantUserFacade.getRestaurantById(userId);
            List<OrderWithDetailsDto> restaurantFoodList = restaurantUserFacade.getOrders(restaurant);
            List<OrderWithDetailsDto> restaurantfoodDtoList =restaurantFoodList
                            .stream()
                            .filter(restaurantFood->restaurantFood.order.getStatus().getName().equalsIgnoreCase(orderState))
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

    /**
     * Insert into the database a new food menu
     * @param newFood the food that needs to be created
     * @return the response entity corresponding to the success/fail of the request
     */
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

    /**
     * Update the status of an order with a new one
     * @param newStatus the new status of the order
     * @param orderDto the order that is querried
     * @return the response entity corresponding to the success/fail of the request
     */
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

    /**
     * Get the pdf report as byte array for the restaurant administrator
     * @param restaurantId the id of the restaurant that is querried
     * @param orderId the id of the order
     * @return the response entity corresponding to the success/fail of the request
     */
    @PostMapping(value="/getpdf/{restaurantId}")
    public ResponseEntity<ApiResponse> getPDF(@PathVariable Integer restaurantId, @RequestBody Integer orderId) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Responded", "RestaurantController::getPDF");
        try {
            // convert JSON to Employee
            UserDto userDto = restaurantUserFacade.getRestaurantById(restaurantId);
            List<OrderWithDetailsDto> orderList = restaurantUserFacade.getOrders(userDto);
            OrderWithDetailsDto orderWithDetailsDto = orderList.stream()
                    .filter(order-> Objects.equals(order.getOrder().getId(), orderId))
                    .collect(Collectors.toList())
                    .get(0);
            // generate the file
            byte[] document = PdfMaker.createPdf(orderWithDetailsDto);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully updated status")
                    .withHttpHeader(httpHeaders)
                    .withData(document)
                    .build();

        } catch (Exception ex) {
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
