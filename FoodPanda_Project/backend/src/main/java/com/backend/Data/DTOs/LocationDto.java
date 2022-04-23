package com.backend.Data.DTOs;

import lombok.Data;

import javax.persistence.Column;
import java.io.Serializable;

@Data
public class LocationDto implements Serializable {
    private final Integer id;
    private final String city;
    private final Float longitude;
    private final Float latitude;
}
