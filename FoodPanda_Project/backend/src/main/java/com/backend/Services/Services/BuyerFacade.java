package com.backend.Services.Services;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.*;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class BuyerFacade {

    @Autowired
    private UserService userService;
    @Autowired
    private OrderXFoodService orderXFoodService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private RestaurantFoodService restaurantFoodService;

    public List<UserDto> getAllRestaurants(String location){
        RoleDto role = userService.getRoleByName("restaurant");
        return userService.getAllByLocationAndRole(location,role);
    }

    public List<UserDto> getByName(String name, String location) {
        RoleDto role = userService.getRoleByName("restaurant");
        return userService.getAllByLocationNameAndRole(name,role,location);
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

    public UserDto emptyCart(@NotNull UserDto userDto){
        userDto.getMyCart().clear();
        return userDto;
    }

    public List<RestaurantfoodDto> seeCart(UserDto userDto){
        return orderXFoodService.seeCart(userDto);
    }

    public List<OrderWithDetailsDto> getOrders(UserDto userDto) {
        List<OrderDto> orders = orderService.getAllOrdersOfClient(userDto);
        return orderXFoodService.getOrdersWithDetailsFromOrderList(orders);
    }

    public UserDto createNewOrder(UserDto userDto, @NotNull List<RestaurantfoodDto> restaurantfoodDtos, OrderAdditionalDto orderAdditional) throws Exception{
        OrderDto orderDto = orderService.createNewOrder(userDto,restaurantfoodDtos.get(0).getRestaurant(),orderAdditional);
        restaurantfoodDtos.forEach(restaurantfoodDto -> {
            orderDto.setPrice(orderDto.getPrice() + restaurantfoodDto.getQuantity()*restaurantfoodDto.getPrice());
        });

        ArrayList<OrderXFoodDto> orderDtos = new ArrayList<>();
        restaurantfoodDtos.forEach(restaurantfoodDto -> {
            if(restaurantfoodDto.getQuantity()>0)
            {
                OrderXFoodDto newEntity = new OrderXFoodDto();
                newEntity.setFood(restaurantfoodDto);
                newEntity.setOrder(orderDto);
                newEntity.setQuantity(restaurantfoodDto.getQuantity());
                orderDtos.add(newEntity);
            }
        });
        orderService.updateOrder(orderDto);
        orderXFoodService.addElement(orderDtos);

        userDto = this.emptyCart(userDto);
        return userDto;
    }

    public UserDto getRestaurantById(Integer id){
        return userService.getUserDtoById(id);
    }

    public List<RestaurantfoodDto> getMenu(UserDto userDto){
        return restaurantFoodService.getFoodsByResturant(userDto);
    }
}
