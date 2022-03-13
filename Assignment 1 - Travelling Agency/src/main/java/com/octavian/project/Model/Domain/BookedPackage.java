package com.octavian.project.Model.Domain;

public class BookedPackage {
    private int id;
    private int packageID;
    private int userID;

    public BookedPackage(int id, int packageID, int userID) {
        this.id = id;
        this.packageID = packageID;
        this.userID = userID;
    }
    public BookedPackage(int id) {
        this.id = id;
    }
    public BookedPackage() {}


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPackageID() {
        return packageID;
    }

    public void setPackageID(int packageID) {
        this.packageID = packageID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }
}
