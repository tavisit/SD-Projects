package com.backend.Services.Services;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.*;
import com.backend.Data.Entities.OrderXFood;
import com.backend.Data.Repositories.OrderXFoodRepository;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Order x Food signifies the relation between the food and the order that it is bound to
 * This was chosen in order to have a list of foods bound to orders in the database and in the program logic
 */
@Service
public class OrderXFoodService {
    /**
     * OrderXFood repository used by the service
     */
    @Autowired
    private OrderXFoodRepository orderXFoodRepository;

    public OrderXFoodService(OrderXFoodRepository orderXFoodRepository) {
        this.orderXFoodRepository = orderXFoodRepository;
    }


    /**
     * Get all food that is bound to a certain order
     * @param orderDto the order that is requested
     * @return a list of food that belongs to the order
     */
    public List<RestaurantfoodDto> getAllByOrder(OrderDto orderDto) {
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();

        List<OrderXFoodDto> ordersList = mapStructMapper.listOrderXFoodToOrderXFoodDto(
                orderXFoodRepository.getAllByOrder(mapStructMapper.orderDtoToOrder(orderDto)));
        List<RestaurantfoodDto> foodInOrder = new ArrayList<>();
        ordersList.forEach(order -> {
            RestaurantfoodDto restaurantfoodDto = order.getFood();
            restaurantfoodDto.setQuantity(order.getQuantity());
            foodInOrder.add(restaurantfoodDto);
        });
        return foodInOrder;
    }

    /**
     * Get the food from the user's cart
     * @param user the user that has the cart
     * @return a list of food menus
     */
    public List<RestaurantfoodDto> seeCart(@NotNull UserDto user){
        return user.getMyCart();
    }

    /**
     * Add a list of foods with bound order to the database
     * @param orderXFoodDtos a list of food and order that needs to be added
     */
    public void addElement(List<OrderXFoodDto> orderXFoodDtos){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        List<OrderXFood> orderXFoodsList = mapStructMapper.listOrderXFoodDtoToOrderXFood(orderXFoodDtos);
        orderXFoodRepository.saveAll(orderXFoodsList);
    }

    /**
     * Get all the information regarding a list of orders
     * @param orders a list of orders that need to be querried
     * @return a list that contains all the information regarding an order (food, user, restaurant)
     */
    public List<OrderWithDetailsDto> getOrdersWithDetailsFromOrderList(@NotNull List<OrderDto> orders){
        List<OrderWithDetailsDto> actualOrders = new ArrayList<>();
        orders.forEach(orderDto -> {
            List<RestaurantfoodDto> food = this.getAllByOrder(orderDto);
            AtomicInteger price = new AtomicInteger();
            food.forEach(foodDto -> price.addAndGet(foodDto.getPrice()*foodDto.getQuantity()));
            OrderWithDetailsDto currentOrderWithDetails = new OrderWithDetailsDto();
            currentOrderWithDetails.setFoodDtoList(food);
            currentOrderWithDetails.setOrder(orderDto);
            currentOrderWithDetails.setPrice(price.get());
            actualOrders.add(currentOrderWithDetails);
        });

        return actualOrders;
    }
}
