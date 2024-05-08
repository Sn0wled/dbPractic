package com.example.demo;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.SQLException;
import java.util.List;

@SpringBootApplication
public class DemoApplication implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public void run(String... args) throws Exception {
		List<EqType> eqTypeList = jdbcTemplate.query("select * from select_all_eq_type()", new EqTypeRowMapper());
		for (var eqType: eqTypeList) {
			System.out.println(eqType.toString());
		}
		try {
			jdbcTemplate.update("CALL public.add_eq_type('принтер', 'принтер', null)");
		} catch (DataAccessException ex) {
			PSQLException exception = ((PSQLException) ex.getCause());
			System.out.println(exception.getSQLState());
		}
	}
}
