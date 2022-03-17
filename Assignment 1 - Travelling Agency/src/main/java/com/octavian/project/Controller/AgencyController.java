package com.octavian.project.Controller;

import com.octavian.project.Model.Domain.VacationDestination;
import com.octavian.project.Model.Domain.VacationPackage;
import javafx.fxml.FXML;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.paint.Color;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Objects;

import static java.time.temporal.ChronoUnit.DAYS;

public class AgencyController {
    @FXML
    protected Label newLocationStatus;
    @FXML
    protected Label newPackageStatus;
    @FXML
    protected Label modifyPackageStatus;
    @FXML
    protected Label deletePackageStatus;

    @FXML
    protected ChoiceBox<String> destinationLocation;
    @FXML
    protected TextField newLocationName;
    @FXML
    protected TextField newLocationDescription;
    @FXML
    protected ChoiceBox<String> newPackageLocationName;
    @FXML
    protected TextField newPackagePrice;
    @FXML
    protected TextField newPackagePeople;
    @FXML
    protected TextField newPackageDetails;
    @FXML
    protected DatePicker newPackageStartDate;
    @FXML
    protected DatePicker newPackageEndDate;
    @FXML
    protected ChoiceBox<String> modifyPackageLocationName;
    @FXML
    protected TextField modifyPackagePrice;
    @FXML
    protected TextField modifyPackagePeople;
    @FXML
    protected TextField modifyPackageDetails;
    @FXML
    protected Label startDateLabel;
    @FXML
    protected Label endDateLabel;
    @FXML
    protected Label statusLabel;


    @FXML
    public void logout() throws IOException {
        MainController.changeView(Pages.LOGIN_PAGE);
    }

    @FXML
    public void saveNewLocation()
    {
        if(Objects.equals(newLocationName.getText(), "") || Objects.equals(newLocationDescription.getText(), ""))
        {
            newLocationStatus.setText("Error");
            newLocationStatus.setTextFill(Color.RED);
            return;
        }
        VacationDestination vacationDestination = new VacationDestination();
        vacationDestination.setName(newLocationName.getText());
        vacationDestination.setDescription(newLocationDescription.getText());
        int statusCode = MainController.getVacationDestinationDao().save(vacationDestination);
        if(statusCode==1)
        {
            newLocationStatus.setText("Done");
            newLocationStatus.setTextFill(Color.GREEN);
            newPackageLocationName.getItems().add(vacationDestination.getName());
        }
        else
        {
            newLocationStatus.setText("Error");
            newLocationStatus.setTextFill(Color.RED);
        }
        clearAll();
    }

    @FXML
    public void saveNewPackage()
    {
        try {
            VacationPackage vacationPackage = new VacationPackage();
            VacationDestination vacationDestinationName =
                    MainController.getVacationDestinationDao().getByName(newPackageLocationName.getValue());
            vacationPackage.setVacationID(vacationDestinationName.getId());
            if (newPackagePrice.getText().equals("")
                    || newPackagePeople.getText().equals("")
                    || newPackageDetails.getText().equals("")
                    || DAYS.between(LocalDate.now(), newPackageStartDate.getValue()) <= 0
                    || DAYS.between(newPackageStartDate.getValue(), newPackageEndDate.getValue()) <= 0) {

                throw new Exception();
            }
            vacationPackage.setPrice(Integer.parseInt(newPackagePrice.getText().replace(" ", "")));
            vacationPackage.setNumberOfPeople(Integer.parseInt(newPackagePeople.getText().replace(" ", "")));
            vacationPackage.setDetails(newPackageDetails.getText());
            vacationPackage.setStartDate(java.sql.Date.valueOf(newPackageStartDate.getValue()));
            vacationPackage.setEndDate(java.sql.Date.valueOf(newPackageEndDate.getValue()));
            MainController.getVacationPackageDao().save(vacationPackage);

            newPackageStatus.setText("Done");
            newPackageStatus.setTextFill(Color.GREEN);
            modifyPackageLocationName.getItems().add(vacationDestinationName.getName());
        }catch (Exception ex) {
            newPackageStatus.setText("Error");
            newPackageStatus.setTextFill(Color.RED);
        }
        clearAll();
    }

    @FXML
    public void populateModifyPackageFields()
    {
        try{
            VacationDestination vacationDestination =
                    MainController.getVacationDestinationDao().getByName(modifyPackageLocationName.getValue());
            VacationPackage vacationPackage = MainController.getVacationPackageDao().getByVacationId(vacationDestination.getId());

            modifyPackageDetails.setText(vacationPackage.getDetails());
            modifyPackagePrice.setText(String.valueOf(vacationPackage.getPrice()));
            modifyPackagePeople.setText(String.valueOf(vacationPackage.getNumberOfPeople()));
            startDateLabel.setText(vacationPackage.getStartDate().toString());
            endDateLabel.setText(vacationPackage.getEndDate().toString());
            this.statusLabel.setText(vacationPackage.getStatusString());
            changePackageStatusColor();

        }catch (Exception exception)
        {
            System.out.println(exception);
        }

    }

