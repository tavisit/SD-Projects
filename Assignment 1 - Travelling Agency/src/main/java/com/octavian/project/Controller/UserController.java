package com.octavian.project.Controller;

import com.octavian.project.Model.Domain.BookedPackage;
import com.octavian.project.Model.Domain.VacationPackage;
import javafx.fxml.FXML;
import javafx.scene.control.ChoiceBox;
import javafx.scene.text.Text;
import javafx.util.Pair;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;

public class UserController {

    @FXML
    protected ChoiceBox<String> priceRange;
    @FXML
    protected ChoiceBox<String> locationChoice;
    @FXML
    protected ChoiceBox<String> locationAvailableChoice;
    @FXML
    protected Text myVacationsText;


    @FXML
    public void initializeChoiceboxex() {
        priceRange.getItems().add("None");
        priceRange.getItems().add("under 100");
        priceRange.getItems().add("100-500");
        priceRange.getItems().add("500-1000");
        priceRange.getItems().add("1000+");
        priceRange.getSelectionModel().select(0);

        locationChoice.getItems().add("None");
        MainController.getVacationPackageDao().getVacationPackages().clear();
        MainController.getVacationPackageDao().getAll();
        MainController.getVacationPackageDao().getVacationPackages().forEach(
                vacationPackage -> locationChoice.getItems().add(
                        MainController.getVacationDestinationDao().getById(vacationPackage.getVacationID()).getName()));
        locationChoice.getSelectionModel().select(0);

        submitSearch();

        myVacationsText.setText("");
        MainController.getBookedPackageDao().getBookedPackages().clear();
        MainController.getBookedPackageDao().getAll();
        MainController.getBookedPackageDao().getBookedPackages().forEach(this::appendTextToVacation);
    }

    private void appendTextToVacation(BookedPackage bookedPackage)
    {

        if(bookedPackage.getUserID()==MainController.getCurrentUser().getId()){
            String currentVacation="";
            VacationPackage vacationPackage=MainController.getVacationPackageDao().getById(bookedPackage.getPackageID());
            currentVacation+="-- Location: "+MainController.getVacationDestinationDao().getById(vacationPackage.getVacationID()).getName();
            currentVacation+="\n   Details: "+vacationPackage.getDetails();
            currentVacation+="\n   Price: "+vacationPackage.getPrice();
            currentVacation+="\n   From: "+vacationPackage.getStartDate();
            currentVacation+="\n   To: "+vacationPackage.getEndDate();
            currentVacation+="\n   Status: "+vacationPackage.getStatusString();
            myVacationsText.setText(myVacationsText.getText()+currentVacation+"\n");
        }
    }

    @FXML
    public void logout() throws IOException {
        MainController.changeView(Pages.LOGIN_PAGE);
    }

    @FXML
    public void submitSearch() {
        locationAvailableChoice.getItems().clear();
        locationAvailableChoice.getItems().add("None");

        MainController.getVacationPackageDao().getVacationPackages().clear();
        MainController.getVacationPackageDao().getAll();

        MainController.getVacationPackageDao().getVacationPackages().forEach(
                vacationPackage -> {
                    if( parseFilterLocation(MainController.getVacationDestinationDao().getById(vacationPackage.getVacationID()).getName())
                    && parseFilterPrice(String.valueOf(vacationPackage.getPrice()))){
                        String currentVacation = "";
                        currentVacation += "Location: " +MainController.getVacationDestinationDao().getById(vacationPackage.getVacationID()).getName();
                        currentVacation += ", Details: " + vacationPackage.getDetails();
                        currentVacation += ", Price: " + vacationPackage.getPrice();
                        currentVacation += ", From: " + vacationPackage.getStartDate();
                        currentVacation += ", To: " + vacationPackage.getEndDate();
                        currentVacation += ", Status: " + vacationPackage.getStatusString();
                        locationAvailableChoice.getItems().add(currentVacation);
                }}
        );

    }

    public boolean parseFilterLocation(String location){
        return locationChoice.getSelectionModel().getSelectedItem().equals("None") ||
                locationChoice.getSelectionModel().getSelectedItem().equals(location);
    }

    public boolean parseFilterPrice(String price){
        if(priceRange.getSelectionModel().getSelectedItem().equals("None")) return true;
        int actualPrice = Integer.parseInt(price);
        Pair<Integer,Integer> priceRangePair = filterPrice(priceRange.getSelectionModel().getSelectedItem());
        if(priceRangePair.getKey() <= actualPrice && priceRangePair.getValue() >= actualPrice)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public Pair<Integer,Integer> filterPrice(String priceTag)
    {
        switch (priceTag)
        {
            case "None":
                return new Pair<Integer,Integer>(0,Integer.MAX_VALUE);
            case "under 100":
                return new Pair<Integer,Integer>(0,100);
            case "100-500":
                return new Pair<Integer,Integer>(101,500);
            case "500-1000":
                return new Pair<Integer,Integer>(501,1000);
            case "1000+":
                return new Pair<Integer,Integer>(1001,Integer.MAX_VALUE);
        }
        return null;
    }

    @FXML
    public void bookVacation(){
        String location = locationAvailableChoice.getSelectionModel().getSelectedItem();

    }
}
