package com.backend.Data.DTOs;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class FoodstatusDto implements Serializable {
    private Integer id;
    private String name;

    @Override
    public String toString() {
        return "Status: " + name;
    }
}
