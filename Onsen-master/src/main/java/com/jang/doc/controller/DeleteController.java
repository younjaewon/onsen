package com.jang.doc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jang.doc.model.User;
import com.jang.doc.service.UserService;

@Controller
public class DeleteController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String onSubmit(User user, Model model) throws Exception{
		System.out.println(user.getId());
		if(this.userService.deleteUser(user.getId()) !=  0) {
			model.addAttribute("message","Å»ÅðµÇ¾ú½À´Ï´Ù");
		}
		return "user/deleteSuccess";
	}
}


