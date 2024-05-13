package com.example.demo.models;

import lombok.Data;

@Data
public class EqType {
    int id;
    String category;
    String name;
    String characteristic;
    @Override
    public String toString(){
        return String.join(" " ,category, name);
    }
}
