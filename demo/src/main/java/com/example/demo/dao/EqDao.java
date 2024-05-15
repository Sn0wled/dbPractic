package com.example.demo.dao;

import com.example.demo.models.Eq;
import com.example.demo.rowmappers.EqRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EqDao {
    @Autowired
    JdbcTemplate jdbcTemplate;
    @Autowired
    EqRowMapper rowMapper;
    public List<Eq> getByPlaceId(int placeId){
        return jdbcTemplate.query("select * from get_eqs_by_learn_place(?)", rowMapper, placeId);
    }
    public List<Eq> getAll(){
        return jdbcTemplate.query("select * from get_all_eq()", rowMapper);
    }
    public void delete(int eqId){
        jdbcTemplate.update("call del_eq(?)", eqId);
    }
    public Integer create(int typeId, int invNum, String note) {
        return jdbcTemplate.queryForObject("select add_eq(?, ?, ?)", Integer.class, typeId, invNum, note);
    }
    public Eq getById(int id){
        return jdbcTemplate.queryForObject("select * from get_eq_by_id(?)", rowMapper, id);
    }

    public  void update(int id, int typeId, int invNum, String note){
        jdbcTemplate.update("call update_eq(?, ?, ?, ?)", id, typeId, invNum, note);
    }

    public void install(int eqId, int placeId){
        jdbcTemplate.update("call install_eq(?, ?)", eqId, placeId);
    }

    public void uninstall(int eqId){
        jdbcTemplate.update("call uninstall_eq(?)", eqId);
    }
}
