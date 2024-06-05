package com.example.demo.dao;

import com.example.demo.models.Class;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ClassDao {
    JdbcTemplate jdbcTemplate;
    BeanPropertyRowMapper<Class> rowMapper = BeanPropertyRowMapper.newInstance(Class.class);

    public ClassDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Class> getByCafId(int cafId){
        return jdbcTemplate.query("select * from get_class_with_address_by_caf_id(?)", rowMapper, cafId);
    }

    public List<Integer> getCafs(){
        return jdbcTemplate.queryForList("select get_cafs()", Integer.class);
    }

    public List<Class> getAll(){
        return jdbcTemplate.query("select * from get_all_classes_with_address()", rowMapper);
    }
    public Class getById(int id){
        return  jdbcTemplate.queryForObject("select * from get_class_with_address_by_id(?)", rowMapper, id);
    }

    public void update(int id, int cafId, int maxPlaces, String note, String pref, String street, String house, String place, String phoneNumber){

        jdbcTemplate.update("call update_class(?, ?, ?, ?, ?, ?, ?, ?, ?)", id, maxPlaces, cafId, note, pref, street, house, place, phoneNumber);
    }

    public Integer create(int cafId, int maxPlaces, String note, String pref, String street, String house, String place, String phoneNumber) {

        return jdbcTemplate.queryForObject("select * from  add_class(?, ?, ?, ?, ?, ?, ?, ?)", Integer.class, maxPlaces, cafId, note, pref, street, house, place, phoneNumber);
    }

    public List<Class> getClassesWithPlaces() {
        return jdbcTemplate.query("select * from get_classes_with_places()", rowMapper);
    }
}
