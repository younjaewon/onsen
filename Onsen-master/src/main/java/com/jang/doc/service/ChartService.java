package com.jang.doc.service;

import java.util.List;

import com.jang.doc.model.Chartdata;

public interface ChartService {
	
	Chartdata getData(String userId);
	List<Chartdata> getChartList(String userId);
	List<Chartdata> getDate(String userId, String year, String month, String day);

}
