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

    Foodstatus foodStatusToFoodStatusDto(FoodstatusDto foodstatusDto);

    FoodstatusDto foodStatusDtoToStatusCategory(Foodstatus foodstatus);

    RestaurantfoodDto restaurantFoodToRestaurantFoodDto(Restaurantfood restaurantfoodDto);

    Restaurantfood restaurantFoodDtoToRestaurantFood(RestaurantfoodDto restaurantfood);

    List<Restaurantfood> listRestaurantFoodDtoToRestaurantFood(List<RestaurantfoodDto> restaurantfood);

    OrderDto orderToOrderDto(Order order);

    Order orderDtoToOrder(OrderDto order);

    List<OrderDto> listOrderDtoToOrder(List<Order> order);

    OrderXFood orderXFoodDtoToOrderXFood(OrderXFoodDto orderXFoodDto);

    OrderXFoodDto orderXFoodToOrderXFoodDto(OrderXFood orderXFood);

    List<OrderXFoodDto> listOrderXFoodToOrderXFoodDto(List<OrderXFood> orderXFood);
    List<OrderXFood> listOrderXFoodDtoToOrderXFood(List<OrderXFoodDto> orderXFoodDto);
}
