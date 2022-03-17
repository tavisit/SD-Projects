package com.octavian.project;

import com.octavian.project.Controller.MainController;
import com.octavian.project.Controller.Pages;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;

public class Main extends Application {

    @Override
    public void start(Stage stage) throws IOException {
        MainController.getInstance();
        MainController.setStage(stage);
        MainController.changeView(Pages.LOGIN_PAGE);
    }

    public static void main(String[] args) {
        launch();
    }
}