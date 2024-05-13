package com.example.demo.dao;

import com.example.demo.models.EqType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.example.demo.rowmappers.EqTypeRowMapper;

import java.util.List;

@Repository
public class EqTypeDao {
    @Autowired
    JdbcTemplate jdbcTemplate;
    @Autowired
    EqTypeRowMapper rowMapper;
    public List<EqType> getAll(){
        return jdbcTemplate.query("select * from get_all_eq_types()", rowMapper);
    }
    public EqType getById(int id){
        return jdbcTemplate.queryForObject("select * from get_eq_type_by_id(?)", rowMapper, id);
    }
}
