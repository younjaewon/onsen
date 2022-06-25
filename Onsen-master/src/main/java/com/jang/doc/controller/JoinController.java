package com.jang.doc.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

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
public class JoinController {

	@Resource(name = "userService")
	private UserService userService;
		
	@RequestMapping(value="/join", method = RequestMethod.GET)//login회원가입
	public String toUserEntryView(Model model) {
		model.addAttribute("user",new User());
		return "user/joinForm";
	}
	
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String onSubmit(@Valid User user,BindingResult result, Model model)throws Exception {
		
		if(result.hasErrors()){
			model.addAllAttributes(result.getModel());
			return "user/joinForm";
		}
		
		if(this.userService.insertUser(user)!=0) {
			model.addAttribute("message","다음과 같이 회원 가입이 완료되었습니다.");
			model.addAttribute("user",user);
			return "user/joinSuccess";
		}
		else {
			model.addAttribute("errMsg","회원가입을 완료하지 못하였습니다. 다시 시도하여 주십시오");
			model.addAllAttributes(result.getModel());
			return "user/joinForm";
		}
	}
	
	@RequestMapping(value = "/checkid",method = RequestMethod.GET)//ID중복체크
	public String duplicateId(@RequestParam("userId")String userId,Model model) {
		
		String message ="";
		int available = 0; //아이디 사용가능 여부
		
		try {
			User loginiUser = this.userService.getUser(userId);
			if(loginiUser == null) {
				message = "사용 가능한 아이디 입니다.";
				available = 1;
			}else {
				message = "이미 사용된 아이디 입니다.";
				available = 0;
			}
		}catch(EmptyResultDataAccessException e) {
			e.printStackTrace();
			message = "서버에서 에러가 발생하였습니다.";
			available = 2;
		}
		
		model.addAttribute("user",new User());
		model.addAttribute("message",message);
		model.addAttribute("available",available);
		model.addAttribute("userId",userId);
		
		return "user/joinForm";
	}

}
