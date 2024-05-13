package com.example.demo.models;

import lombok.Data;

@Data
public class Place {
    int id;
    int classId;
    String num;
    String name;
    String ip;
    String note;
}
