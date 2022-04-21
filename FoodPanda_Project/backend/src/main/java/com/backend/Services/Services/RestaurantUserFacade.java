package com.backend.Services.Services;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.*;
import com.backend.Data.Repositories.FoodstatusRepository;
import com.backend.Data.Repositories.RoleRepository;
import com.backend.Data.Repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

@Service
public class RestaurantUserFacade {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private OrderXFoodService orderXFoodService;
    @Autowired
    private OrderService orderService;
    @Autowired
    RestaurantFoodService restaurantFoodService;
    @Autowired
    FoodstatusRepository foodstatusRepository;

    public UserDto getRestaurantById(Integer id) throws Exception{
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        UserDto userDto = mapStructMapper.userToUserDto(userRepository.getById(id));
        return userDto;
    }

    public List<RestaurantfoodDto> getMenu(UserDto userDto) throws Exception{
        return restaurantFoodService.getFoodsByResturant(userDto);
    }

    public List<OrderWithDetailsDto> getOrders(UserDto userDto){
        List<OrderDto> orders = orderService.getAllOrdersOfRestaurant(userDto);
        return orderXFoodService.getOrdersWithDetailsFromOrderList(orders);
    }

    public void createNewFood(RestaurantfoodDto restaurantfoodDto) throws Exception{
        restaurantFoodService.createNewFood(restaurantfoodDto);
    }

    public void changeOrderStatus(String newOrderStatus,OrderDto orderDto){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        FoodstatusDto foodstatusDto = mapStructMapper.foodStatusToFoodStatusDto(foodstatusRepository.getFoodstatusByName(newOrderStatus));
        orderDto.setStatus(foodstatusDto);
        orderService.updateOrder(orderDto);
    }


}
