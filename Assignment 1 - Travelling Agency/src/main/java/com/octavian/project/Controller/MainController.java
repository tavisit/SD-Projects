package com.octavian.project.Controller;

import com.octavian.project.Model.DAO.BookedPackageDao;
import com.octavian.project.Model.DAO.UserDao;
import com.octavian.project.Model.DAO.VacationDestinationDao;
import com.octavian.project.Model.DAO.VacationPackageDao;
import com.octavian.project.Model.Domain.User;

public class MainController {
    private static User currentUser;
    private static UserDao userDao;
    private static VacationDestinationDao vacationDestinationDao;
    private static VacationPackageDao vacationPackageDao;
    private static BookedPackageDao bookedPackageDao;

    private static MainController instance;

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
