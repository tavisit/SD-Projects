package com.backend.Services.Services;

import com.backend.Common.exceptions.NotFoundException;
import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.OrderDto;
import com.backend.Data.DTOs.OrderXFoodDto;
import com.backend.Data.DTOs.RestaurantfoodDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Data.Entities.Role;
import com.backend.Data.Entities.UserClass;
import com.backend.Data.Repositories.OrderXFoodRepository;
import com.backend.Data.Repositories.RoleRepository;
import com.backend.Data.Repositories.UserRepository;
import com.google.inject.internal.util.Iterables;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicInteger;

@Service
public class BuyerFacade {

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

    public UserDto getClientById(Integer id) throws Exception{
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        UserDto userDto = new UserDto();
        userDto = mapStructMapper.userToUserDto(userRepository.getById(id));
        return userDto;
    }
    public void createUser(@NotNull UserDto userDTO) throws Exception {
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        userDTO.setRole(mapStructMapper.roleToRoleDto(roleRepository.getByName("buyer")));
        userService.createUser(userDTO);
    }

    public List<UserClass> getAllRestaurants(){
        Role role = roleRepository.getByName("restaurant");
        return userRepository.getAll(role);
    }

    public List<UserClass> getByName(String name) {
        Role role = roleRepository.getByName("restaurant");
        return userRepository.getByPartialName(name,role);
    }

    public void addToCart(@NotNull UserDto userDto, RestaurantfoodDto restaurantfoodDto) throws Exception{
        userDto.getMyCart().add(restaurantfoodDto);
    }

    public void emptyCart(@NotNull UserDto userDto) throws Exception{
        userDto.getMyCart().clear();
    }

    public List<RestaurantfoodDto> seeCart(UserDto userDto) throws Exception{
        return orderXFoodService.seeCart(userDto);
    }

    public List<OrderDto> getOrders(UserDto userDTO) throws Exception {
        return orderService.getAllOrders(userDTO);
    }

    public List<RestaurantfoodDto> getOrderDetails(@NotNull UserDto userDto, Integer orderId) throws Exception{
        OrderDto orderDto = orderService.getOrderById(orderId);
        if(!Objects.equals(orderDto.getUser().getId(), userDto.getId()))
            throw new NotFoundException("User doesn't have this order!");

        return orderXFoodService.getAllByOrder(orderDto);
    }


    public void createNewOrder(UserDto userDto, @NotNull List<RestaurantfoodDto> restaurantfoodDtos) throws Exception{
        // create Order
        OrderDto orderDto = orderService.createNewOrder(userDto,restaurantfoodDtos.get(0).getRestaurant());
        // create OrderXFood
        ArrayList<OrderXFoodDto> orderDtos = new ArrayList<>();
        restaurantfoodDtos.forEach(restaurantfoodDto -> {
            OrderXFoodDto newEntity = new OrderXFoodDto();
            newEntity.setFood(restaurantfoodDto);
            newEntity.setOrder(orderDto);
            newEntity.setQuantity(1);

            orderDto.setPrice(orderDto.getPrice()+newEntity.getFood().getPrice());

            AtomicInteger i = new AtomicInteger();
            OrderXFoodDto finalNewEntity = newEntity;
            int index = orderDtos.stream()
                    .peek(v -> i.incrementAndGet())
                    .anyMatch(orderXFoodDto -> orderXFoodDto.getFood().getId().equals(finalNewEntity.getFood().getId())) ? // your predicate
                    i.get() - 1 : -1;

            if(index>=0)
            {
                newEntity = orderDtos.get(index);
                newEntity.setQuantity(newEntity.getQuantity()+1);
                orderDtos.set(index,newEntity);
            }
            else
            {
                orderDtos.add(newEntity);
            }
        });

        orderService.updateOrder(orderDto);
        orderXFoodService.addElement(orderDtos);
    }

}
