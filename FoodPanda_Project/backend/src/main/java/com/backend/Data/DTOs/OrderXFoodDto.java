package com.backend.Data.DTOs;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class OrderXFoodDto implements Serializable {
    private Integer id;
    private OrderDto order;
    private RestaurantfoodDto food;
    private Integer quantity;
}
