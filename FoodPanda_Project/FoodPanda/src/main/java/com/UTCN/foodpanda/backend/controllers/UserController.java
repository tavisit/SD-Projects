package com.utcn.foodpanda.backend.controllers;

import com.utcn.foodpanda.backend.entities.User;
import com.utcn.foodpanda.backend.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("users")
public class UserController {
    @Autowired
    public UserRepository repository;

    @GetMapping(value = "", produces = "application/json")
    public List<User> all() {
        return repository.findAll();
    }

    @PostMapping(value = "/newuser", produces = "application/json")
    public User newUser(@RequestBody User newUser) {
        return repository.save(newUser);
    }

    @GetMapping(value = "/{id}", produces = "application/json")
    public User one(@PathVariable Integer id) {

        return repository.findById(Long.valueOf(id))
                .orElseThrow(RuntimeException::new);
    }

    @PutMapping(value = "/replace/{id}", produces = "application/json")
    public User replaceUser(@RequestBody User newUser, @PathVariable Long id) {

        return repository.findById(id)
                .map(employee -> {
                    employee.setName(newUser.getName());
                    employee.setRole(newUser.getRole());
                    return repository.save(employee);
                })
                .orElseGet(() -> {
                    newUser.setId(Math.toIntExact(id));
                    return repository.save(newUser);
                });
    }


    @DeleteMapping(value = "/delete/{id}", produces = "application/json")
    public void deleteUser(@PathVariable Long id) {
        repository.deleteById(id);
    }
}
