package com.backend.services;

import com.backend.Data.DTOs.*;
import com.backend.Data.Entities.Order;
import com.backend.Services.Services.*;
import io.jsonwebtoken.lang.Assert;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.AdditionalAnswers;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.when;

class BuyerFacadeTest {

    @InjectMocks
    private BuyerFacade buyerFacade;

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
    void setUp() {
        MockitoAnnotations.openMocks(this);
        buyerFacade = new BuyerFacade(userService,orderXFoodService,orderService,restaurantFoodService);

        location = "Cluj";
        restaurants = new ArrayList<>();
        clients = new ArrayList<>();
        int nrUsers = 10;
        for(int i=0;i<nrUsers;i++){
            UserDto user = new UserDto();
            RoleDto roleDto = new RoleDto();
            roleDto.setId(i%2+1);
            if(i%2==0){
                roleDto.setName("buyer");
                user.setName("buyer"+i);
            }
            else
            {
                roleDto.setName("restaurant");
                user.setName("restaurant"+i);
            }
            user.setRole(roleDto);
            LocationDto locationDto = new LocationDto();
            locationDto.setCity(location);
            user.setLocation(locationDto);
            if(roleDto.isRestaurant()){
                restaurants.add(user);
            }
            else
            {
                clients.add(user);
            }
        }
    }

    @Test
    void getAllRestaurants() throws Exception {
        when(userService.getAllByLocationAndRole(anyString(),any())).thenReturn(restaurants);
        List<UserDto> retrievedRestaurant = buyerFacade.getAllRestaurants(location);

        Assertions.assertEquals(restaurants.size(),retrievedRestaurant.size());
    }

    @Test
    void getByName() {
        when(userService.getAllByLocationNameAndRole(anyString(),any(),any())).thenReturn(restaurants);
        List<UserDto> retrievedRestaurant = buyerFacade.getByName(restaurants.get(0).getName(),location);

        Assertions.assertEquals(restaurants.size(),retrievedRestaurant.size());
    }

    @Test
    void addToCart() throws Exception {
        UserDto currentUser = clients.get(0);
        RestaurantfoodDto restaurantfoodDto = new RestaurantfoodDto();

        currentUser = buyerFacade.addToCart(currentUser,restaurantfoodDto);
        Assertions.assertEquals(currentUser.getMyCart().size(),1);

        buyerFacade.addToCart(currentUser,restaurantfoodDto);
        Assertions.assertEquals(currentUser.getMyCart().size(),1);
        Assertions.assertEquals(currentUser.getMyCart().get(0).getQuantity(),2);
    }

    @Test
    void emptyCart() throws Exception {
        UserDto currentUser = clients.get(0);
        RestaurantfoodDto restaurantfoodDto = new RestaurantfoodDto();

        currentUser = buyerFacade.addToCart(currentUser,restaurantfoodDto);
        currentUser = buyerFacade.addToCart(currentUser,restaurantfoodDto);
        currentUser = buyerFacade.emptyCart(currentUser);
        Assertions.assertEquals(currentUser.getMyCart(),new ArrayList<>());
    }

    @Test
    void seeCart() throws Exception {
        UserDto currentUser = clients.get(0);
        int nrFood = 10;
        for(int i=0;i<nrFood;i++){
            RestaurantfoodDto restaurantfoodDto = new RestaurantfoodDto();
            currentUser = buyerFacade.addToCart(currentUser,restaurantfoodDto);
        }
        when(orderXFoodService.seeCart(currentUser)).thenReturn(currentUser.getMyCart());
        List<RestaurantfoodDto> retrievedFood = buyerFacade.seeCart(currentUser);
        Assertions.assertEquals(currentUser.getMyCart().size(),retrievedFood.size());
    }

    @Test
    void createNewOrder() throws Exception {
        UserDto currentUser = clients.get(0);
        UserDto currentRestaurant = restaurants.get(0);
        int nrFood = 10;
        for(int i=0;i<nrFood;i++){
            RestaurantfoodDto restaurantfoodDto = new RestaurantfoodDto();
            restaurantfoodDto.setPrice(10);
            currentUser = buyerFacade.addToCart(currentUser,restaurantfoodDto);
        }
        OrderAdditionalDto orderAdditionalDto = new OrderAdditionalDto();
        OrderDto newOrder = new OrderDto();
        newOrder.setPrice(0);
        newOrder.setId(0);
        newOrder.setAdditionalInformation("nothing");
        newOrder.setRestaurant(currentRestaurant);
        newOrder.setUser(currentUser);
        when(orderService.createNewOrder(any(),any(),any())).thenReturn(newOrder);
        when(orderService.updateOrder(any())).thenAnswer((Answer) invocation -> invocation.getArguments()[0]);

        UserDto retrievedUser = buyerFacade.createNewOrder(currentUser,currentUser.getMyCart(),orderAdditionalDto);
        assertEquals(0, retrievedUser.getMyCart().size());
    }
}