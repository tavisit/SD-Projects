package com.octavian.project;

import com.octavian.project.Controller.MainController;
import org.junit.jupiter.api.Test;

class MainControllerTest {

    @Test
    void testGetInstance() {
        assert(MainController.getInstance()!=null);
    }

    @Test
    void getUserDao() {
        MainController.getInstance();
        assert(MainController.getUserDao()!=null);
    }

    @Test
    void getVacationDestinationDao() {
        MainController.getInstance();
        assert(MainController.getVacationDestinationDao()!=null);
    }

    @Test
    void getVacationPackageDao() {
        MainController.getInstance();
        assert(MainController.getVacationPackageDao()!=null);
    }

    @Test
    void getBookedPackageDao() {
        MainController.getInstance();
        assert(MainController.getBookedPackageDao()!=null);
    }
}