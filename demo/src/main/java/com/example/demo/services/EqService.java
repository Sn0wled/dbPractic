package com.example.demo.services;

import com.example.demo.dao.*;
import com.example.demo.dto.EqDto;
import com.example.demo.models.Class;
import com.example.demo.models.Eq;
import com.example.demo.models.Place;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;

@Service
public class EqService {
    @Autowired
    EqDao eqDao;
    @Autowired
    EqTypeDao eqTypeDao;
    @Autowired
    PlaceDao placeDao;
    @Autowired
    ClassDao classDao;
    public List<EqDto> getAll(){
        List<Eq> allEq =eqDao.getAll();
        List<EqDto> result = new ArrayList<>();
        for (Eq eq : allEq) {
            EqDto eqDto = new EqDto(eq, eqTypeDao.getById(eq.getTypeId()));
            try {
                Place eqPlace = placeDao.getByEqId(eq.getId());
                Class address = classDao.getById(eqPlace.getClassId());
                eqDto.setClassAndPlace(String.join(" / ", address.getAddress(), eqPlace.getNum()));
            }
            catch (Exception ex){}
            result.add(eqDto);
        }
        return result;
    }

    public List<EqDto> getByPlaceId(int placeId){
        List<Eq> eqs = eqDao.getByPlaceId(placeId);
        return getDtoList(eqs);
    }
    public Integer create(int typeId, int invNum, String note) {
            return eqDao.create(typeId, invNum, note);
    }

    public void del(int id){
        eqDao.delete(id);
    }

    public Eq getById(int id){
        return eqDao.getById(id);
    }

    public void update(int id, int typeId, int invNum, String note){
        eqDao.update(id, typeId, invNum, note);
    }
    public void install(int eqId, int placeId){
        eqDao.install(eqId, placeId);
    }
    public void uninstall(int eqId){
        eqDao.uninstall(eqId);
    }
    public List<Eq> getNotInstalled() {return eqDao.getNotInstalled();}
    public  List<EqDto> getDtoList(List<Eq> eqList){
        List<EqDto> result = new ArrayList<>();
        for (Eq eq : eqList) {
            EqDto eqDto = new EqDto(eq, eqTypeDao.getById(eq.getTypeId()));
            try {
                Place eqPlace = placeDao.getByEqId(eq.getId());
                Class address = classDao.getById(eqPlace.getClassId());
                eqDto.setClassAndPlace(String.join(" / ", address.getAddress(), eqPlace.getNum()));
            }
            catch (Exception ex){
                eqDto.setClassAndPlace("");
            }
            result.add(eqDto);
        }
        return  result;
    }
}
