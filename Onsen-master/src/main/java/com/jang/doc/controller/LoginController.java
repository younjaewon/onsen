package com.jang.doc.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
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
public class LoginController {

	@Resource(name = "userService")
	private UserService userService;

	User user;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String toLoginView(Model model) {

		model.addAttribute("user", new User());
		return "user/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String onSubmit(@Valid User user, BindingResult result, Model model, HttpSession session) {

		if (result.hasFieldErrors("id") || result.hasFieldErrors("pass")) {
			model.addAllAttributes(result.getModel());
			return "user/login";
		}

		try {
			User loginUser = this.userService.getUser(user.getId());
			
			if (user.getPass().equals(loginUser.getPass())) {
				model.addAttribute("loginUser", loginUser);
				session.setAttribute("id", loginUser.getId());
			
				return "redirect:home";
			} else {
				result.reject("error.password.user", "�н����尡 ��ġ���� �ʽ��ϴ�.");
				model.addAllAttributes(result.getModel());
			
				return "user/passerror";
			}
		} catch (NullPointerException npe) {
			model.addAllAttributes(result.getModel());
		

			return "user/iderror";
		}
	}

	
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String toFindForm(Model model) {
		model.addAttribute("user", new User());
		return "user/findForm";
	}

	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public String findIdSubmit(@Valid User user, BindingResult result, Model model) {

		if (result.hasFieldErrors("name") || result.hasFieldErrors("email")) {
			model.addAllAttributes(result.getModel());
			return "user/findForm";
		}
		

	try {
		User findUser = this.userService.findId(user.getName(), user.getEmail());
		if(findUser == null) {
			model.addAttribute("errMsg", "���̵� �̸��� ������ ��ġ�����ʽ��ϴ�. Ȯ�� �� �ٽ� �õ��Ͽ� �ֽʽÿ�.");
			return "user/findiderror";
		}else {
			model.addAttribute("findUser", findUser);
			return "user/findIdSuccess";
		}

	} catch (EmptyResultDataAccessException e) {
		e.printStackTrace();
		model.addAttribute("errMsg", "�������� ������ �߻��Ͽ����ϴ�.");
		return "user/findiderror";
	}
}
	
	
	@RequestMapping(value = "/findPass", method = RequestMethod.GET)
	public String tofnidPassForm(Model model) {
		model.addAttribute("user", new User());
		return "user/findPassForm";
	}

	@RequestMapping(value = "/findPass", method = RequestMethod.POST)
	public String findPassSubmit(@Valid User user, BindingResult result, Model model) {

		if (result.hasFieldErrors("id") || result.hasFieldErrors("email")) {
			model.addAllAttributes(result.getModel());
			return "user/findPassForm";
		}

		try {
			User findUser = this.userService.findPass(user.getId(), user.getEmail());
			if(findUser == null) {
				model.addAttribute("errMsg", "���̵� �̸��� ������ ��ġ�����ʽ��ϴ�. Ȯ�� �� �ٽ� �õ��Ͽ� �ֽʽÿ�.");
				return "user/findPasserror";
			}else {
				model.addAttribute("findUser", findUser);
				return "user/updatePassForm";
			}

		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			model.addAttribute("errMsg", "�������� ������ �߻��Ͽ����ϴ�.");
			return "user/findPasserror";
		}
	}

	@RequestMapping(value = "/updatepass", method = RequestMethod.GET)
	public String updatePassView(@RequestParam("userId") String userId,BindingResult result, Model model) {

		this.user = new User();

	
		try {
			user = this.userService.getUser(userId);
			model.addAttribute("user", user);
			return "user/updatePassForm";
		} catch (EmptyResultDataAccessException e) {
			model.addAttribute("user", user);
			model.addAttribute("errMsg", "����� ������ �������� �ʽ��ϴ�.");
			return "user/updatePassForm";
		}
	}

	@RequestMapping(value = "/updatepass", method = RequestMethod.POST)
	public String updatePasssubmit(@Valid User user, BindingResult result, Model model) throws Exception {
		

		if (result.hasFieldErrors("id") || result.hasFieldErrors("pass")) {
			model.addAllAttributes(result.getModel());
			
			return "user/updatePassForm";
		}
		

		if (this.userService.updatePass(user) != 0) {
			model.addAttribute("user", user);
			model.addAttribute("������ ���� ȸ������ ������ ���� �Ǿ����ϴ�!");
			return "user/updatePassSuccess";
		} else {
			model.addAttribute("errMsg", "����� ���� ������ �����Ͽ����ϴ�.");
			return "user/updatePassForm";
		}
	}

}
