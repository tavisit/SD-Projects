package com.backend.Services.Services;

import com.backend.Data.DTOs.*;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


/**
 * Buyer Facade that interacts with buyer controller,
 * @see com.backend.Services.Controllers.BuyerController  for more information
 */
@Service
public class BuyerFacade {

    /**
     * Reference autowired to the user Service implemented in the same package
     * @see UserService
     */
    @Autowired
    private UserService userService;
    /**
     * Reference autowired to the orders with food Service implemented in the same package
     * @see OrderXFoodService
     */
    @Autowired
    private OrderXFoodService orderXFoodService;
    /**
     * Reference autowired to the order Service implemented in the same package
     * @see OrderService
     */
    @Autowired
    private OrderService orderService;
    /**
     * Reference autowired to the restaurant food Service implemented in the same package
     * @see RestaurantFoodService
     */
    @Autowired
    private RestaurantFoodService restaurantFoodService;

    /**
     * Get all restaurants based on a location
     * @param location string that represents the location of the restaurants
     * @return a list of restaurants
     */
    public List<UserDto> getAllRestaurants(String location) throws Exception {
        RoleDto role = userService.getRoleByName("restaurant");
        return userService.getAllByLocationAndRole(location,role);
    }

    /**
     * Get restaurants by partial name and location. It is used to search for partial results
     * In a request of type string
     * @param name string that represents the partial name of the restaurant
     * @param location string that represents the location of the restaurant
     * @return a list of restaurants
     */
    public List<UserDto> getByName(String name, String location) {
        RoleDto role = userService.getRoleByName("restaurant");
        return userService.getAllByLocationNameAndRole(name,role,location);
    }

    /**
     * Add a food menu to a certain user
     * @param userDto the user that added the food to its cart
     * @param restaurantfoodDto the food that needs to be added
     * @return a new user with the cart updated
     * @throws Exception if the user or food doesn't exist or something is incomplete
     */
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

    /**
     * Empty the user's cart
     * @param userDto the user that needs to be addressed
     * @return the user updated
     */
    public UserDto emptyCart(@NotNull UserDto userDto){
        userDto.getMyCart().clear();
        return userDto;
    }

    /**
     * Get the cart of the user
     * @param userDto the user that needs to be addressed
     * @return a list of food menus
     */
    public List<RestaurantfoodDto> seeCart(UserDto userDto){
        return orderXFoodService.seeCart(userDto);
    }

    /**
     * Get the orders of the current user
     * @param userDto the user that needs to be addressed
     * @return a list of orders with details
     */
    public List<OrderWithDetailsDto> getOrders(UserDto userDto) throws Exception {
        List<OrderDto> orders = orderService.getAllOrdersOfClient(userDto);
        return orderXFoodService.getOrdersWithDetailsFromOrderList(orders);
    }

    /**
     * Create a new order for a certain user with information
     * @param userDto the user that needs to be addressed
     * @param restaurantfoodDtos the food that is currently in the client's cart
     * @param orderAdditional additional information for the order, such as location and additional information
     * @return a new user with the update information
     * @throws Exception if something is wrong, then an exception is thrown
     */
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

    /**
     * Get the restaurant by id
     * @param id the id of the restaurant
     * @return the user that is corresponding to the id
     * @throws Exception thrown if something goes wrong, such as wrong user type
     */
    public UserDto getRestaurantById(Integer id) throws Exception{
        UserDto userDto =userService.getUserDtoById(id);
        if(userDto.getRole().isClient()) throw  new Exception("Not a restaurant!");
        return userDto;
    }

    /**
     * Get the menu of the restaurant
     * @param userDto the restaurant's user dto
     * @return a list of the restaurant's food
     * @throws Exception thrown if something goes wrong, such as wrong user type
     */
    public List<RestaurantfoodDto> getMenu(UserDto userDto) throws Exception{
        if(userDto.getRole().isClient()) throw  new Exception("Not a restaurant!");
        return restaurantFoodService.getFoodsByResturant(userDto);
    }
}
