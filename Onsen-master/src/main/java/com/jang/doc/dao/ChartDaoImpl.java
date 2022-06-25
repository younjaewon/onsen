package com.jang.doc.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.jang.doc.model.Chartdata;

@Repository("chartDao")
public class ChartDaoImpl implements ChartDao {

	private JdbcTemplate jdbcTemplate;
	private NamedParameterJdbcTemplate jdbcTemplate2;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.jdbcTemplate2 = new NamedParameterJdbcTemplate(dataSource);
	}

	@Override
	public Chartdata getData(String userId) {

		String sql = "SELECT * FROM temp WHERE id=?";

		RowMapper<Chartdata> mapper = new BeanPropertyRowMapper<Chartdata>(Chartdata.class);

		Chartdata chart = (Chartdata) this.jdbcTemplate.queryForObject(sql, mapper, userId);

		return chart;
	}

	@Override
	public List<Chartdata> getChartList(String userId) {
		String SQL = "select * from temp where id = ? order by tempc asc";

		RowMapper<Chartdata> mapper = new BeanPropertyRowMapper<Chartdata>(Chartdata.class);

		List<Chartdata> chartlist = (List) this.jdbcTemplate.query(SQL, mapper, userId);
		return chartlist;
	}
	
	public List<Chartdata> getDate(String userId, String year, String month, String day) {
		
		String SQL = "select * from temp where id = ? and year = ? and month = ? and day = ? order by tempc asc";

		RowMapper<Chartdata> mapper = new BeanPropertyRowMapper<Chartdata>(Chartdata.class);

		List<Chartdata> chartlist = (List) this.jdbcTemplate.query(SQL, mapper, userId, year, month, day);
		return chartlist;
	}
}
