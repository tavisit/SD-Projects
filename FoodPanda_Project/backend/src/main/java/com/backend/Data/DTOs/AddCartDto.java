package com.backend.Data.DTOs;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AddCartDto {
    private UserDto userDto;
    private RestaurantfoodDto restaurantfoodDto;

    @Override
    public String toString() {
        return "AddCartDto{" +
                "userDto=" + userDto +
                ", restaurantfoodDto=" + restaurantfoodDto +
                '}';
    }
}
