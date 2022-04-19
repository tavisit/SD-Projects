package com.backend.Data.Repositories;

import com.backend.Data.Entities.Foodcategory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FoodcategoryRepository extends JpaRepository<Foodcategory, Integer> {
}