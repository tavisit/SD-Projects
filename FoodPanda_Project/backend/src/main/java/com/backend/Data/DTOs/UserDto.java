package com.backend.Data.DTOs;

import com.backend.Data.DTOs.RoleDto;
import lombok.Data;
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
}
