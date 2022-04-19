package com.backend.Data.Repositories;

import com.backend.Data.Entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Integer> {
    Role getByName(String name);
}