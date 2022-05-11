package com.backend.services;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.*;
import com.backend.Data.Entities.Foodcategory;
import com.backend.Data.Entities.Foodstatus;
import com.backend.Data.Entities.Restaurantfood;
import com.backend.Data.Repositories.FoodcategoryRepository;
import com.backend.Data.Repositories.FoodstatusRepository;
import com.backend.Data.Repositories.RestaurantfoodRepository;
import com.backend.Services.Services.RestaurantFoodService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.ArrayList;
import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

class RestaurantFoodServiceTest {

    @InjectMocks
    private RestaurantFoodService restaurantFoodService;

    @Mock
    private RestaurantfoodRepository restaurantfoodRepository;

    @Mock
    private FoodcategoryRepository foodcategoryRepository;

    @Mock
    private FoodstatusRepository foodstatusRepository;

    private UserDto restaurant;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        restaurantFoodService = new RestaurantFoodService(restaurantfoodRepository,foodcategoryRepository,foodstatusRepository);
        restaurant = new UserDto();
        RoleDto roleDto = new RoleDto();
        roleDto.setId(0);
        roleDto.setName("Restaurant");
        restaurant.setRole(roleDto);
    }

    @Test
    void getFoodsByResturant() throws Exception {
        List<Restaurantfood> restaurantfoodList = new ArrayList<>();
        int restaurantFoodNr = 10;
        for(int i=0;i<restaurantFoodNr;i++){

            Restaurantfood restaurantfood = new Restaurantfood();
            restaurantfood.setId(i);
            restaurantfood.setPrice(i*2);
            restaurantfood.setFoodName(String.valueOf(i));

            restaurantfoodList.add(restaurantfood);
        }

        when(restaurantfoodRepository.getByRestaurant(any())).thenReturn(restaurantfoodList);

        List<RestaurantfoodDto> restaurantfoodDtoList = restaurantFoodService.getFoodsByResturant(restaurant);

        Assertions.assertEquals(restaurantfoodList.size(),restaurantfoodDtoList.size());
        for(int i=0;i<restaurantFoodNr;i++){
            Assertions.assertEquals(restaurantfoodList.get(i).getId(),restaurantfoodDtoList.get(i).getId());
            Assertions.assertEquals(restaurantfoodList.get(i).getPrice(),restaurantfoodDtoList.get(i).getPrice());
            Assertions.assertEquals(restaurantfoodList.get(i).getFoodName(),restaurantfoodDtoList.get(i).getFoodName());
        }
    }

    @Test
    void getFoodsCategories() throws Exception {
        List<Foodcategory> foodcategoryList = new ArrayList<>();
        int restaurantCatNr = 10;
        for(int i=0;i<restaurantCatNr;i++){

            Foodcategory foodcategory = new Foodcategory();
            foodcategory.setId(i);
            foodcategory.setName(String.valueOf(i));
            foodcategory.setDescription(String.valueOf(i));

            foodcategoryList.add(foodcategory);
        }

        when(foodcategoryRepository.findAll()).thenReturn(foodcategoryList);

        List<FoodcategoryDto> foodcategoryDtoList = restaurantFoodService.getFoodsCategories();
        Assertions.assertEquals(foodcategoryList.size(),foodcategoryDtoList.size());
        for(int i=0;i<restaurantCatNr;i++){
            Assertions.assertEquals(foodcategoryList.get(i).getId(),foodcategoryDtoList.get(i).getId());
            Assertions.assertEquals(foodcategoryList.get(i).getName(),foodcategoryDtoList.get(i).getName());
            Assertions.assertEquals(foodcategoryList.get(i).getDescription(),foodcategoryDtoList.get(i).getDescription());
        }

    }

    @Test
    void getFoodstatusByName() {
        Foodstatus foodStatus = new Foodstatus();
        foodStatus.setId(0);
        foodStatus.setName("test");
        when(foodstatusRepository.getFoodstatusByName(foodStatus.getName())).thenReturn(foodStatus);

        FoodstatusDto foodstatusDto = restaurantFoodService.getFoodstatusByName(foodStatus.getName());

        Assertions.assertEquals(foodStatus.getId(),foodstatusDto.getId());
        Assertions.assertEquals(foodStatus.getName(),foodstatusDto.getName());
    }

    @Test
    void createNewFood() {
        RestaurantfoodDto newFood = new RestaurantfoodDto();
        newFood.setFoodName("food");
        newFood.setPrice(10);
        newFood.setQuantity(0);
        newFood.setFoodDescription("nothing");

        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        when(restaurantfoodRepository.save(any()))
                .thenReturn(mapStructMapper.restaurantFoodDtoToRestaurantFood(newFood));

        RestaurantfoodDto savedFood = restaurantFoodService.createNewFood(newFood);

        Assertions.assertEquals(newFood.getFoodName(),savedFood.getFoodName());
        Assertions.assertEquals(newFood.getPrice(),savedFood.getPrice());
        Assertions.assertEquals(newFood.getFoodDescription(),savedFood.getFoodDescription());
    }
}