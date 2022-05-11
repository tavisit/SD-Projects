package com.backend.Services.Controllers;

import com.backend.Data.DTOs.*;
import com.backend.Services.Response.ApiResponse;
import com.backend.Services.Response.ApiResponseBuilder;
import com.backend.Services.Services.PdfMaker;
import com.backend.Services.Services.RestaurantUserFacade;
import org.apache.log4j.Logger;
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
     * Logger for the class
     */
    private static final Logger logger = Logger.getLogger(RestaurantController.class);
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
            logger.info("Restaurant retrieved with the following information "+ restaurant);
            List<RestaurantfoodDto> restaurantfoodDtoList = restaurantUserFacade.getMenu(restaurant);
            logger.info("List of RestaurantfoodDto retrieved with the following information");
            restaurantfoodDtoList.forEach(logger::info);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved menu")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurantfoodDtoList)
                    .build();

        } catch (Exception ex) {
            logger.error("Error from RestaurantController::viewMenu with error "+ex.getMessage());
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
            logger.info("Restaurant retrieved with the following information "+ restaurant);
            List<OrderWithDetailsDto> restaurantfoodDtoList = restaurantUserFacade.getOrders(restaurant);
            logger.info("A list of OrderWithDetailsDto retrieved with the following information");
            restaurantfoodDtoList.forEach(logger::info);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurantfoodDtoList)
                    .build();

        } catch (Exception ex) {
            logger.error("Error from RestaurantController::viewOrdersWithDetails with error "+ex.getMessage());
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
            logger.info("All food categories retrieved:");
            foodcategoryDtoList.forEach(logger::info);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(foodcategoryDtoList)
                    .build();

        } catch (Exception ex) {
            logger.error("Error from RestaurantController::getFoodCategories with error "+ex.getMessage());
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
            logger.info("Restaurant retrieved with the following information "+ restaurant);
            List<OrderWithDetailsDto> restaurantFoodList = restaurantUserFacade.getOrders(restaurant);
            logger.info("OrderWithDetailsDto retrieved with the following information");
            restaurantFoodList.forEach(logger::info);
            List<OrderWithDetailsDto> restaurantfoodDtoList =restaurantFoodList
                            .stream()
                            .filter(restaurantFood->restaurantFood.order.getStatus().getName().equalsIgnoreCase(orderState))
                            .collect(Collectors.toList());
            logger.info("Filtered OrderWithDetailsDto retrieved with the following information");
            restaurantFoodList.forEach(logger::info);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully retrieved orders")
                    .withHttpHeader(httpHeaders)
                    .withData(restaurantfoodDtoList)
                    .build();

        } catch (Exception ex) {
            logger.error("Error from RestaurantController::getOrdersByState with error "+ex.getMessage());
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
            logger.info("Food created with the following information "+newFood);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully created food")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            logger.error("Error from RestaurantController::createNewFood with error "+ex.getMessage());
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
            logger.info("Status changed to "+newStatus);
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully updated status")
                    .withHttpHeader(httpHeaders)
                    .build();

        } catch (Exception ex) {
            logger.error("Error from RestaurantController::changeStatus with error "+ex.getMessage());
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
            logger.info("User retrieved with information " + userDto);
            List<OrderWithDetailsDto> orderList = restaurantUserFacade.getOrders(userDto);
            logger.info("List of OrderWithDetailsDto retrieved with information ");
            orderList.forEach(logger::info);
            OrderWithDetailsDto orderWithDetailsDto = orderList.stream()
                    .filter(order-> Objects.equals(order.getOrder().getId(), orderId))
                    .collect(Collectors.toList())
                    .get(0);
            logger.info("Filtered OrderWithDetailsDto retrieved with information " + orderWithDetailsDto);
            // generate the file
            byte[] document = PdfMaker.createPdf(orderWithDetailsDto);
            logger.info("PDF created");
            return new ApiResponseBuilder<>(HttpStatus.OK.value(), "Successfully updated status")
                    .withHttpHeader(httpHeaders)
                    .withData(document)
                    .build();

        } catch (Exception ex) {
            logger.error("Error from RestaurantController::getPDF with error "+ex.getMessage());
            return new ApiResponseBuilder<>(HttpStatus.BAD_REQUEST.value(), ex.getMessage())
                    .withHttpHeader(httpHeaders)
                    .build();
        }
    }
}
