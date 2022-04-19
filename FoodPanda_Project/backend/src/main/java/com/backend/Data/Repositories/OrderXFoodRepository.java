package com.backend.Data.Repositories;

import com.backend.Data.Entities.Order;
import com.backend.Data.Entities.OrderXFood;
import com.backend.Data.Entities.UserClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderXFoodRepository extends JpaRepository<OrderXFood, Integer> {

    @Query("Select actualOrders from OrderXFood actualOrders where actualOrders.order.userClass=:userClass")
    public List<OrderXFood> getAllByUser(UserClass userClass);

    @Query("Select actualOrders from OrderXFood actualOrders where actualOrders.order=:order")
    public List<OrderXFood> getAllByOrder(Order order);
}