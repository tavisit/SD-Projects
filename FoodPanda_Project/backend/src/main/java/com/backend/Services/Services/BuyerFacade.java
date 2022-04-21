package com.backend.Services.Services;

import com.backend.Common.exceptions.NotFoundException;
import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.*;
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
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Stream;

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
    @Autowired
    private RestaurantFoodService restaurantFoodService;

    public UserDto getClientById(Integer id) throws Exception{
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        UserDto userDto = mapStructMapper.userToUserDto(userRepository.getById(id));
        return userDto;
    }
    public UserDto createUser(@NotNull UserDto userDTO) throws Exception {
        if(userDTO.getRole()==null) throw new Exception("Invalid Role");

        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        userDTO.setRole(mapStructMapper.roleToRoleDto(roleRepository.getByName(userDTO.getRole().getName())));
        return userService.createUser(userDTO);
    }

    public List<UserClass> getAllRestaurants(){
        Role role = roleRepository.getByName("restaurant");
        return userRepository.getAll(role);
    }

    public List<UserClass> getByName(String name) {
        Role role = roleRepository.getByName("restaurant");
        return userRepository.getByPartialName(name,role);
    }

    public UserDto addToCart(@NotNull UserDto userDto, RestaurantfoodDto restaurantfoodDto) throws Exception{
        if(userDto.getMyCart()==null)
        {
            userDto.setMyCart(new ArrayList<>());
        }

        Optional<RestaurantfoodDto> firstFind = userDto.getMyCart()
                .stream()
                .filter(restaurantfoodDto1 -> restaurantfoodDto1.getId() == restaurantfoodDto.getId())
                .findFirst();
        if(firstFind.isPresent())
        {
            int index = userDto.getMyCart().indexOf(firstFind.get());
            if(index==-1)
            {
                restaurantfoodDto.setQuantity(1);
                userDto.getMyCart().add(restaurantfoodDto);
                return userDto;
            }
            firstFind.get().setQuantity(firstFind.get().getQuantity()+1);
            userDto.getMyCart().set(index,firstFind.get());
        }
        else
        {
            restaurantfoodDto.setQuantity(1);
            userDto.getMyCart().add(restaurantfoodDto);
        }

        return userDto;
    }

    public UserDto emptyCart(@NotNull UserDto userDto) throws Exception{
        userDto.getMyCart().clear();
        return userDto;
    }

    public List<RestaurantfoodDto> seeCart(UserDto userDto) throws Exception{
        return orderXFoodService.seeCart(userDto);
    }

    public List<OrderWithDetailsDto> getOrders(UserDto userDto) throws Exception {
        List<OrderDto> orders = orderService.getAllOrdersOfClient(userDto);
        return orderXFoodService.getOrdersWithDetailsFromOrderList(orders);
    }

    public List<RestaurantfoodDto> getOrderDetails(@NotNull UserDto userDto, Integer orderId) throws Exception{
        OrderDto orderDto = orderService.getOrderById(orderId);
        if(!Objects.equals(orderDto.getUser().getId(), userDto.getId()))
            throw new NotFoundException("User doesn't have this order!");

        return orderXFoodService.getAllByOrder(orderDto);
    }


    public UserDto createNewOrder(UserDto userDto, @NotNull List<RestaurantfoodDto> restaurantfoodDtos) throws Exception{
        // create Order
        OrderDto orderDto = orderService.createNewOrder(userDto,restaurantfoodDtos.get(0).getRestaurant());
        // create OrderXFood
        restaurantfoodDtos.forEach(restaurantfoodDto -> {
            orderDto.setPrice(orderDto.getPrice() + restaurantfoodDto.getQuantity()*restaurantfoodDto.getPrice());
        });

        ArrayList<OrderXFoodDto> orderDtos = new ArrayList<>();
        restaurantfoodDtos.forEach(restaurantfoodDto -> {
            OrderXFoodDto newEntity = new OrderXFoodDto();
            newEntity.setFood(restaurantfoodDto);
            newEntity.setOrder(orderDto);
            newEntity.setQuantity(restaurantfoodDto.getQuantity());
            orderDtos.add(newEntity);
        });

        orderService.updateOrder(orderDto);
        orderXFoodService.addElement(orderDtos);

        userDto = this.emptyCart(userDto);
        return userDto;
    }

    public UserDto getRestaurantById(Integer id) throws Exception{
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        UserDto userDto = mapStructMapper.userToUserDto(userRepository.getById(id));
        return userDto;
    }

    public List<RestaurantfoodDto> getMenu(UserDto userDto) throws Exception{
        return restaurantFoodService.getFoodsByResturant(userDto);
    }

}
