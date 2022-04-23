package com.backend.Services.Services;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.FoodcategoryDto;
import com.backend.Data.DTOs.FoodstatusDto;
import com.backend.Data.DTOs.RestaurantfoodDto;
import com.backend.Data.DTOs.UserDto;
import com.backend.Data.Repositories.FoodcategoryRepository;
import com.backend.Data.Repositories.FoodstatusRepository;
import com.backend.Data.Repositories.RestaurantfoodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RestaurantFoodService {
    @Autowired
    private RestaurantfoodRepository restaurantfoodRepository;
    @Autowired
    private FoodcategoryRepository foodcategoryRepository;
    @Autowired
    private FoodstatusRepository foodstatusRepository;

    public List<RestaurantfoodDto> getFoodsByResturant(UserDto restaurant) {
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.listRestaurantFoodToRestaurantFoodDto(restaurantfoodRepository.getByRestaurant(mapStructMapper.userDtoToUser(restaurant)));

    }
    public List<FoodcategoryDto> getFoodsCategories() throws Exception{
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.listFoodCategoryToFoodCategoryDto(foodcategoryRepository.findAll());

    }

    public FoodstatusDto getFoodstatusByName(String newOrderStatus){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.foodStatusToFoodStatusDto(foodstatusRepository.getFoodstatusByName(newOrderStatus));
    }

    public void createNewFood(RestaurantfoodDto restaurantfoodDto) {
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        restaurantfoodRepository.save(mapStructMapper.restaurantFoodDtoToRestaurantFood(restaurantfoodDto));
    }

}
