package com.backend.services;

import com.backend.Data.DTOs.LocationDto;
import com.backend.Data.DTOs.RestaurantfoodDto;
import com.backend.Data.DTOs.RoleDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Services.Services.*;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

class RestaurantUserFacadeTest {

    @InjectMocks
    private RestaurantUserFacade restaurantUserFacade;

    @Mock
    private UserService userService;

    @Mock
    private OrderXFoodService orderXFoodService;

    @Mock
    private OrderService orderService;

    @Mock
    private RestaurantFoodService restaurantFoodService;

    private List<UserDto> restaurants;
    private List<UserDto> clients;
    private String location = "Cluj";

    @BeforeEach
    void setUp(){
        MockitoAnnotations.openMocks(this);
        restaurantUserFacade = new RestaurantUserFacade(userService,orderXFoodService,orderService,restaurantFoodService);

        location = "Cluj";
        restaurants = new ArrayList<>();
        clients = new ArrayList<>();
        int nrUsers = 10;
        for(int i=0;i<nrUsers;i++) {
            UserDto user = new UserDto();
            RoleDto roleDto = new RoleDto();
            roleDto.setId(i % 2 + 1);
            if (i % 2 == 0) {
                roleDto.setName("buyer");
                user.setName("buyer" + i);
            } else {
                roleDto.setName("restaurant");
                user.setName("restaurant" + i);
            }
            user.setRole(roleDto);
            LocationDto locationDto = new LocationDto();
            locationDto.setCity(location);
            user.setLocation(locationDto);
            if (roleDto.isRestaurant()) {
                restaurants.add(user);
            } else {
                clients.add(user);
            }
        }
    }

    @Test
    void getRestaurantByIdRestaurant() throws Exception {
        when(userService.getUserDtoById(any())).thenReturn(restaurants.get(0));
        restaurantUserFacade.getRestaurantById(0);
        verify(userService,times(1)).getUserDtoById(any());
    }

    @Test
    void getRestaurantByIdClient() throws Exception {
        when(userService.getUserDtoById(any())).thenReturn(clients.get(0));
        try{

            restaurantUserFacade.getRestaurantById(0);
        }catch (Exception ignored){
            Assertions.assertThat(true);
        }
    }

    @Test
    void getMenu() throws Exception {
        when(restaurantFoodService.getFoodsByResturant(any())).thenReturn(null);
        restaurantUserFacade.getMenu(restaurants.get(0));
        verify(restaurantFoodService,times(1)).getFoodsByResturant(any());
    }

    @Test
    void getAllCategories() throws Exception {
        when(restaurantFoodService.getFoodsCategories()).thenReturn(null);
        restaurantUserFacade.getAllCategories();
        verify(restaurantFoodService,times(1)).getFoodsCategories();
    }

    @Test
    void getOrders() throws Exception {
        when(orderService.getAllOrdersOfRestaurant(any())).thenReturn(null);
        when(orderXFoodService.getOrdersWithDetailsFromOrderList(any())).thenReturn(null);
        restaurantUserFacade.getOrders(restaurants.get(0));
        verify(orderService,times(1)).getAllOrdersOfRestaurant(any());
        verify(orderXFoodService,times(1)).getOrdersWithDetailsFromOrderList(any());
    }

    @Test
    void createNewFood() {
        RestaurantfoodDto restaurantfoodDto = new RestaurantfoodDto();
        when(restaurantFoodService.createNewFood(any())).thenReturn(restaurantfoodDto);
        restaurantUserFacade.createNewFood(restaurantfoodDto);
        verify(restaurantFoodService,times(1)).createNewFood(any());

    }

    @Test
    void changeOrderStatus() {
        // TODO
    }
}