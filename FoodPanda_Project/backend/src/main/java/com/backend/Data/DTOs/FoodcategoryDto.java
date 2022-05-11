package com.backend.Data.DTOs;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class FoodcategoryDto implements Serializable {
    private Integer id;
    private String name;
    private String description;

    @Override
    public String toString() {
        return "FoodcategoryDto{" +
                "name='" + name + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
