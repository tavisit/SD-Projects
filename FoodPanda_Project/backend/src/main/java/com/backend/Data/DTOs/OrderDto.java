package com.backend.Data.DTOs;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class OrderDto implements Serializable {
    private Integer id;
    private UserDto restaurant;
    private UserDto user;
    private FoodstatusDto status;
    private Integer price;
}
