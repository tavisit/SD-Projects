package com.octavian.project.Controller;

import com.octavian.project.Model.Domain.User;
import javafx.fxml.FXML;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;

import java.util.regex.Pattern;

public class LoginController {

    boolean isLogin = true;

    @FXML
    protected Pane loginPane;
    @FXML
    protected Pane registerPane;
    @FXML
    protected Label warningLogin;
    @FXML
    protected TextField loginEmail;
    @FXML
    protected PasswordField loginPassword;
    @FXML
    protected Label warningRegister;
    @FXML
    protected TextField registerName;
    @FXML
    protected TextField registerEmail;
    @FXML
    protected PasswordField registerPassword;
    @FXML
    protected CheckBox isNormalUser;

    @FXML
    protected void login()
    {
        User myUser = MainController.getUserDao().getByEmailAndPassword(loginEmail.getText(),loginPassword.getText());
        if(myUser == null)
        {
            warningLogin.setText("Wrong email and password combination");
            warningLogin.setTextFill(Color.RED);
        }
        else
        {
            MainController.setCurrentUser(myUser);
            try{
                if(myUser.getRole()==0)
                {
                    MainController.changeView(Pages.USER_PAGE);
                }
                else
                {
                    MainController.changeView(Pages.AGENCY_PAGE);
                }
            }catch (Exception ex)
            {
                warningLogin.setText("Something went wrong...");
                warningLogin.setTextFill(Color.RED);

            }
        }
    }

    @FXML
    protected void register()
    {
        String email = registerEmail.getText();
        String password = registerPassword.getText();
        String name = registerName.getText();
        if(checkMail(email) && checkPassword(password) && name.length()>0)
        {
            User myUser = new User(name,email,password,isNormalUser.isSelected());
            int code = MainController.getUserDao().save(myUser);
            if(code==-1)
            {
                warningRegister.setText("Something went wrong, please try again!");
                warningRegister.setTextFill(Color.RED);
            }
            else
            {
                warningRegister.setText("User registered!");
                warningRegister.setTextFill(Color.GREEN);
            }
        }
        else
        {
            warningRegister.setText("Something went wrong, please try again!");
            warningRegister.setTextFill(Color.RED);
        }
    }

    @FXML
    protected void switchBetweenStates() {
        isLogin = !isLogin;
        clearFields();

        if(isLogin)
        {
            loginPane.setVisible(true);
            registerPane.setVisible(false);
        }
        else
        {
            loginPane.setVisible(false);
            registerPane.setVisible(true);
            isNormalUser.setSelected(true);
        }
    }

    @FXML
    protected void closeApplication() {
        System.exit(0);
    }

    private void clearFields()
    {
        loginEmail.setText("");
        loginPassword.setText("");
        registerName.setText("");
        registerEmail.setText("");
        registerPassword.setText("");
        warningLogin.setText("");
        warningRegister.setText("");
    }

    private boolean checkMail(String email)
    {
        String regexPattern = "^(.+)@(\\S+)$";
        return Pattern.compile(regexPattern)
                .matcher(email)
                .matches();
    }
    private boolean checkPassword(String password)
    {
        String regexPattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";

        return Pattern.compile(regexPattern)
                .matcher(password)
                .matches();
    }
}
