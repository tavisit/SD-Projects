package com.backend.Services.Services;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.OrderDto;
import com.backend.Data.DTOs.OrderXFoodDto;
import com.backend.Data.DTOs.RestaurantfoodDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Data.Entities.Restaurantfood;
import com.backend.Data.Repositories.OrderXFoodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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
        ordersList.forEach(order -> foodInOrder.add(order.getFood()));
        return foodInOrder;
    }

    public List<RestaurantfoodDto> seeCart(UserDto user){
        return user.getMyCart();
    }

    public void addElement(List<OrderXFoodDto> orderXFoodDtos){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        orderXFoodRepository.saveAll(mapStructMapper.listOrderXFoodDtoToOrderXFood(orderXFoodDtos));
    }
}
