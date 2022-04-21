package com.backend.Common.mappers;

import com.backend.Data.DTOs.*;
import com.backend.Data.Entities.*;
import org.mapstruct.*;

import java.util.List;

@Mapper(
        componentModel = "spring"
)
public interface MapStructMapper {
    RoleDto roleToRoleDto(Role role);

    Role roleDtoToRole(RoleDto roleDto);

    UserDto userToUserDto(UserClass userClass);

    UserClass userDtoToUser(UserDto userPostDto);

    List<UserDto> listUserToUserDto(List<UserClass> userClassList);

    Foodcategory foodCategoryToFoodCategoryDto(FoodcategoryDto foodcategoryDto);

    FoodcategoryDto foodCategoryDtoToFoodCategory(Foodcategory foodcategory);

    FoodstatusDto foodStatusToFoodStatusDto(Foodstatus foodstatus);

    Foodstatus foodStatusDtoToStatus(FoodstatusDto foodstatusDto);

    RestaurantfoodDto restaurantFoodToRestaurantFoodDto(Restaurantfood restaurantfood);

    Restaurantfood restaurantFoodDtoToRestaurantFood(RestaurantfoodDto restaurantfoodDto);

    List<Restaurantfood> listRestaurantFoodDtoToRestaurantFood(List<RestaurantfoodDto> restaurantfoodDtoList);

    List<RestaurantfoodDto> listRestaurantFoodToRestaurantFoodDto(List<Restaurantfood> restaurantfoodList);

    OrderDto orderToOrderDto(Order order);

    Order orderDtoToOrder(OrderDto orderDto);

    List<OrderDto> listOrderDtoToOrder(List<Order> orderList);

    OrderXFood orderXFoodDtoToOrderXFood(OrderXFoodDto orderXFoodDto);

    OrderXFoodDto orderXFoodToOrderXFoodDto(OrderXFood orderXFood);

    List<OrderXFoodDto> listOrderXFoodToOrderXFoodDto(List<OrderXFood> orderXFoodList);

    List<OrderXFood> listOrderXFoodDtoToOrderXFood(List<OrderXFoodDto> orderXFoodDtoList);
}
