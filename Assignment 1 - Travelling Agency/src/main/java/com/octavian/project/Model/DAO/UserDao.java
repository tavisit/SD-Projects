package com.octavian.project.Model.DAO;

import com.octavian.project.Model.Domain.User;
import com.octavian.project.Model.Domain.VacationPackage;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao implements Dao<User>{
    private List<User> users = new ArrayList<>();

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    @Override
    public User getById(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM users WHERE id=?");
            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                User user = new User(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getInt("userRole"));

                return user;
            } else {
                return null;
            }
        } catch (SQLException e) {
            // e.printStackTrace();
            return null;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
        }
    }

    public User getByEmailAndPassword(String username,String password) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            stmt.setString(1, username);
            stmt.setString(2, ConnectionDB.encryptPassword(password));

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                User user = new User(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getInt("userRole"));

                return user;
            } else {
                return null;
            }
        } catch (SQLException e) {
            // e.printStackTrace();
            return null;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
        }
    }

    @Override
    public List<User> getAll() {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM users ORDER BY id");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                User user = new User(rs.getInt("id"));
                user.setName(rs.getString("Name"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getInt("userRole"));
                users.add(user);
            }
        } catch (SQLException e) {
            // e.printStackTrace();
            return null;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
        }

        return users;
    }

    @Override
    public int save(User user) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("INSERT INTO users(name, username, password, userRole) VALUES(?, ?, ?,?)", Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, ConnectionDB.encryptPassword(user.getPassword()));
            stmt.setInt(4, user.getRole());

            int result = stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                user.setId(rs.getInt(1));
            }
            return result;
        } catch (SQLException e) {
            // e.printStackTrace();
            return -1;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
            users.add(user);
        }
    }

    @Override
    public int update(User user) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("UPDATE users SET name=?, username=?, password=? WHERE id=?");
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, ConnectionDB.encryptPassword(user.getPassword()));
            stmt.setInt(4, user.getId());
            return stmt.executeUpdate();
        } catch (SQLException e) {
            // e.printStackTrace();
            return -1;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
            users.set(findIndexOfObjectInList(user),user);
        }
    }

    @Override
    public int delete(User user) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement( "DELETE FROM users WHERE id=?");
            stmt.setInt(1, user.getId());

            return stmt.executeUpdate();
        } catch (SQLException e) {
            // e.printStackTrace();
            return -1;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
            users.remove(users.get(findIndexOfObjectInList(user)));
        }
    }

    @Override
    public int findIndexOfObjectInList(User target) {
        int index = 0;
        for (User obj : users) {
            if(target.getId() == obj.getId())
                return index;
            index++;
        }
        return -1;
    }
}
