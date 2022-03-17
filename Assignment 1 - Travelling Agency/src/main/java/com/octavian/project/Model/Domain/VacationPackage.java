package com.octavian.project.Model.Domain;

import java.sql.Date;

public class VacationPackage implements Comparable{
    private int id;
    private int vacationID;
    private int price;
    private int numberOfPeople;
    private String details;
    private Date startDate;
    private Date endDate;
    /*
    * 0 -> NOT_BOOKED
    * 1 -> BOOKED
    * 2 -> IN_PROGRESS
    * */
    private int status;

    public VacationPackage(int id, int vacationID, int price, int numberOfPeople, String details, Date startDate, Date endDate, int status) {
        this.id = id;
        this.vacationID = vacationID;
        this.price = price;
        this.numberOfPeople = numberOfPeople;
        this.details = details;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }
    public VacationPackage(int id) {
        this.id = id;
    }
    public VacationPackage() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVacationID() {
        return vacationID;
    }

    public void setVacationID(int vacationID) {
        this.vacationID = vacationID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(int numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStatusString()
    {
        switch (status)
        {
            case 0:
                return "Not booked";
            case 1:
                return "Fully booked";
            case 2:
                return "In progress";
        }
        return "";
    }
    @Override
    public int compareTo(Object object) {
        Date startCompare=((VacationPackage)object).getStartDate();
        Date endCompare=((VacationPackage)object).getStartDate();
        /* For Ascending order*/
        return this.endDate.compareTo(endCompare);
    }
}
