package com.octavian.project.Model.DAO;

import com.octavian.project.Model.Domain.VacationDestination;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class VacationDestinationDaoTest {

    @Test
    void insertDestination()
    {
        VacationDestination testDestination = new VacationDestination();
        Random random = new Random();
        testDestination.setName("test name" + random.nextInt());
        testDestination.setDescription("123456789");

        VacationDestinationDao vacationDestinationDao = new VacationDestinationDao();
        vacationDestinationDao.save(testDestination);
        List<VacationDestination> vacationDestinationsTest = vacationDestinationDao.getAll();
        VacationDestination testDestinationsSingle = vacationDestinationDao.getById(testDestination.getId());

        assert(testDestinationsSingle.getName().equals(testDestination.getName()));
        assert(testDestinationsSingle.getDescription().equals(testDestination.getDescription()));
        vacationDestinationDao.delete(testDestinationsSingle);

        vacationDestinationsTest.clear();
    }
    @Test
    void updateDestination()
    {
        VacationDestination testDestination = new VacationDestination();
        Random random = new Random();
        testDestination.setName("test name" + random.nextInt());
        testDestination.setDescription("123456789");

        VacationDestinationDao vacationDestinationDao = new VacationDestinationDao();
        vacationDestinationDao.save(testDestination);

        vacationDestinationDao.getVacationDestinations().get(0).setDescription("testtest");
        vacationDestinationDao.update(vacationDestinationDao.getVacationDestinations().get(0));
        testDestination.setDescription("testtest");

        assert(vacationDestinationDao.getVacationDestinations().get(0).getName().equals(testDestination.getName()));
        assert(vacationDestinationDao.getVacationDestinations().get(0).getDescription().equals(testDestination.getDescription()));
        vacationDestinationDao.delete(vacationDestinationDao.getVacationDestinations().get(0));
    }

    @Test
    void insertMultipleDestinations()
    {
        List<VacationDestination> testDestinations = new ArrayList<VacationDestination>();
        VacationDestinationDao vacationDao = new VacationDestinationDao();
        Random rand = new Random();
        for(int i=0;i<10;i++)
        {
            VacationDestination testVacation = new VacationDestination();
            Random random = new Random();
            testVacation.setName("test name" + i+ random.nextInt());
            testVacation.setDescription("123456789" + i);
            testDestinations.add(testVacation);
            vacationDao.save(testVacation);
        }
        vacationDao.getAll();
        for (int i = 0; i < 10; i++) {
            assert (vacationDao.getVacationDestinations().get(vacationDao.getVacationDestinations().indexOf(testDestinations.get(i))).getName().equals(testDestinations.get(i).getName()));
            assert (vacationDao.getVacationDestinations().get(vacationDao.getVacationDestinations().indexOf(testDestinations.get(i))).getDescription().equals(testDestinations.get(i).getDescription()));
            vacationDao.delete(vacationDao.getVacationDestinations().get(vacationDao.getVacationDestinations().indexOf(testDestinations.get(i))));
        }
        testDestinations.clear();
    }
}
