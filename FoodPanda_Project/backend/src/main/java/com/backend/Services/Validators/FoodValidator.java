package com.backend.Services.Validators;

import com.backend.Common.exceptions.InvalidDataException;
import com.backend.Data.DTOs.RestaurantfoodDto;
import com.backend.Data.Entities.Restaurantfood;
import com.backend.Data.Repositories.RestaurantfoodRepository;

import java.util.Optional;

public class FoodValidator {
    public static void isFoodValid(RestaurantfoodDto foodDTO, RestaurantfoodRepository restaurantfoodRepository) throws Exception {
        isValidName(foodDTO.getFoodName());
        isValidPrice(foodDTO.getPrice());
        isValidRestaurantId(foodDTO.getId(), restaurantfoodRepository);
    }

    public static void isValidName(String name) throws InvalidDataException {
        if (name == null || name.isEmpty())
            throw new InvalidDataException("Please insert a name.");

        if (name.length() < 3)
            throw new InvalidDataException("Please insert a name with at least 3 characters.");
    }

    public static void isValidPrice(Integer price) throws InvalidDataException {
        if (price == null)
            throw new InvalidDataException("Please insert a name.");

        if (price <= 0)
            throw new InvalidDataException("Please insert a positive number as a price.");
    }

    public static void isValidRestaurantId(Integer id, RestaurantfoodRepository restaurantfoodRepository) throws InvalidDataException{
        if(id<0)
            throw new InvalidDataException("Invalid id");

        Optional<Restaurantfood> restaurant = restaurantfoodRepository.findById(id);
        if(!restaurant.isPresent())
            throw new InvalidDataException("Invalid restaurant ID");
    }
}
