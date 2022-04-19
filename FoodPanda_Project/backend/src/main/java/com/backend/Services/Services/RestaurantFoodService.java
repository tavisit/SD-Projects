package com.backend.Services.Services;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.FoodstatusDto;
import com.backend.Data.DTOs.RestaurantfoodDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Data.Repositories.FoodcategoryRepository;
import com.backend.Data.Repositories.RestaurantfoodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RestaurantFoodService {
    @Autowired
    RestaurantfoodRepository restaurantfoodRepository;

    public RestaurantfoodDto getFoodByNameAndRestaurant(String name, UserDto restaurant)
    {
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.restaurantFoodToRestaurantFoodDto(restaurantfoodRepository.getByFoodNameAndRestaurant(name,mapStructMapper.userDtoToUser(restaurant)));
    }

}
