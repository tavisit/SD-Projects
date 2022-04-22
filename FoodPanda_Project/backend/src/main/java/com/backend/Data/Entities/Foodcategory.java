package com.backend.Data.Entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "foodcategories")
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
public class Foodcategory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false, length = 63)
    private String name;

    @Column(name = "description", length = 1024)
    private String description;
}