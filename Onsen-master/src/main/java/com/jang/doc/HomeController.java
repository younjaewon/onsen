package com.jang.doc;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	
	@RequestMapping(value = "product", method = RequestMethod.GET)
	public String product(Locale locale, Model model) {
		
		return "product";
		
	}
	@RequestMapping(value = "business", method = RequestMethod.GET)
	public String business(Locale locale, Model model) {
		
		return "business";
		
	}
	
	@RequestMapping(value = "app", method = RequestMethod.GET)
	public String Coping(Locale locale, Model model) {
		
		return "app";
		
	}
	
	
	@RequestMapping(value = "graph", method = RequestMethod.GET)
	public String graph(Locale locale, Model model) {
		
		return "graph";
		
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(Locale locale, Model model) {
		
		return "user/logout";
		
	}
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String homes(Locale locale, Model model) {
		
		return "home";
		
	}
	@RequestMapping(value = "chatbot", method = RequestMethod.GET)
	public String chatbot(Locale locale, Model model) {
		
		return "chatbot";
		
	}
	
	
	@RequestMapping(value = "charterror", method = RequestMethod.GET)
	public String charterror(Locale locale, Model model) {
		
		return "charterror";
	
}
	
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		
		return "test";
	
}
	
}
