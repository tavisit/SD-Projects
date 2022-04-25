package com.backend.Services.Services;

import com.backend.Common.mappers.MapStructMapperImpl;
import com.backend.Data.DTOs.LocationDto;
import com.backend.Data.Repositories.LocationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Service that manages the location related data
 */
@Service
public class LocationService {
    /**
     * location repository used by the service
     */
    @Autowired
    private LocationRepository locationRepository;

    /**
     * Get all the locations in the database
     * @return a list of locations
     */
    public List<LocationDto> getAllLocations(){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.listLocationToLocationDto(locationRepository.findAll());
    }

    /**
     * Get a location by name
     * @param name the location's name
     * @return the location that was requested
     */
    public LocationDto getLocationByName(String name){
        MapStructMapperImpl mapStructMapper = new MapStructMapperImpl();
        return mapStructMapper.locationToLocationDto(locationRepository.findByCity(name));
    }
}
