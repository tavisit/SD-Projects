package com.backend.Data.Repositories;

import com.backend.Data.Entities.Role;
import com.backend.Data.Entities.UserClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserRepository extends JpaRepository<UserClass, Integer> {
    UserClass findByEmail(String email);

    @Query("Select a from UserClass a where a.role=:restaurantRole")
    List<UserClass> getAll(Role restaurantRole);

    @Query("Select a from UserClass a where a.name like %:name% and a.role=:restaurantRole")
    List<UserClass> getByPartialName(String name,Role restaurantRole);
}