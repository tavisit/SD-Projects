package com.backend.Data.Repositories;

import com.backend.Data.Entities.Restaurantfood;
import com.backend.Data.Entities.UserClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RestaurantfoodRepository extends JpaRepository<Restaurantfood, Integer> {

    @Query("select food from Restaurantfood food where food.foodName=:name and food.restaurant=:restaurant")
    public Restaurantfood getByFoodNameAndRestaurant(String name, UserClass restaurant);
    @Query("select food from Restaurantfood food where food.restaurant=:restaurant")
    public List<Restaurantfood> getByRestaurant(UserClass restaurant);
}