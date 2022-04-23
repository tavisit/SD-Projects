package com.backend.Services.Services;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.*;
import com.backend.Data.Repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RestaurantUserFacade {

    @Autowired
    private UserService userService;
    @Autowired
    private OrderXFoodService orderXFoodService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private RestaurantFoodService restaurantFoodService;

    public UserDto getRestaurantById(Integer id){
        return userService.getUserDtoById(id);
    }

    public List<RestaurantfoodDto> getMenu(UserDto userDto){
        return restaurantFoodService.getFoodsByResturant(userDto);
    }

    public List<FoodcategoryDto> getAllCategories() throws Exception{
        return restaurantFoodService.getFoodsCategories();
    }

    public List<OrderWithDetailsDto> getOrders(UserDto userDto){
        List<OrderDto> orders = orderService.getAllOrdersOfRestaurant(userDto);
        return orderXFoodService.getOrdersWithDetailsFromOrderList(orders);
    }

    public void createNewFood(RestaurantfoodDto restaurantfoodDto){
        restaurantFoodService.createNewFood(restaurantfoodDto);
    }

    public OrderDto changeOrderStatus(String newOrderStatus,OrderDto orderDto){
        FoodstatusDto foodstatusDto = restaurantFoodService.getFoodstatusByName(newOrderStatus);
        orderDto.setStatus(foodstatusDto);
        return orderService.updateOrder(orderDto);
    }


}
