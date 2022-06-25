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
				result.reject("error.password.user", "패스워드가 일치하지 않습니다.");
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
			model.addAttribute("errMsg", "아이디나 이메일 정보가 일치하지않습니다. 확인 후 다시 시도하여 주십시오.");
			return "user/findiderror";
		}else {
			model.addAttribute("findUser", findUser);
			return "user/findIdSuccess";
		}

	} catch (EmptyResultDataAccessException e) {
		e.printStackTrace();
		model.addAttribute("errMsg", "서버에서 에러가 발생하였습니다.");
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
				model.addAttribute("errMsg", "아이디나 이메일 정보가 일치하지않습니다. 확인 후 다시 시도하여 주십시오.");
				return "user/findPasserror";
			}else {
				model.addAttribute("findUser", findUser);
				return "user/updatePassForm";
			}

		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			model.addAttribute("errMsg", "서버에서 에러가 발생하였습니다.");
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
			model.addAttribute("errMsg", "사용자 정보가 존재하지 않습니다.");
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
			model.addAttribute("다음과 같이 회원님의 정보가 수정 되었습니다!");
			return "user/updatePassSuccess";
		} else {
			model.addAttribute("errMsg", "사용자 정보 수정에 실패하였습니다.");
			return "user/updatePassForm";
		}
	}

}
