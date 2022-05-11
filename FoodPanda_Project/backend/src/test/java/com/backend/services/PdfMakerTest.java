package com.backend.services;

import com.backend.Data.DTOs.*;
import com.backend.Services.Services.PdfMaker;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;


import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

class PdfMakerTest {

    @Mock
    private OrderWithDetailsDto orderWithDetailsDto;


    @Test
    void createPdf() throws Exception {
        orderWithDetailsDto = new OrderWithDetailsDto();
        OrderDto orderDto = new OrderDto();
        UserDto restaurant = new UserDto();
        restaurant.setRole(new RoleDto());
        orderDto.setRestaurant(restaurant);
        UserDto client = new UserDto();
        client.setRole(new RoleDto());
        orderDto.setUser(client);
        orderDto.setPrice(100);
        orderDto.setId(100);
        orderDto.setStatus(new FoodstatusDto());
        orderWithDetailsDto.setOrder(orderDto);
        List<RestaurantfoodDto> restaurantfoodDtoList = new ArrayList<>();
        orderWithDetailsDto.setFoodDtoList(restaurantfoodDtoList);
        orderWithDetailsDto.setPrice(100);

        byte[] pdf = PdfMaker.createPdf(orderWithDetailsDto);
        Assertions.assertTrue(pdf.length>0);
    }
}