package com.backend.Data.Repositories;

import com.backend.Data.Entities.Order;
import com.backend.Data.Entities.UserClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {

    @Query("Select order from Order order where order.userClass=:user")
    public List<Order> getAllByUser(UserClass user);
}