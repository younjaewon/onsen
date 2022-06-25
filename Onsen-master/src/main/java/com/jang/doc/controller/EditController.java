package com.jang.doc.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jang.doc.model.User;
import com.jang.doc.service.UserService;

@Controller
public class EditController {

	@Autowired
	private UserService userService;
	
	User user;
	
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public String toUserEditView(@RequestParam("userId")String userId, Model model) {
	
		this.user = new User();
		
		try {
			user = this.userService.getUser(userId);
			model.addAttribute("user",user);
			return "user/editForm";
		}
		catch(EmptyResultDataAccessException e) {
			model.addAttribute("user",user);
			model.addAttribute("errMsg","사용자 정보가 존재하지 않습니다.");
			return "user/editForm";
		}
	}
	
	
	@RequestMapping(value="/edit",method = RequestMethod.POST)
	public String onSubmit( @Valid User user, BindingResult result,Model model)throws Exception{
		
		
		if(result.hasErrors()) {
			model.addAllAttributes(result.getModel());
			return "user/editForm";
			
		}
		
		if(this.userService.updateUser(user)!=0) {
			model.addAttribute("user",user);
			model.addAttribute("message","다음과 같이 회원님의 정보가 수정 되었습니다.");
			System.out.println("1111111111111111111");
			return "user/editSuccess";
		}
		else {
			System.out.println("22222222222");
			model.addAttribute("errMsg","사용자 정보 수정에 실패하였습니다.");
			return "user/editForm";
		}
	}
}
