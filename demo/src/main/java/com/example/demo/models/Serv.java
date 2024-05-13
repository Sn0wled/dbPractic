package com.example.demo.models;

import lombok.Data;

import java.util.Date;

@Data
public class Serv {
    int id;
    int eqId;
    int placeId;
    Date installDate;
    Date uninstallDate;
    String invNum;
    String note;
    String type;
    String characteristic;
    int isOk;
}
