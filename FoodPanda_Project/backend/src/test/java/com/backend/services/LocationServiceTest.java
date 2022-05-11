package com.backend.services;

import com.backend.Data.DTOs.LocationDto;
import com.backend.Data.Entities.Location;
import com.backend.Data.Repositories.LocationRepository;
import com.backend.Services.Services.LocationService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.ArrayList;
import java.util.List;

import static org.mockito.Mockito.when;

public class LocationServiceTest {

    @InjectMocks
    private LocationService locationService;

    @Mock
    private LocationRepository locationRepository;

    @BeforeEach
    void setUp(){
        MockitoAnnotations.openMocks(this);
        locationService = new LocationService(locationRepository);
    }

    @Test
    void findAll(){
        List<Location> locations = new ArrayList<>();
        int nrElem = 10;
        for(int i=0;i<nrElem;i++){
            Location location = new Location();
            location.setCity("city");
            location.setLatitude(1.0f);
            location.setLatitude(1.0f);
            locations.add(location);
        }
        when(locationRepository.findAll()).thenReturn(locations);

        List<LocationDto> list = locationService.getAllLocations();

        Assertions.assertEquals(list.size(),nrElem);
    }

    @Test
    void getLocationByName(){
        String cityName = "Cluj";
        Location location = new Location();
        location.setCity(cityName);
        location.setLatitude(1.0f);
        location.setLongitude(1.0f);

        when(locationRepository.findByCity("Cluj")).thenReturn(location);

        LocationDto locationDto = locationService.getLocationByName("Cluj");

        Assertions.assertEquals(locationDto.getCity(),cityName);
    }
}
