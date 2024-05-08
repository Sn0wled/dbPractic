package com.example.demo;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class EqTypeRowMapper implements RowMapper<EqType> {
    @Override
    public EqType mapRow(ResultSet rs, int rowNum) throws SQLException {
        EqType result = new EqType();
        result.setId(rs.getInt(1));
        result.setCategory(rs.getString(2));
        result.setName(rs.getString(3));
        result.setCategory(rs.getString(4));
        return result;
    }
}
