package com.backend.Data.DTOs;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class RestaurantfoodDto implements Serializable {
    private Integer id;
    private UserDto restaurant;
    private String foodName;
    private String foodDescription;
    private FoodcategoryDto foodCategory;
    private Integer price;
    private Integer quantity;

    @Override
    public String toString() {
        return "RestaurantfoodDto{" +
                "restaurant=" + restaurant.getId() +
                ", foodName='" + foodName + '\'' +
                ", foodDescription='" + foodDescription + '\'' +
                ", foodCategory=" + foodCategory.getId() +
                ", price=" + price +
                ", quantity=" + quantity +
                '}';
    }
}
