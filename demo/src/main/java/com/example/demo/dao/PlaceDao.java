package com.example.demo.dao;

import com.example.demo.models.Place;
import com.example.demo.rowmappers.PlaceRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PlaceDao {
    @Autowired
    JdbcTemplate jdbcTemplate;
    @Autowired
    PlaceRowMapper rowMapper;

    public List<Place> getByClassId(int classId){
        return jdbcTemplate.query("select * from get_learn_places_by_class_id(?)", rowMapper, classId);
    }
    public Place getByEqId(int eqId){
        return  jdbcTemplate.queryForObject("select * from get_learn_place_by_eq_id(?)", rowMapper, eqId);
    }

    public Place getById(int id){
        return jdbcTemplate.queryForObject("select * from get_learn_place_by_id(?)", rowMapper, id);
    }

    public void del(int placeId){
        jdbcTemplate.update("call del_learn_place(?)", placeId);
    }

    public void update(int id, int classId, String placeNum, String placeName, String placeIP, String placeNote){
        jdbcTemplate.update("call update_learn_place(?, ?, ?, ?, ?, ?)", id, classId, placeNum, placeName, placeIP, placeNote);
    }

    public void create(int classId, String placeNum, String placeName, String placeIP, String placeNote){
        jdbcTemplate.update("call add_learn_place(?, ?, ?, ?, ?)", classId, placeNum, placeName, placeIP, placeNote);
    }
}
