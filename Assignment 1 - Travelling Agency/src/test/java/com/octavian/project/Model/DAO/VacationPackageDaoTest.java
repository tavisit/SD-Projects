package com.octavian.project.Model.DAO;

import com.octavian.project.Model.Domain.VacationDestination;
import com.octavian.project.Model.Domain.VacationPackage;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Random;

public class VacationPackageDaoTest {

    @Test
    void insertVacationPackage()
    {
        VacationDestination testDestination = new VacationDestination();
        Random random = new Random();
        testDestination.setName("test name" + random.nextInt());
        testDestination.setDescription("123456789");

        VacationDestinationDao vacationDestinationDao = new VacationDestinationDao();
        vacationDestinationDao.save(testDestination);

        VacationPackage vacationPackage = new VacationPackage();
        vacationPackage.setVacationID(testDestination.getId());
        vacationPackage.setPrice(100);
        vacationPackage.setNumberOfPeople(100);
        vacationPackage.setDetails("Fun!!!");
        vacationPackage.setStartDate(new java.sql.Date(1));
        vacationPackage.setEndDate(new java.sql.Date(2));

        VacationPackageDao packageDao = new VacationPackageDao();
        packageDao.save(vacationPackage);
        List<VacationPackage> testPackages = packageDao.getAll();
        VacationPackage testPackageSingle = packageDao.getById(testPackages.get(0).getId());

        assert(testPackageSingle.getVacationID() == (vacationPackage.getVacationID()));
        assert(testPackageSingle.getPrice() == (vacationPackage.getPrice()));
        assert(testPackageSingle.getStartDate().toString().equals(vacationPackage.getStartDate().toString()));
        packageDao.delete(testPackageSingle);
        vacationDestinationDao.delete(testDestination);

        testPackages.clear();
    }

    @Test
    void insertVacationPackageButFalseDestination()
    {
        VacationPackage vacationPackage = new VacationPackage();
        vacationPackage.setVacationID(0);
        vacationPackage.setPrice(100);
        vacationPackage.setNumberOfPeople(100);
        vacationPackage.setDetails("Fun!!!");
        vacationPackage.setStartDate(new java.sql.Date(1));
        vacationPackage.setEndDate(new java.sql.Date(2));

        VacationPackageDao packageDao = new VacationPackageDao();
        packageDao.save(vacationPackage);
        List<VacationPackage> testPackages = packageDao.getAll();
        VacationPackage testPackageSingle = packageDao.getById(vacationPackage.getId());

        assert(testPackageSingle == null);
        packageDao.delete(vacationPackage);
        testPackages.clear();
    }

    @Test
    void updatePackage()
    {
        VacationDestination testDestination = new VacationDestination();
        Random random = new Random();
        testDestination.setName("test name" + random.nextInt());
        testDestination.setDescription("123456789");

        VacationDestinationDao vacationDestinationDao = new VacationDestinationDao();
        vacationDestinationDao.save(testDestination);

        VacationPackage vacationPackage = new VacationPackage();
        vacationPackage.setVacationID(testDestination.getId());
        vacationPackage.setPrice(100);
        vacationPackage.setNumberOfPeople(100);
        vacationPackage.setDetails("Fun!!!");
        vacationPackage.setStartDate(new java.sql.Date(1));
        vacationPackage.setEndDate(new java.sql.Date(2));

        VacationPackageDao packageDao = new VacationPackageDao();
        packageDao.save(vacationPackage);
        vacationPackage.setPrice(200);
        packageDao.update(vacationPackage);

        List<VacationPackage> testPackages = packageDao.getAll();
        VacationPackage testPackageSingle = packageDao.getById(vacationPackage.getId());

        assert(testPackageSingle.getVacationID() == (vacationPackage.getVacationID()));
        assert(testPackageSingle.getPrice() == (vacationPackage.getPrice()));
        assert(testPackageSingle.getStartDate().toString().equals(vacationPackage.getStartDate().toString()));
        packageDao.delete(testPackageSingle);
        packageDao.delete(vacationPackage);
        vacationDestinationDao.delete(testDestination);
        vacationDestinationDao.delete(testDestination);

        testPackages.clear();
    }
}
