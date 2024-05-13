package com.example.demo.rowmappers;

import com.example.demo.models.Eq;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class EqRowMapper implements RowMapper<Eq> {
    @Override
    public Eq mapRow(ResultSet rs, int rowNum) throws SQLException {
        Eq result = new Eq();
        result.setId(rs.getInt(1));
        result.setTypeId(rs.getInt(2));
        result.setInvNum(rs.getInt(3));
        result.setIsOk(rs.getInt(4));
        result.setNote(rs.getString(5));
        return result;
    }
}
