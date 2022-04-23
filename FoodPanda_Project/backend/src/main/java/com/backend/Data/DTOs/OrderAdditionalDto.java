package com.backend.Data.DTOs;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderAdditionalDto {
    private Float longitude;
    private Float latitude;
    private String additionalInformation;
}
