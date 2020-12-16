package org.cskj.Controller;


import javax.servlet.http.HttpSession;

import org.cskj.Bean.User;
import org.cskj.Exception.UserNotFoundException;
import org.cskj.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	@Autowired
	private UserService uService;
	@RequestMapping("/tologin")
	public String tologin() {
		return"login";
	}
	@RequestMapping("/login")
	public String login(User user,HttpSession session){
		User loginUser = uService.login(user);
		session.setAttribute("loginUser", loginUser);
		if (loginUser!=null) {
			return "redirect:menu";
		}
		return "redirect:tologin";
		
	}
	@RequestMapping("/loginout")
	public String loginout(HttpSession session) {
		session.invalidate();
		return "redirect:tologin";
	}
	@RequestMapping("/menu")
	public String tomenu() {
		return"menu/menu";
	}
	@RequestMapping("/left")
	public String toleft() {
		return"menu/left";
	}
	@RequestMapping("/right")
	public String toright() {
		return"menu/right";
	}
	@RequestMapping("/top")
	public String totop() {
		return"menu/top";
	}
}
