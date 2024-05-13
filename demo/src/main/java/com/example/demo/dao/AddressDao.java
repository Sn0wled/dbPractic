package com.example.demo.dao;

import com.example.demo.models.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class AddressDao {
    @Autowired
    JdbcTemplate jdbcTemplate;
    BeanPropertyRowMapper<Address> rowMapper = BeanPropertyRowMapper.newInstance(Address.class);
    public Address getById(int id){
        return jdbcTemplate.queryForObject("select * from get_address_by_id(?)", rowMapper, id);
    }
    public void update(Address address){
        jdbcTemplate.update("call update_address(?, ?, ?, ?, ?, ?)", address.getId(), address.getPref(), address.getStreet(), address.getHouse(), address.getPlace(),
                address.getPNum());
    }
}
