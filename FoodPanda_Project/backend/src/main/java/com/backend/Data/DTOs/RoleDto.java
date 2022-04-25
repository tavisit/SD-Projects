package com.backend.Data.DTOs;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class RoleDto implements Serializable {
    private Integer id;
    private String name;

    @Override
    public String toString() {
        return name;
    }

    public boolean isClient(){
        return id==1;
    }

    public boolean isRestaurant(){
        return id==2;
    }
}
