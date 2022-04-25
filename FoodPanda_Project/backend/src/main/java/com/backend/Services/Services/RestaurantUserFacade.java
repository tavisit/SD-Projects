package com.backend.Services.Services;

import com.backend.Data.DTOs.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Buyer Facade that interacts with restaurant admin controller,
 * @see com.backend.Services.Controllers.RestaurantController  for more information
 */
@Service
public class RestaurantUserFacade {

    /**
     * Reference autowired to the user Service implemented in the same package
     * @see UserService
     */
    @Autowired
    private UserService userService;
    /**
     * Reference autowired to the order x food Service implemented in the same package
     * @see OrderXFoodService
     */
    @Autowired
    private OrderXFoodService orderXFoodService;
    /**
     * Reference autowired to the order Service implemented in the same package
     * @see OrderService
     */
    @Autowired
    private OrderService orderService;
    /**
     * Reference autowired to the restaurant food Service implemented in the same package
     * @see RestaurantFoodService
     */
    @Autowired
    private RestaurantFoodService restaurantFoodService;

    /**
     * Get the restaurant by id
     * @param id the id of the restaurant
     * @return a new object that represents the restaurant
     * @throws Exception if the user retrieved is not a restaurant
     */
    public UserDto getRestaurantById(Integer id) throws Exception {
        UserDto userDto = userService.getUserDtoById(id);
        if(userDto.getRole().isClient()) throw new Exception("User not found!");
        return userDto;
    }

    /**
     * Get the menu of the restaurant
     * @param userDto the restaurant object that needs to be querried
     * @return a list of food menus that belong to the restaurant
     * @throws Exception if the user is not a restaurant
     */
    public List<RestaurantfoodDto> getMenu(UserDto userDto) throws Exception {
        if(userDto.getRole().isRestaurant()) throw new Exception("User is not a restaurant!");
        return restaurantFoodService.getFoodsByResturant(userDto);
    }

    /**
     * Get all the food categories from the database
     * @return a list of food categories
     * @throws Exception if the food categories are not received successfully
     */
    public List<FoodcategoryDto> getAllCategories() throws Exception{
        return restaurantFoodService.getFoodsCategories();
    }

    /**
     * Get all the orders that correspond with the restaurant
     * @param userDto the restaurant object
     * @return a list of orders with details corresponding to the user
     * @throws Exception if the orders are not received successfully
     */
    public List<OrderWithDetailsDto> getOrders(UserDto userDto) throws Exception{
        List<OrderDto> orders = orderService.getAllOrdersOfRestaurant(userDto);
        return orderXFoodService.getOrdersWithDetailsFromOrderList(orders);
    }

    /**
     * Insert new food in the database
     * @param restaurantfoodDto the food that needs to be inserted
     */
    public void createNewFood(RestaurantfoodDto restaurantfoodDto){
        restaurantFoodService.createNewFood(restaurantfoodDto);
    }

    /**
     * Update the status of the order received in the parameters
     * @param newOrderStatus the new status of the order
     * @param orderDto the order object that needs to be updated
     * @throws Exception if the order is not update with success
     */
    public void changeOrderStatus(String newOrderStatus, OrderDto orderDto) throws Exception{
        FoodstatusDto foodstatusDto = restaurantFoodService.getFoodstatusByName(newOrderStatus);
        orderDto.setStatus(foodstatusDto);
        orderService.updateOrder(orderDto);
    }


}
