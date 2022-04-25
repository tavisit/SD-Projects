package com.backend.Data.DTOs;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Objects;

@Getter
@Setter
public class FoodcategoryDto implements Serializable {
    private Integer id;
    private String name;
    private String description;
}
