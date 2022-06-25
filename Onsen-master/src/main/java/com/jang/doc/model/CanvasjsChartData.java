package com.jang.doc.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CanvasjsChartData {
	 
	static Map<Object,Object> map = null;
	static List<List<Map<Object,Object>>> list = new ArrayList<List<Map<Object,Object>>>();
	static List<Map<Object,Object>> dataPoints1 = new ArrayList<Map<Object,Object>>();
	
	static {
		map = new HashMap<Object,Object>(); map.put("x", 1); map.put("y", 35.3);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 2); map.put("y", 37.4);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 3); map.put("y", 40.1);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 4); map.put("y", 37.8);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 5); map.put("y", 41.0);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 6); map.put("y", 34.7);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 7); map.put("y", 35.0);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 8); map.put("y", 36.6);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 9); map.put("y", 37.5);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 10); map.put("y", 38.3);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 11); map.put("y", 39.6);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 12); map.put("y", 40.1);dataPoints1.add(map);
 
		list.add(dataPoints1);
	}
 
	public static List<List<Map<Object, Object>>> getCanvasjsDataList() {
		return list;
	}
}           