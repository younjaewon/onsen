package com.jang.doc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jang.doc.model.Chartdata;
import com.jang.doc.service.ChartService;

@Controller
public class ChartControlle {
	
	
	@Autowired
	private ChartService chartService;
	
	
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String toLoginView2(Model model, HttpSession session,Chartdata ch) {
		String userId = (String) session.getAttribute("id");
		List<Chartdata> chartdata = chartService.getDate(userId,ch.getYear(),ch.getMonth(),ch.getDay());
		model.addAttribute("chartdata", chartdata);
		return "chart";
	}

	@RequestMapping(value = "/chart", method = RequestMethod.POST)
	public String toLoginView23(Model model, HttpSession session,Chartdata ch) {
		String userId = (String) session.getAttribute("id");
		System.out.println(ch.toString());
		List<Chartdata> chartdata = chartService.getDate(userId,ch.getYear(),ch.getMonth(),ch.getDay());
		model.addAttribute("chartdata", chartdata);
		return "chart";
	}

}
