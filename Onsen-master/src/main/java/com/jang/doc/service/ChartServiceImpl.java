package com.jang.doc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.doc.dao.ChartDao;
import com.jang.doc.model.Chartdata;

@Service("chartService")
public class ChartServiceImpl implements ChartService {
	
	@Resource(name="chartDao")
	private ChartDao chartDao;
	
	@Autowired
	public void setChartDao(ChartDao chartDaoImpl) {
		this.chartDao = chartDaoImpl;
	}
	
	@Override
	public Chartdata getData(String userId) {
		return chartDao.getData(userId);
	}
	
	@Override
	public List<Chartdata> getChartList(String userId) {
		return chartDao.getChartList(userId);
	}
	
	@Override
	public List<Chartdata> getDate(String userId, String year, String month, String day) {
		return chartDao.getDate(userId, year, month, day);
	}

}
