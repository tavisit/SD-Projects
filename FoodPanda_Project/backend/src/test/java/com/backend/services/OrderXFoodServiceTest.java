package com.backend.services;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.*;
import com.backend.Data.Entities.OrderXFood;
import com.backend.Data.Entities.Restaurantfood;
import com.backend.Data.Repositories.OrderXFoodRepository;
import com.backend.Services.Services.OrderXFoodService;
import com.backend.Services.Services.RestaurantFoodService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;

import javax.inject.Inject;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;


import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.ignoreStubs;
import static org.mockito.Mockito.when;

class OrderXFoodServiceTest {

    @InjectMocks
    private OrderXFoodService orderXFoodService;

    @Mock
    private OrderXFoodRepository orderXFoodRepository;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        orderXFoodService = new OrderXFoodService(orderXFoodRepository);
    }
    @Test
    void getAllByOrder() {
        OrderDto orderDto = new OrderDto();
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        List<OrderXFood> getOrdersList = new ArrayList<>();
        int nrOrders = 10;

        for(int i=0;i<nrOrders;i++){
            OrderXFood orderXFood = new OrderXFood();
            orderXFood.setId(i);
            orderXFood.setQuantity(i);
            orderXFood.setOrder(mapStructMapper.orderDtoToOrder(orderDto));
            Restaurantfood restaurantfood = new Restaurantfood();
            restaurantfood.setId(i);
            restaurantfood.setFoodName(String.valueOf(i));
            restaurantfood.setFoodDescription(String.valueOf(i));
            orderXFood.setFood(restaurantfood);
            getOrdersList.add(orderXFood);
        }

        when(orderXFoodRepository.getAllByOrder(any())).thenReturn(getOrdersList);

        List<RestaurantfoodDto> foodRetrievedList = orderXFoodService.getAllByOrder(orderDto);

        Assertions.assertEquals(getOrdersList.size(),foodRetrievedList.size());
        for(int i=0;i<nrOrders;i++){
            Assertions.assertEquals(getOrdersList.get(i).getFood().getId(),foodRetrievedList.get(i).getId());
            Assertions.assertEquals(getOrdersList.get(i).getFood().getFoodName(),foodRetrievedList.get(i).getFoodName());
            Assertions.assertEquals(getOrdersList.get(i).getFood().getFoodDescription(),foodRetrievedList.get(i).getFoodDescription());
        }
    }

    @Test
    void seeCart() {
        UserDto user = new UserDto();
        List<RestaurantfoodDto> userFood = new ArrayList<>();
        int nrFoods = 10;
        for(int i=0;i<nrFoods;i++){
            RestaurantfoodDto restaurantfoodDto = new RestaurantfoodDto();
            restaurantfoodDto.setId(0);
            userFood.add(restaurantfoodDto);
        }
        user.setMyCart(userFood);

        List<RestaurantfoodDto> restaurantfoodDtoList = orderXFoodService.seeCart(user);
        Assertions.assertEquals(user.getMyCart().size(),restaurantfoodDtoList.size());
        for(int i=0;i<nrFoods;i++){
            Assertions.assertEquals(user.getMyCart().get(i).getId(),restaurantfoodDtoList.get(i).getId());
        }
    }

    @Test
    void addElement() {
        List<OrderXFoodDto> orderXFoodDtos = new ArrayList<>();
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        List<OrderXFood> orderXFoodsList = mapStructMapper.listOrderXFoodDtoToOrderXFood(orderXFoodDtos);
        when(orderXFoodRepository.saveAll(orderXFoodsList)).thenReturn(orderXFoodsList);
        orderXFoodService.addElement(orderXFoodDtos);
    }

    @Test
    void getOrdersWithDetailsFromOrderList(){
        // TODO
    }
}