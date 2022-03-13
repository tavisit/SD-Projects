package com.octavian.project.Model.DAO;

import com.octavian.project.Model.Domain.VacationDestination;
import com.octavian.project.Model.Domain.VacationPackage;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class VacationPackageDao implements Dao<VacationPackage> {

    private List<VacationPackage> vacationPackages = new ArrayList<VacationPackage>();

    public List<VacationPackage> getVacationPackages() {
        return vacationPackages;
    }

    public void setVacationPackages(List<VacationPackage> vacationPackages) {
        this.vacationPackages = vacationPackages;
    }

    @Override
    public VacationPackage getById(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM vacationpackages WHERE id=?");
            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                VacationPackage vacationPackage = new VacationPackage(
                        rs.getInt("id"),
                        rs.getInt("vacationlocation"),
                        rs.getInt("price"),
                        rs.getInt("numberOfPeople"),
                        rs.getString("details"),
                        rs.getDate("startDate"),
                        rs.getDate("endDate"),
                        rs.getInt("status")
                        );

                return vacationPackage;
            } else {
                return null;
            }
        } catch (SQLException e) {
            // e.printStackTrace();
            throw new RuntimeException(e);
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
        }
    }

    @Override
    public List<VacationPackage> getAll() {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM vacationpackages ORDER BY id");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                VacationPackage vacationPackage = new VacationPackage(
                        rs.getInt("id"),
                        rs.getInt("vacationlocation"),
                        rs.getInt("price"),
                        rs.getInt("numberOfPeople"),
                        rs.getString("details"),
                        rs.getDate("startDate"),
                        rs.getDate("endDate"),
                        rs.getInt("status")
                );
                vacationPackages.add(vacationPackage);
            }
        } catch (SQLException e) {
            // e.printStackTrace();
            return null;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
        }

        return vacationPackages;
    }

    @Override
    public int save(VacationPackage vacationPackage) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("INSERT INTO vacationpackages(vacationlocation,price,numberOfPeople,details,startDate,endDate,status) VALUES(?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, vacationPackage.getVacationID());
            stmt.setInt(2, vacationPackage.getPrice());
            stmt.setInt(3, vacationPackage.getNumberOfPeople());
            stmt.setString(4, vacationPackage.getDetails());
            stmt.setDate(5, (Date) vacationPackage.getStartDate());
            stmt.setDate(6, (Date) vacationPackage.getEndDate());
            stmt.setInt(7, vacationPackage.getStatus());

            int result = stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                vacationPackage.setId(rs.getInt(1));
            }
            return result;
        } catch (SQLException e) {
            // e.printStackTrace();
            return -1;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
            vacationPackages.add(vacationPackage);
        }
    }

    @Override
    public int update(VacationPackage vacationPackage) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("UPDATE vacationpackages SET vacationlocation=?,price=?,numberOfPeople=?,details=?,startDate=?,endDate=?,status=? WHERE id=?");
            stmt.setInt(1, vacationPackage.getVacationID());
            stmt.setInt(2, vacationPackage.getPrice());
            stmt.setInt(3, vacationPackage.getNumberOfPeople());
            stmt.setString(4, vacationPackage.getDetails());
            stmt.setDate(5, (Date) vacationPackage.getStartDate());
            stmt.setDate(6, (Date) vacationPackage.getEndDate());
            stmt.setInt(7, vacationPackage.getStatus());
            stmt.setInt(8, vacationPackage.getId());
            return stmt.executeUpdate();
        } catch (SQLException e) {
            // e.printStackTrace();
            return -1;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
            vacationPackages.set(vacationPackages.indexOf(vacationPackage),vacationPackage);
        }
    }


    @Override
    public int delete(VacationPackage vacationPackage) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement( "DELETE FROM vacationpackages WHERE id=?");
            stmt.setInt(1, vacationPackage.getId());

            return stmt.executeUpdate();
        } catch (SQLException e) {
            // e.printStackTrace();
            return -1;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
            vacationPackages.remove(vacationPackage);
        }
    }
}
