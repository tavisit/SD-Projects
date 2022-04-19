package com.backend.Data.Entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "restaurantfoods")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public class Restaurantfood {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "restaurant_id")
    private UserClass restaurant;

    @Column(name = "food_name", length = 128)
    private String foodName;

    @Column(name = "food_description", length = 1024)
    private String foodDescription;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "food_category")
    private Foodcategory foodCategory;

    @Column(name = "price", nullable = false)
    private Integer price;

    public Foodcategory getFoodCategory() {
        return foodCategory;
    }

    public void setFoodCategory(Foodcategory foodCategory) {
        this.foodCategory = foodCategory;
    }

    public String getFoodDescription() {
        return foodDescription;
    }

    public void setFoodDescription(String foodDescription) {
        this.foodDescription = foodDescription;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
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