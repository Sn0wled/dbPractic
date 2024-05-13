package com.example.demo.services;

import com.example.demo.dao.*;
import com.example.demo.dto.EqDto;
import com.example.demo.models.Class;
import com.example.demo.models.Eq;
import com.example.demo.models.Place;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        List<EqDto> result = new ArrayList<>();
        for (Eq eq : eqs) {
            EqDto eqDto = new EqDto(eq, eqTypeDao.getById(eq.getTypeId()));
            try {
                Place eqPlace = placeDao.getByEqId(eq.getId());
                Class address = classDao.getById(eqPlace.getClassId());
                eqDto.setClassAndPlace(String.join(" / ", address.getAddress(), eqPlace.getNum()));
            }
            catch (Exception ex){}
            result.add(eqDto);
        }
        return  result;
    }
}
