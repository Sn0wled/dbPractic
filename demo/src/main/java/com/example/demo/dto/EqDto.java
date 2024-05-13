package com.example.demo.dto;

import com.example.demo.models.Class;
import com.example.demo.models.Eq;
import com.example.demo.models.EqType;
import com.example.demo.models.Place;
import lombok.Data;

@Data
public class EqDto {
    int id;
    int typeId;
    String type;
    int invNum;
    int isOk;
    String characteristic;
    String note;
    String classAndPlace;

    public EqDto(Eq eq, EqType type){
        if (eq.getTypeId() != type.getId()){
            throw new RuntimeException("ИД типа оборудования не совпадает с оборудованием");
        }
        this.id = eq.getId();
        this.typeId = eq.getTypeId();
        this.type = type.toString();
        this.invNum = eq.getInvNum();
        this.isOk = eq.getIsOk();
        this.characteristic = type.getCharacteristic();
        this.note = eq.getNote();
        classAndPlace = "";
    }
}
