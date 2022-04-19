package com.backend.Data.DTOs;

import lombok.Data;
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
}
