package com.octavian.project.Controller;

import javafx.fxml.FXML;

import java.io.IOException;

public class UserController {

    @FXML
    public void logout() throws IOException {
        MainController.changeView(Pages.LOGIN_PAGE);
    }
}
