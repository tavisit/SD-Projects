package com.octavian.project.Model.DAO;
import com.octavian.project.Model.Domain.User;

import java.util.*;
public interface Dao<T> {


    T getById(int id);
    List<T> getAll();
    int save(T t);
    int update(T t);
    int delete(T t);
}
