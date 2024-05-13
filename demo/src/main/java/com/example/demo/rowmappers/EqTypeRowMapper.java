package com.example.demo.rowmappers;

import com.example.demo.models.EqType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class EqTypeRowMapper implements RowMapper<EqType> {
    @Override
    public EqType mapRow(ResultSet rs, int rowNum) throws SQLException {
        EqType result = new EqType();
        result.setId(rs.getInt((1)));
        result.setCategory(rs.getString(2));
        result.setName(rs.getString(3));
        result.setCharacteristic(rs.getString(4));
        return  result;
    }
}
