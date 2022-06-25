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
		
	@RequestMapping(value="/join", method = RequestMethod.GET)//loginȸ������
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
			model.addAttribute("message","������ ���� ȸ�� ������ �Ϸ�Ǿ����ϴ�.");
			model.addAttribute("user",user);
			return "user/joinSuccess";
		}
		else {
			model.addAttribute("errMsg","ȸ�������� �Ϸ����� ���Ͽ����ϴ�. �ٽ� �õ��Ͽ� �ֽʽÿ�");
			model.addAllAttributes(result.getModel());
			return "user/joinForm";
		}
	}
	
	@RequestMapping(value = "/checkid",method = RequestMethod.GET)//ID�ߺ�üũ
	public String duplicateId(@RequestParam("userId")String userId,Model model) {
		
		String message ="";
		int available = 0; //���̵� ��밡�� ����
		
		try {
			User loginiUser = this.userService.getUser(userId);
			if(loginiUser == null) {
				message = "��� ������ ���̵� �Դϴ�.";
				available = 1;
			}else {
				message = "�̹� ���� ���̵� �Դϴ�.";
				available = 0;
			}
		}catch(EmptyResultDataAccessException e) {
			e.printStackTrace();
			message = "�������� ������ �߻��Ͽ����ϴ�.";
			available = 2;
		}
		
		model.addAttribute("user",new User());
		model.addAttribute("message",message);
		model.addAttribute("available",available);
		model.addAttribute("userId",userId);
		
		return "user/joinForm";
	}

}
