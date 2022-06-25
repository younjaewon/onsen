package com.jang.doc.model;

public class Chartdata {

	private float tempc;
	private String time_m;
	private String time_c;
	private String id;
	private String year;
	private String month;
	private String day;

	public float getTempc() {
		return tempc;
	}

	public void setTempc(float tempc) {
		this.tempc = tempc;
	}

	public String getTime_m() {
		return time_m;
	}

	public void setTime_m(String time_m) {
		this.time_m = time_m;
	}

	public String getTime_c() {
		return time_c;
	}

	public void setTime_c(String time_c) {
		this.time_c = time_c;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	@Override
	public String toString() {
		return "Chartdata [tempc=" + tempc + ", time_m=" + time_m + ", time_c=" + time_c + ", id=" + id + ", year="
				+ year + ", month=" + month + ", day=" + day + "]";
	}

}
