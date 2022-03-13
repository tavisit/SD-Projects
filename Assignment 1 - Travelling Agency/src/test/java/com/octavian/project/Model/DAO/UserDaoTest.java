package com.octavian.project.Model.DAO;

import com.octavian.project.Model.Domain.User;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class UserDaoTest {

    @Test
    void insertUser()
    {
        User testUser = new User();
        testUser.setName("test name");
        testUser.setPassword("123456789");
        Random random = new Random();
        testUser.setUsername("test@test.com" + random.nextInt());
        testUser.setRole(0);

        UserDao userDao = new UserDao();
        userDao.save(testUser);
        List<User> testUsers = userDao.getAll();
        User testUserSingle = userDao.getById(testUser.getId());

        assert(testUserSingle.getName().equals(testUser.getName()));
        assert(testUserSingle.getUsername().equals(testUser.getUsername()));
        assert(testUserSingle.getName().equals(testUser.getName()));
        userDao.delete(testUserSingle);

        testUsers.clear();
    }
    @Test
    void updateUser()
    {
        User testUser = new User();
        testUser.setName("test name");
        testUser.setPassword("123456789");
        testUser.setUsername("test@test.com");
        testUser.setRole(0);

        UserDao userDao = new UserDao();
        userDao.save(testUser);

        userDao.getUsers().get(0).setUsername("testtest");
        userDao.update(userDao.getUsers().get(0));
        testUser.setUsername("testtest");

        assert(userDao.getUsers().get(0).getName().equals(testUser.getName()));
        assert(userDao.getUsers().get(0).getUsername().equals(testUser.getUsername()));
        assert(userDao.getUsers().get(0).getName().equals(testUser.getName()));
        userDao.delete(userDao.getUsers().get(0));
    }

    @Test
    void insertMultipleUsers()
    {
        List<User> testUsers = new ArrayList<User>();
        UserDao userDao = new UserDao();
        Random rand = new Random();
        for(int i=0;i<10;i++)
        {
            User testUser = new User();
            testUser.setName("test name" + i);
            testUser.setPassword("123456789" + i);
            testUser.setUsername( i + "test@test.com");
            testUser.setRole(rand.nextInt(0,100)%2);
            testUsers.add(testUser);
            userDao.save(testUser);
        }
        userDao.getAll();
        for (int i = 0; i < 10; i++) {
            assert (userDao.getUsers().get(userDao.getUsers().indexOf(testUsers.get(i))).getName().equals(testUsers.get(i).getName()));
            assert (userDao.getUsers().get(userDao.getUsers().indexOf(testUsers.get(i))).getUsername().equals(testUsers.get(i).getUsername()));
            assert (userDao.getUsers().get(userDao.getUsers().indexOf(testUsers.get(i))).getName().equals(testUsers.get(i).getName()));
            userDao.delete(userDao.getUsers().get(userDao.getUsers().indexOf(testUsers.get(i))));
        }
        testUsers.clear();
    }
}
