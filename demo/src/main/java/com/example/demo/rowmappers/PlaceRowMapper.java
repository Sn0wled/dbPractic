package com.example.demo.rowmappers;

import com.example.demo.models.Place;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class PlaceRowMapper implements RowMapper<Place> {
    @Override
    public Place mapRow(ResultSet rs, int rowNum) throws SQLException {
        Place result = new Place();
        result.setId(rs.getInt(1));
        result.setClassId(rs.getInt(2));
        result.setNum(rs.getString(3));
        result.setName(rs.getString(4));
        result.setIp(rs.getString(5));
        result.setNote(rs.getString(6));
        return result;
    }
}
