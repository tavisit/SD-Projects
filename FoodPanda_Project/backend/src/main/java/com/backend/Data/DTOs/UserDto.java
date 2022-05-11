package com.backend.Data.DTOs;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
public class UserDto implements Serializable {
    private Integer id;
    private String email;
    private String password;
    private String name;
    private RoleDto role;
    private LocationDto location;
    private List<RestaurantfoodDto> myCart;
    private String token;

    @Override
    public String toString() {
        return "UserDto{" +
                "email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", role=" + role +
                ", location=" + location.getId() +
                '}';
    }
}
