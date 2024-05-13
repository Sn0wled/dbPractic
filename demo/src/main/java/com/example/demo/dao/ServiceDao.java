package com.example.demo.dao;

import com.example.demo.models.Serv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ServiceDao {
    @Autowired
    JdbcTemplate jdbcTemplate;
    BeanPropertyRowMapper<Serv> rowMapper = BeanPropertyRowMapper.newInstance(Serv.class);
    public List<Serv> getByPlaceId(int servId){
        return jdbcTemplate.query("select * from get_serv_by_place_id(?)", rowMapper, servId);
    }
}
