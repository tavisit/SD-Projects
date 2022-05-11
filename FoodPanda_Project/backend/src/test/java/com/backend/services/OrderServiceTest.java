package com.backend.services;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.FoodstatusDto;
import com.backend.Data.DTOs.OrderDto;
import com.backend.Data.DTOs.RoleDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Data.Entities.Order;
import com.backend.Data.Repositories.FoodstatusRepository;
import com.backend.Data.Repositories.OrderRepository;
import com.backend.Services.Services.OrderService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.ArrayList;
import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

class OrderServiceTest {

    @InjectMocks
    private OrderService orderService;

    @Mock
    private OrderRepository orderRepository;

    @Mock
    private FoodstatusRepository foodstatusRepository;

    private UserDto restaurant;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        orderService = new OrderService(orderRepository,foodstatusRepository);
        restaurant = new UserDto();
        RoleDto roleDto = new RoleDto();
        roleDto.setId(0);
        roleDto.setName("Restaurant");
        restaurant.setRole(roleDto);
    }

    @Test
    void getAllOrdersOfClient() throws Exception {
        List<Order> ordersTest = new ArrayList<>();
        int nrOrders = 10;
        for(int i=0;i<nrOrders;i++){
            Order order = new Order();
            order.setPrice(10);
            order.setId(i);
            ordersTest.add(order);
        }
        when(orderRepository.getAllByUser(any())).thenReturn(ordersTest);

        List<OrderDto> ordersService = orderService.getAllOrdersOfClient(restaurant);

        for(int i=0;i<nrOrders;i++){
            Assertions.assertEquals(ordersTest.get(i).getId(),ordersService.get(i).getId());
        }
    }

    @Test
    void getAllOrdersOfRestaurant() throws Exception {
        List<Order> orders = new ArrayList<>();
        int nrOrders = 10;
        for(int i=0;i<nrOrders;i++){
            Order order = new Order();
            order.setPrice(10);
            order.setId(i);
            orders.add(order);
        }
        when(orderRepository.getAllByRestaurant(any())).thenReturn(orders);

        List<OrderDto> orderDtoList = orderService.getAllOrdersOfRestaurant(restaurant);

        for(int i=0;i<nrOrders;i++){
            Assertions.assertEquals(orders.get(i).getId(),orderDtoList.get(i).getId());
        }
    }

    @Test
    void createNewOrder() {
        UserDto client = new UserDto();
        RoleDto roleDto = new RoleDto();
        roleDto.setId(0);
        roleDto.setName("Buyer");
        client.setRole(roleDto);

        Order mockOrder = new Order();
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        mockOrder.setRestaurant(mapStructMapper.userDtoToUser(restaurant));
        mockOrder.setUserClass(mapStructMapper.userDtoToUser(client));

        when(orderRepository.save(any())).thenReturn(mockOrder);

        OrderDto orderDto = orderService.createNewOrder(client,restaurant,null);

        Assertions.assertEquals(mockOrder.getRestaurant().getId(),orderDto.getRestaurant().getId());
        Assertions.assertEquals(mockOrder.getUserClass().getId(),orderDto.getUser().getId());
    }

    @Test
    void updateOrder() throws Exception {
        UserDto client = new UserDto();
        RoleDto roleDto = new RoleDto();
        roleDto.setId(0);
        roleDto.setName("Buyer");
        client.setRole(roleDto);

        Order mockOrder = new Order();
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        mockOrder.setRestaurant(mapStructMapper.userDtoToUser(restaurant));
        mockOrder.setUserClass(mapStructMapper.userDtoToUser(client));

        when(orderRepository.save(any())).thenReturn(mockOrder);
        OrderDto orderDto = orderService.createNewOrder(client,restaurant,null);
        orderDto.setPrice(10);
        mockOrder.setPrice(10);
        OrderDto orderDtoUpdated = orderService.updateOrder(orderDto);

        Assertions.assertEquals(mockOrder.getRestaurant().getId(),orderDtoUpdated.getRestaurant().getId());
        Assertions.assertEquals(mockOrder.getUserClass().getId(),orderDtoUpdated.getUser().getId());
        Assertions.assertEquals(mockOrder.getPrice(),orderDtoUpdated.getPrice());
    }

    @Test
    void getOrderStatuses() {
        List<FoodstatusDto> foodstatusDtoList = new ArrayList<>();

        int nrFood = 10;
        for(int i=0;i<nrFood;i++){
            FoodstatusDto foodstatusDto = new FoodstatusDto();
            foodstatusDto.setId(i);
            foodstatusDto.setName(String.valueOf(i));
            foodstatusDtoList.add(foodstatusDto);
        }
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();

        when(foodstatusRepository.findAll()).thenReturn(mapStructMapper.listFoodStatusDtoToFoodStatus(foodstatusDtoList));

        List<FoodstatusDto> foodGot = orderService.getOrderStatuses();

        for(int i=0;i<nrFood;i++){
            Assertions.assertEquals(foodstatusDtoList.get(i).getName(),foodGot.get(i).getName());
            Assertions.assertEquals(foodstatusDtoList.get(i).getId(),foodGot.get(i).getId());
        }
    }
}