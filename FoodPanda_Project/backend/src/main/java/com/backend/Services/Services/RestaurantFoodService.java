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

/**
 * Service that manipulates data regarding the food related information from the database
 */
@Service
public class RestaurantFoodService {
    /**
     * food repository used by the service
     */
    @Autowired
    private RestaurantfoodRepository restaurantfoodRepository;
    /**
     * food category repository used by the service
     */
    @Autowired
    private FoodcategoryRepository foodcategoryRepository;
    /**
     * food status repository used by the service
     */
    @Autowired
    private FoodstatusRepository foodstatusRepository;

    /**
     * Get all the food from a certain restaurant
     * @param restaurant the restaurant that is querried
     * @return a list of food that belongs to the restaurant
     * @throws Exception if the user is not a restaurant
     */
    public List<RestaurantfoodDto> getFoodsByResturant(UserDto restaurant) throws Exception{
        if(restaurant.getRole().isClient()) throw new Exception("Invalid user!");
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.listRestaurantFoodToRestaurantFoodDto(restaurantfoodRepository.getByRestaurant(mapStructMapper.userDtoToUser(restaurant)));

    }

    /**
     * Get all the food categories from database
     * @return a list of all the food categories available
     * @throws Exception if the database if offline
     */
    public List<FoodcategoryDto> getFoodsCategories() throws Exception{
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.listFoodCategoryToFoodCategoryDto(foodcategoryRepository.findAll());

    }

    /**
     * Get an order's status data type by name
     * @param newOrderStatus the name of the new status that needs to be returned
     * @return the new order status
     */
    public FoodstatusDto getFoodstatusByName(String newOrderStatus){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.foodStatusToFoodStatusDto(foodstatusRepository.getFoodstatusByName(newOrderStatus));
    }

    /**
     * Insert new food into the database
     * @param restaurantfoodDto the food that needs to be added to the database
     */
    public void createNewFood(RestaurantfoodDto restaurantfoodDto) {
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        restaurantfoodRepository.save(mapStructMapper.restaurantFoodDtoToRestaurantFood(restaurantfoodDto));
    }

}
