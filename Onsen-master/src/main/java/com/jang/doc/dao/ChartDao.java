package com.jang.doc.dao;

import java.util.List;

import com.jang.doc.model.Chartdata;

public interface ChartDao {
	
	Chartdata getData(String userId);
	List<Chartdata> getChartList(String userId);
	
	List<Chartdata> getDate(String userId, String year, String month, String day);

}
