package com.backend.Data.DTOs;

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
    private Float longitude;
    private Float latitude;
    private String additionalInformation;

    @Override
    public String toString() {
        return "OrderDto{" +
                "restaurant=" + restaurant.getId() +
                ", user=" + user.getId() +
                ", status=" + status +
                ", price=" + price +
                ", longitude=" + longitude +
                ", latitude=" + latitude +
                ", additionalInformation='" + additionalInformation + '\'' +
                '}';
    }
}
