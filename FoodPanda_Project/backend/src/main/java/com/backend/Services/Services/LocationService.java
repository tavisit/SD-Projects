package com.backend.Services.Services;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.LocationDto;
import com.backend.Data.Repositories.LocationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LocationService {
    @Autowired
    private LocationRepository locationRepository;

    public List<LocationDto> getAllLocations(){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.listLocationToLocationDto(locationRepository.findAll());
    }

    public LocationDto getLocationByName(String name){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.locationToLocationDto(locationRepository.findByCity(name));
    }
}
