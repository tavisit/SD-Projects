package com.utcn.foodpanda.backend.repositories;

import com.utcn.foodpanda.backend.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository("userRepository")
@Transactional
public interface UserRepository extends JpaRepository<User, Long> {
}