package com.backend.Data.Repositories;

import com.backend.Data.Entities.Foodstatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FoodstatusRepository extends JpaRepository<Foodstatus, Integer> {

    public Foodstatus getFoodstatusByName(String name);
}