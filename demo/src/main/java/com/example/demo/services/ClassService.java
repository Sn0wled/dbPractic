package com.example.demo.services;

import com.example.demo.dao.ClassDao;
import com.example.demo.models.Class;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassService {
    @Autowired
    ClassDao classDao;
    public List<Class> getAll(){
        return classDao.getAll();
    }

    public List<Integer> getCafs(){
        return classDao.getCafs();
    }

    public Class getById(int id){
        return classDao.getById(id);
    }


    public List<Class> getClassesWithPlaces(){
        return classDao.getClassesWithPlaces();
    }
}
