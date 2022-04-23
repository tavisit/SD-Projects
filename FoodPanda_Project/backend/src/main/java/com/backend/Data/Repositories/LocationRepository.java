package com.backend.Data.Repositories;

import com.backend.Data.Entities.Location;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LocationRepository extends JpaRepository<Location, Integer> {

    public Location findByCity(String city);
}