package com.octavian.project.Model.DAO;

import com.octavian.project.Model.Domain.BookedPackage;
import com.octavian.project.Model.Domain.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class BookedPackageDao implements Dao<BookedPackage>{

    private List<BookedPackage> bookedPackages = new ArrayList<BookedPackage>();

    public List<BookedPackage> getBookedPackages() {
        return bookedPackages;
    }

    public void setBookedPackages(List<BookedPackage> bookedPackages) {
        this.bookedPackages = bookedPackages;
    }

    @Override
    public BookedPackage getById(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM bookedpackages WHERE id=?");
            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                BookedPackage bookedPackage = new BookedPackage(rs.getInt("id"));
                bookedPackage.setPackageID(rs.getInt("packageID"));
                bookedPackage.setUserID(rs.getInt("userID"));

                return bookedPackage;
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
    public List<BookedPackage> getAll() {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("SELECT * FROM bookedpackages ORDER BY id");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                BookedPackage bookedPackage = new BookedPackage(rs.getInt("id"));
                bookedPackage.setPackageID(rs.getInt("packageID"));
                bookedPackage.setUserID(rs.getInt("userID"));
                bookedPackages.add(bookedPackage);
            }
        } catch (SQLException e) {
            // e.printStackTrace();
            return null;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
        }

        return bookedPackages;
    }

    @Override
    public int save(BookedPackage bookedPackage) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("INSERT INTO bookedpackages(packageID, userID) VALUES(?,?)", Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, bookedPackage.getPackageID());
            stmt.setInt(2, bookedPackage.getUserID());

            int result = stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                bookedPackage.setId(rs.getInt(1));
            }
            return result;
        } catch (SQLException e) {
            // e.printStackTrace();
            return -1;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
            bookedPackages.add(bookedPackage);
        }
    }

    @Override
    public int update(BookedPackage bookedPackage) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement("UPDATE bookedpackages SET packageID=?, userID=? WHERE id=?");
            stmt.setInt(1, bookedPackage.getPackageID());
            stmt.setInt(2, bookedPackage.getUserID());
            stmt.setInt(3, bookedPackage.getId());
            return stmt.executeUpdate();
        } catch (SQLException e) {
            // e.printStackTrace();
            return -1;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
            bookedPackages.set(findIndexOfObjectInList(bookedPackage),bookedPackage);
        }
    }

    @Override
    public int delete(BookedPackage bookedPackage) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement( "DELETE FROM bookedpackages WHERE id=?");
            stmt.setInt(1, bookedPackage.getId());

            return stmt.executeUpdate();
        } catch (SQLException e) {
            // e.printStackTrace();
            return -1;
        } finally {
            ConnectionDB.close(stmt);
            ConnectionDB.close(conn);
            bookedPackages.remove(bookedPackages.get(findIndexOfObjectInList(bookedPackage)));
        }
    }

    @Override
    public int findIndexOfObjectInList(BookedPackage target) {
        int index = 0;
        for (BookedPackage obj : bookedPackages) {
            if(target.getId() == obj.getId())
                return index;
            index++;
        }
        return -1;
    }
}
