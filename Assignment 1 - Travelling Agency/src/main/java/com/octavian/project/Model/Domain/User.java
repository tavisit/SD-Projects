package com.octavian.project.Model.Domain;

public class User {
    private int id;

    private String name;
    private String username;
    private String password;
    private int userRole;

    public User(int id, String name, String username, String password, int role) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.password = password;
        this.userRole = role;
    }

    public User(String name, String username, String password, int role) {
        this.name = name;
        this.username = username;
        this.password = password;
        this.userRole = role;
    }
    public User(String name, String username, String password, boolean role) {
        this.name = name;
        this.username = username;
        this.password = password;
        this.userRole = role ?0:1;
    }
    public User(int id) {
        this.id = id;
    }
    public User() {
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", role=" + userRole +
                "}\n";
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return userRole;
    }

    public void setRole(int role) {
        this.userRole = role;
    }

    public void setId(int id) {
        this.id = id;
    }
}
