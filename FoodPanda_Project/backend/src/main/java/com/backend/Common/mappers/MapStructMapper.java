package com.backend.Common.mappers;

import com.backend.Data.DTOs.*;
import com.backend.Data.Entities.*;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(
        componentModel = "spring"
)
public interface MapStructMapper {
    RoleDto roleToRoleDto(Role role);

    Role roleDtoToRole(RoleDto roleDto);

    @Mapping(source = "location", target = "location")
    UserDto userToUserDto(UserClass userClass);

    @Mapping(source = "location", target = "location")
    UserClass userDtoToUser(UserDto userPostDto);

    List<UserDto> listUserToUserDto(List<UserClass> userClassList);

    Foodcategory foodCategoryToFoodCategoryDto(FoodcategoryDto foodcategoryDto);

    FoodcategoryDto foodCategoryDtoToFoodCategory(Foodcategory foodcategory);

    List<FoodcategoryDto> listFoodCategoryToFoodCategoryDto(List<Foodcategory> foodcategoryList);

    FoodstatusDto foodStatusToFoodStatusDto(Foodstatus foodstatus);

    Foodstatus foodStatusDtoToStatus(FoodstatusDto foodstatusDto);

    List<FoodstatusDto> listFoodStatusToFoodStatusDto(List<Foodstatus> foodstatusList);
    List<Foodstatus> listFoodStatusDtoToFoodStatus(List<FoodstatusDto> foodstatusDtoList);

    RestaurantfoodDto restaurantFoodToRestaurantFoodDto(Restaurantfood restaurantfood);

    Restaurantfood restaurantFoodDtoToRestaurantFood(RestaurantfoodDto restaurantfoodDto);

    List<Restaurantfood> listRestaurantFoodDtoToRestaurantFood(List<RestaurantfoodDto> restaurantfoodDtoList);

    List<RestaurantfoodDto> listRestaurantFoodToRestaurantFoodDto(List<Restaurantfood> restaurantfoodList);

    @Mapping(source = "userClass", target = "user")
    @Mapping(source = "longitude", target = "longitude")
    @Mapping(source = "latitude", target = "latitude")
    @Mapping(source = "additionalInformation", target = "additionalInformation")
    OrderDto orderToOrderDto(Order order);

    @Mapping(source = "user", target = "userClass")
    @Mapping(source = "longitude", target = "longitude")
    @Mapping(source = "latitude", target = "latitude")
    @Mapping(source = "additionalInformation", target = "additionalInformation")
    Order orderDtoToOrder(OrderDto orderDto);

    List<OrderDto> listOrderDtoToOrder(List<Order> orderList);

    OrderXFood orderXFoodDtoToOrderXFood(OrderXFoodDto orderXFoodDto);

    OrderXFoodDto orderXFoodToOrderXFoodDto(OrderXFood orderXFood);

    List<OrderXFoodDto> listOrderXFoodToOrderXFoodDto(List<OrderXFood> orderXFoodList);

    List<OrderXFood> listOrderXFoodDtoToOrderXFood(List<OrderXFoodDto> orderXFoodDtoList);

    Location locationDtoToLocation(LocationDto locationDto);

    LocationDto locationToLocationDto(Location location);

    List<LocationDto> listLocationToLocationDto(List<Location> location);
}
