package com.jang.doc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.jang.doc.HomeController;
import com.jang.doc.model.User;
import com.jang.doc.service.UserService;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/userinfo", method = RequestMethod.GET)
	public String userinfo(Model model, HttpSession session, User u) {
		String userId = (String) session.getAttribute("id"); // 1
		User user = userService.getUser(userId);
		model.addAttribute("user", user);
		System.out.println(user.toString());
		return "user/userinfo";
	}
}
