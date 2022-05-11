package com.backend.Data.DTOs;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Setter
@Getter
public class LocationDto implements Serializable {
    private Integer id;
    private String city;
    private Float longitude;
    private Float latitude;

    @Override
    public String toString() {
        return "LocationDto{" +
                "city='" + city + '\'' +
                ", longitude=" + longitude +
                ", latitude=" + latitude +
                '}';
    }
}
