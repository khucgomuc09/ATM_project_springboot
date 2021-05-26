package com.atm.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.atm.entities.User;
import com.atm.sevices.UserService;

@Controller
@SessionAttributes("user")
public class UserController {
	@Autowired
	UserService us;

	@GetMapping("/register")
	public String register() {
		return "client/register";
	}

	@PostMapping("/register")
	public String register(User u, ModelMap modelMap) {
		User user = us.registerUser(u);
		if (user != null) {
			modelMap.addAttribute("user", user);

			return "redirect:/";
		} else {
			System.out.println("user null");
			return "redirect:/register";
		}

	}

	@GetMapping("/login")
	public String login() {
		return "client/login";
	}

	@PostMapping("/login")
	public String login(@RequestParam String username, @RequestParam String password, ModelMap modelMap) {
		User u = us.login(username, password);
		if (u != null) {
//			System.out.println("uc: " + u);
			modelMap.addAttribute("user", u);
			return "redirect:/";
		} else {
			return "redirect:/login";
		}
	}

	@GetMapping("error404")
	public String error404() {
		return "error404";
	}

	@GetMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:removeCartItemSS";
	}
}
