package com.backend.Services.Services;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.FoodcategoryDto;
import com.backend.Data.DTOs.FoodstatusDto;
import com.backend.Data.DTOs.OrderDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Data.Entities.Order;
import com.backend.Data.Repositories.FoodcategoryRepository;
import com.backend.Data.Repositories.FoodstatusRepository;
import com.backend.Data.Repositories.OrderRepository;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    FoodstatusRepository foodstatusRepository;

    public OrderDto getOrderById(Integer id){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.orderToOrderDto(orderRepository.getById(id));
    }
    public List<OrderDto> getAllOrdersOfClient(UserDto client){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.listOrderDtoToOrder(orderRepository.getAllByUser(mapStructMapper.userDtoToUser(client)));
    }

    public List<OrderDto> getAllOrdersOfRestaurant(UserDto restaurant){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.listOrderDtoToOrder(orderRepository.getAllByRestaurant(mapStructMapper.userDtoToUser(restaurant)));
    }

    public OrderDto createNewOrder(UserDto client, UserDto restaurantDto){
        OrderDto orderDto = new OrderDto();
        orderDto.setStatus(createNewOrderCategory());
        orderDto.setUser(client);
        orderDto.setRestaurant(restaurantDto);
        orderDto.setPrice(0);

        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        Order order = orderRepository.save(mapStructMapper.orderDtoToOrder(orderDto));
        return mapStructMapper.orderToOrderDto(order);
    }

    public  OrderDto updateOrder(OrderDto orderDto){

        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.orderToOrderDto(orderRepository.save(mapStructMapper.orderDtoToOrder(orderDto)));
    }


    private FoodstatusDto createNewOrderCategory(){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.foodStatusToFoodStatusDto(foodstatusRepository.getById(2));
    }
}
