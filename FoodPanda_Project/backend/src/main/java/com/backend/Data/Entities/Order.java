package com.backend.Data.Entities;

import javax.persistence.*;

@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "restaurant_id", nullable = false)
    private UserClass restaurant;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private UserClass userClass;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "status", nullable = false)
    private Foodstatus status;

    @Column(name = "price", nullable = false)
    private Integer price;

    public UserClass getUserClass() {
        return userClass;
    }

    public void setUserClass(UserClass userClass) {
        this.userClass = userClass;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Foodstatus getStatus() {
        return status;
    }

    public void setStatus(Foodstatus status) {
        this.status = status;
    }

    public UserClass getUser() {
        return userClass;
    }

    public void setUser(UserClass userClass) {
        this.userClass = userClass;
    }

    public UserClass getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(UserClass restaurant) {
        this.restaurant = restaurant;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}