    @FXML
    public void deleteDestination()
    {
        String destination = destinationLocation.getSelectionModel().getSelectedItem();
        VacationDestination vacationDestination = MainController.getVacationDestinationDao().getByName(destination);
        MainController.getVacationDestinationDao().delete(vacationDestination);

        clearAll();
    }
    @FXML
    public void updatePackage()
    {
        try {
            if (modifyPackagePrice.getText().equals("")
                    || modifyPackagePeople.getText().equals("")
                    || modifyPackageDetails.getText().equals("")){
                throw new Exception();
            }
            String destination = modifyPackageLocationName.getSelectionModel().getSelectedItem();
            VacationDestination vacationDestination = MainController.getVacationDestinationDao().getByName(destination);
            VacationPackage vacationPackage = MainController.getVacationPackageDao().getByVacationId(vacationDestination.getId());
            vacationPackage.setPrice(Integer.parseInt(modifyPackagePrice.getText().replace(" ", "")));
            vacationPackage.setNumberOfPeople(Integer.parseInt(modifyPackagePeople.getText().replace(" ", "")));
            vacationPackage.setDetails(modifyPackageDetails.getText());
            MainController.getVacationPackageDao().update(vacationPackage);

            modifyPackageStatus.setText("Done");
            modifyPackageStatus.setTextFill(Color.GREEN);
        }catch (Exception ex) {
            modifyPackageStatus.setText("Error");
            modifyPackageStatus.setTextFill(Color.RED);
        }
        clearAll();
    }
    @FXML
    public void deletePackage()
    {
        String destination = modifyPackageLocationName.getSelectionModel().getSelectedItem();
        VacationDestination vacationDestination = MainController.getVacationDestinationDao().getByName(destination);
        VacationPackage vacationPackage = MainController.getVacationPackageDao().getByVacationId(vacationDestination.getId());
        MainController.getVacationPackageDao().delete(vacationPackage);

        clearAll();
    }

    @FXML
    public void initializeComboBoxes()
    {
        if(newPackageLocationName.getItems().isEmpty())
        {
            MainController.getVacationDestinationDao().getVacationDestinations().clear();
            MainController.getVacationDestinationDao().getAll();
            MainController.getVacationDestinationDao().getVacationDestinations().forEach(
                    vacationDestination -> {
                        if(MainController.getVacationPackageDao().getByVacationId(vacationDestination.getId())==null)
                            newPackageLocationName.getItems().add(vacationDestination.getName());
                    });

        }
        if(destinationLocation.getItems().isEmpty())
        {
            MainController.getVacationDestinationDao().getVacationDestinations().clear();
            MainController.getVacationDestinationDao().getAll();
            MainController.getVacationDestinationDao().getVacationDestinations().forEach(
                    vacationDestination -> destinationLocation.getItems().add(vacationDestination.getName()));

        }
        if(modifyPackageLocationName.getItems().isEmpty())
        {
            MainController.getVacationPackageDao().getVacationPackages().clear();
            MainController.getVacationPackageDao().getAll();
            MainController.getVacationPackageDao().getVacationPackages().forEach(
                    vacationPackage -> modifyPackageLocationName.getItems().add(
                            MainController.getVacationDestinationDao().getById(vacationPackage.getVacationID()).getName()));
        }

    }

    private void clearAll(){

        newPackageLocationName.getItems().clear();
        destinationLocation.getItems().clear();
        modifyPackageLocationName.getItems().clear();

        this.newPackageStartDate.setValue(null);
        this.newPackageEndDate.setValue(null);

        this.endDateLabel.setText("");
        this.startDateLabel.setText("");
        this.statusLabel.setText("");

        this.newLocationName.setText("");
        this.newLocationDescription.setText("");
        this.newPackagePrice.setText("");
        this.newPackagePeople.setText("");
        this.newPackageDetails.setText("");
        this.modifyPackagePrice.setText("");
        this.modifyPackagePeople.setText("");
        this.modifyPackageDetails.setText("");

        initializeComboBoxes();
    }

    public void changePackageStatusColor()
    {
        switch (statusLabel.getText())
        {
            case "Not booked":
                statusLabel.setTextFill(Color.GREEN);
                break;
            case "Fully booked":
                statusLabel.setTextFill(Color.AQUAMARINE);
                break;
            case "In progress":
                statusLabel.setTextFill(Color.RED);
                break;
        }
    }
}
