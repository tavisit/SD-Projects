package com.octavian.project;

import com.octavian.project.Controller.MainController;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;

public class Main extends Application {

    @Override
    public void start(Stage stage) throws IOException {
        MainController.getInstance();
        FXMLLoader fxmlLoader = new FXMLLoader(Main.class.getResource("View/Login.fxml"));
        Scene scene = new Scene(fxmlLoader.load(), 1000, 450);
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}