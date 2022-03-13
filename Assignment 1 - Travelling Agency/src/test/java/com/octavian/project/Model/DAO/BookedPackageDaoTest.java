package com.octavian.project.Model.DAO;

import com.octavian.project.Model.Domain.BookedPackage;
import com.octavian.project.Model.Domain.User;
import com.octavian.project.Model.Domain.VacationDestination;
import com.octavian.project.Model.Domain.VacationPackage;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Random;

public class BookedPackageDaoTest {

    @Test
    void insertVacationPackage()
    {
        VacationDestination testDestination = new VacationDestination();
        Random random = new Random();
        testDestination.setName("test name" + random.nextInt());
        testDestination.setDescription("123456789");

        VacationDestinationDao vacationDestinationDao = new VacationDestinationDao();
        vacationDestinationDao.save(testDestination);
        List<VacationDestination> vacationDestinationsTest = vacationDestinationDao.getAll();
        VacationDestination testDestinationsSingle = vacationDestinationDao.getById(testDestination.getId());

        VacationPackage vacationPackage = new VacationPackage();
        vacationPackage.setVacationID(testDestinationsSingle.getId());
        vacationPackage.setPrice(100);
        vacationPackage.setNumberOfPeople(100);
        vacationPackage.setDetails("Fun!!!");
        vacationPackage.setStartDate(new java.sql.Date(1));
        vacationPackage.setEndDate(new java.sql.Date(2));

        VacationPackageDao packageDao = new VacationPackageDao();
        packageDao.save(vacationPackage);
        List<VacationPackage> testPackages = packageDao.getAll();
        VacationPackage testPackageSingle = packageDao.getById(vacationPackage.getId());

        User testUser = new User();
        testUser.setName("test name");
        testUser.setPassword("123456789");
        testUser.setUsername("test@test.com"+ random.nextInt());
        testUser.setRole(0);

        UserDao userDao = new UserDao();
        userDao.save(testUser);
        List<User> testUsers = userDao.getAll();
        User testUserSingle = userDao.getById(testUser.getId());

        BookedPackage bookedPackage = new BookedPackage();
        bookedPackage.setPackageID(testPackageSingle.getId());
        bookedPackage.setUserID(testUserSingle.getId());

        BookedPackageDao bookedPackageDao = new BookedPackageDao();
        bookedPackageDao.save(bookedPackage);


        assert(bookedPackageDao.getById(bookedPackage.getId()).getPackageID() == bookedPackage.getPackageID());
        assert(bookedPackageDao.getById(bookedPackage.getId()).getUserID() == bookedPackage.getUserID());

        bookedPackageDao.delete(bookedPackage);
        userDao.delete(testUser);
        packageDao.delete(vacationPackage);
        vacationDestinationDao.delete(testDestination);
    }

    @Test
    void insertVacationPackageButFalseDestination()
    {
        VacationDestination testDestination = new VacationDestination();
        Random random = new Random();
        testDestination.setName("test name" + random.nextInt());
        testDestination.setDescription("123456789");

        VacationDestinationDao vacationDestinationDao = new VacationDestinationDao();
        vacationDestinationDao.save(testDestination);
        List<VacationDestination> vacationDestinationsTest = vacationDestinationDao.getAll();
        VacationDestination testDestinationsSingle = vacationDestinationDao.getById(testDestination.getId());

        VacationPackage vacationPackage = new VacationPackage();
        vacationPackage.setVacationID(testDestinationsSingle.getId());
        vacationPackage.setPrice(100);
        vacationPackage.setNumberOfPeople(100);
        vacationPackage.setDetails("Fun!!!");
        vacationPackage.setStartDate(new java.sql.Date(1));
        vacationPackage.setEndDate(new java.sql.Date(2));

        VacationPackageDao packageDao = new VacationPackageDao();
        packageDao.save(vacationPackage);
        List<VacationPackage> testPackages = packageDao.getAll();
        VacationPackage testPackageSingle = packageDao.getById(vacationPackage.getId());

        User testUser = new User();
        testUser.setName("test name");
        testUser.setPassword("123456789");
        testUser.setUsername("test@test.com"+ random.nextInt());
        testUser.setRole(0);

        UserDao userDao = new UserDao();
        userDao.save(testUser);
        List<User> testUsers = userDao.getAll();
        User testUserSingle = userDao.getById(testUser.getId());

        BookedPackage bookedPackage = new BookedPackage();
        bookedPackage.setPackageID(testPackageSingle.getId()* -1);
        bookedPackage.setUserID(testUserSingle.getId());

        BookedPackageDao bookedPackageDao = new BookedPackageDao();
        bookedPackageDao.save(bookedPackage);


        assert(bookedPackageDao.getById(bookedPackage.getId()) == null);

        bookedPackageDao.delete(bookedPackage);
        userDao.delete(testUser);
        packageDao.delete(vacationPackage);
        vacationDestinationDao.delete(testDestination);
    }

    @Test
    void insertVacationPackageButFalseUser()
    {
        VacationDestination testDestination = new VacationDestination();
        Random random = new Random();
        testDestination.setName("test name" + random.nextInt());
        testDestination.setDescription("123456789");

        VacationDestinationDao vacationDestinationDao = new VacationDestinationDao();
        vacationDestinationDao.save(testDestination);
        List<VacationDestination> vacationDestinationsTest = vacationDestinationDao.getAll();
        VacationDestination testDestinationsSingle = vacationDestinationDao.getById(testDestination.getId());

        VacationPackage vacationPackage = new VacationPackage();
        vacationPackage.setVacationID(testDestinationsSingle.getId());
        vacationPackage.setPrice(100);
        vacationPackage.setNumberOfPeople(100);
        vacationPackage.setDetails("Fun!!!");
        vacationPackage.setStartDate(new java.sql.Date(1));
        vacationPackage.setEndDate(new java.sql.Date(2));

        VacationPackageDao packageDao = new VacationPackageDao();
        packageDao.save(vacationPackage);
        List<VacationPackage> testPackages = packageDao.getAll();
        VacationPackage testPackageSingle = packageDao.getById(vacationPackage.getId());

        User testUser = new User();
        testUser.setName("test name");
        testUser.setPassword("123456789");
        testUser.setUsername("test@test.com"+ random.nextInt());
        testUser.setRole(0);

        UserDao userDao = new UserDao();
        userDao.save(testUser);
        List<User> testUsers = userDao.getAll();
        User testUserSingle = userDao.getById(testUser.getId());

        BookedPackage bookedPackage = new BookedPackage();
        bookedPackage.setPackageID(testPackageSingle.getId());
        bookedPackage.setUserID(testUserSingle.getId()* -1);

        BookedPackageDao bookedPackageDao = new BookedPackageDao();
        bookedPackageDao.save(bookedPackage);


        assert(bookedPackageDao.getById(bookedPackage.getId()) == null);

        bookedPackageDao.delete(bookedPackage);
        userDao.delete(testUser);
        packageDao.delete(vacationPackage);
        vacationDestinationDao.delete(testDestination);
    }

}
