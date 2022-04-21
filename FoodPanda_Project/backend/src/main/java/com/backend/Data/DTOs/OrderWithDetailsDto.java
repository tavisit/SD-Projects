package com.backend.Data.DTOs;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
public class OrderWithDetailsDto implements Serializable {

    public OrderDto order;
    public List<RestaurantfoodDto> foodDtoList;
    public Integer price;

}
