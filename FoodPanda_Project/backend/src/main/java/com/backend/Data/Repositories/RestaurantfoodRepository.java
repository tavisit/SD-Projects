package com.backend.Data.Repositories;

import com.backend.Data.Entities.Restaurantfood;
import com.backend.Data.Entities.UserClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RestaurantfoodRepository extends JpaRepository<Restaurantfood, Integer> {

    @Query("select food from Restaurantfood food where food.foodName=:name and food.restaurant=:restaurant")
    public Restaurantfood getByFoodNameAndRestaurant(String name, UserClass restaurant);
}