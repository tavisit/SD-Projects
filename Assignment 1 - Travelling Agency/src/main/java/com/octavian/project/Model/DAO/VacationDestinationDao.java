package com.octavian.project.Model.DAO;

import com.octavian.project.Model.Domain.User;
import com.octavian.project.Model.Domain.VacationDestination;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class VacationDestinationDao implements Dao<VacationDestination>{

    private List<VacationDestination> vacationDestinations = new ArrayList<VacationDestination>();


    public List<VacationDestination> getVacationDestinations() {
        return vacationDestinations;
    }

    public void setVacationDestinations(List<VacationDestination> vacationDestinations) {
        this.vacationDestinations = vacationDestinations;
    }

    @Override
    public VacationDestination getById(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM vacationdestination WHERE id=?");
            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                VacationDestination vacationDestination = new VacationDestination(rs.getInt("id"));
                vacationDestination.setName(rs.getString("name"));
                vacationDestination.setDescription(rs.getString("description"));

                return vacationDestination;
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
    public List<VacationDestination> getAll() {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM vacationdestination ORDER BY id");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                VacationDestination vacationDestination = new VacationDestination(rs.getInt("id"));
                vacationDestination.setName(rs.getString("name"));
                vacationDestination.setDescription(rs.getString("description"));
                vacationDestinations.add(vacationDestination);
            }
        } catch (SQLException e) {
            // e.printStackTrace();
            return null;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
        }

        return vacationDestinations;
    }

    @Override
    public int save(VacationDestination vacationDestination) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("INSERT INTO vacationdestination(name, description) VALUES(?,?)", Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, vacationDestination.getName());
            stmt.setString(2, vacationDestination.getDescription());

            int result = stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                vacationDestination.setId(rs.getInt(1));
            }
            return result;
        } catch (SQLException e) {
            // e.printStackTrace();
            return -1;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
            vacationDestinations.add(vacationDestination);
        }
    }

    @Override
    public int update(VacationDestination vacationDestination) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("UPDATE vacationdestination SET name=?, description=? WHERE id=?");
            stmt.setString(1, vacationDestination.getName());
            stmt.setString(2, vacationDestination.getDescription());
            stmt.setInt(3, vacationDestination.getId());
            return stmt.executeUpdate();
        } catch (SQLException e) {
            // e.printStackTrace();
            return -1;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
            vacationDestinations.set(vacationDestinations.indexOf(vacationDestination),vacationDestination);
        }
    }

    @Override
    public int delete(VacationDestination vacationDestination) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement( "DELETE FROM vacationdestination WHERE id=?");
            stmt.setInt(1, vacationDestination.getId());

            return stmt.executeUpdate();
        } catch (SQLException e) {
            // e.printStackTrace();
            return -1;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
            vacationDestinations.remove(vacationDestination);
        }
    }
}
