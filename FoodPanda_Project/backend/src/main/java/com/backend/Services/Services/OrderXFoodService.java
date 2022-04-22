package com.backend.Services.Services;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.*;
import com.backend.Data.Entities.OrderXFood;
import com.backend.Data.Entities.Restaurantfood;
import com.backend.Data.Repositories.OrderXFoodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

@Service
public class OrderXFoodService {
    @Autowired
    private OrderXFoodRepository orderXFoodRepository;

    public List<OrderXFoodDto> getAll(UserDto user) {
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();

        return mapStructMapper.listOrderXFoodToOrderXFoodDto(orderXFoodRepository.getAllByUser(mapStructMapper.userDtoToUser(user)));
    }

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

    public List<RestaurantfoodDto> seeCart(UserDto user){
        return user.getMyCart();
    }

    public void addElement(List<OrderXFoodDto> orderXFoodDtos){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        List<OrderXFood> orderXFoodsList = mapStructMapper.listOrderXFoodDtoToOrderXFood(orderXFoodDtos);
        orderXFoodRepository.saveAll(orderXFoodsList);
    }

    public List<OrderWithDetailsDto> getOrdersWithDetailsFromOrderList(List<OrderDto> orders){
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
