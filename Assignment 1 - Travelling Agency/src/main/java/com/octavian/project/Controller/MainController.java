package com.octavian.project.Controller;

import com.octavian.project.Main;
import com.octavian.project.Model.DAO.BookedPackageDao;
import com.octavian.project.Model.DAO.UserDao;
import com.octavian.project.Model.DAO.VacationDestinationDao;
import com.octavian.project.Model.DAO.VacationPackageDao;
import com.octavian.project.Model.Domain.User;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;

public class MainController {
    private static User currentUser;
    private static UserDao userDao;
    private static VacationDestinationDao vacationDestinationDao;
    private static VacationPackageDao vacationPackageDao;
    private static BookedPackageDao bookedPackageDao;

    private static MainController instance;
    private static Stage stage;

    private MainController(UserDao userDao,
                           VacationDestinationDao vacationDestinationDao,
                           VacationPackageDao vacationPackageDao,
                           BookedPackageDao bookedPackageDao) {
        MainController.userDao = userDao;
        MainController.vacationDestinationDao = vacationDestinationDao;
        MainController.vacationPackageDao = vacationPackageDao;
        MainController.bookedPackageDao = bookedPackageDao;
    }

    public static MainController getInstance(UserDao userDao,
                                             VacationDestinationDao vacationDestinationDao,
                                             VacationPackageDao vacationPackageDao,
                                             BookedPackageDao bookedPackageDao) {
        if (instance == null) {
            instance = new MainController(userDao,vacationDestinationDao,vacationPackageDao,bookedPackageDao);
        }
        return instance;
    }

    public static MainController getInstance()
    {
        if(instance!=null)
        {
            return instance;
        }
        else
        {
            UserDao userDao = new UserDao();
            VacationDestinationDao vacationDestinationDao = new VacationDestinationDao();
            VacationPackageDao vacationPackageDao = new VacationPackageDao();
            BookedPackageDao bookedPackageDao = new BookedPackageDao();
            instance = new MainController(userDao,vacationDestinationDao,vacationPackageDao,bookedPackageDao);
            return instance;
        }
    }

    public static void resetController()
    {
        UserDao userDao = new UserDao();
        VacationDestinationDao vacationDestinationDao = new VacationDestinationDao();
        VacationPackageDao vacationPackageDao = new VacationPackageDao();
        BookedPackageDao bookedPackageDao = new BookedPackageDao();
        instance = new MainController(userDao,vacationDestinationDao,vacationPackageDao,bookedPackageDao);
    }

    public static void changeView(Pages page) throws IOException {
        FXMLLoader fxmlLoader;
        Scene scene = null;
        switch (page){
            case AGENCY_PAGE :
                fxmlLoader = new FXMLLoader(Main.class.getResource("View/AgencyView.fxml"));
                scene = new Scene(fxmlLoader.load(), 1000, 600);
                break;
            case USER_PAGE:
                fxmlLoader = new FXMLLoader(Main.class.getResource("View/UserView.fxml"));
                scene = new Scene(fxmlLoader.load(), 1000, 850);
                break;
            case LOGIN_PAGE:
                currentUser = null;
                fxmlLoader = new FXMLLoader(Main.class.getResource("View/Login.fxml"));
                scene = new Scene(fxmlLoader.load(), 1000, 450);
                break;
        }
        stage.setScene(scene);
        stage.show();
    }

    public static Stage getStage() {
        return stage;
    }

    public static void setStage(Stage stage) {
        MainController.stage = stage;
    }

    public static UserDao getUserDao() {
        return userDao;
    }

    public static void setUserDao(UserDao userDao) {
        MainController.userDao = userDao;
    }

    public static VacationDestinationDao getVacationDestinationDao() {
        return vacationDestinationDao;
    }

    public static void setVacationDestinationDao(VacationDestinationDao vacationDestinationDao) {
        MainController.vacationDestinationDao = vacationDestinationDao;
    }

    public static VacationPackageDao getVacationPackageDao() {
        return vacationPackageDao;
    }

    public static void setVacationPackageDao(VacationPackageDao vacationPackageDao) {
        MainController.vacationPackageDao = vacationPackageDao;
    }

    public static BookedPackageDao getBookedPackageDao() {
        return bookedPackageDao;
    }

    public static void setBookedPackageDao(BookedPackageDao bookedPackageDao) {
        MainController.bookedPackageDao = bookedPackageDao;
    }

    public static User getCurrentUser() {
        return currentUser;
    }

    public static void setCurrentUser(User currentUser) {
        MainController.currentUser = currentUser;
    }
}
