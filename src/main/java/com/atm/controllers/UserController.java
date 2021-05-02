package com.atm.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.atm.entities.User;
import com.atm.sevices.UserService;

@Controller
public class UserController {
	@Autowired
	UserService us;

	@PostMapping("/register")
	public String register(@ModelAttribute User u) {
		if (us.registerUser(u)) {
			System.out.println(us.registerUser(u) + " if");
		} else {
			System.out.println(us.registerUser(u) + " else");
		}
		return us.registerUser(u) ? "redirect:/" : "redirect:/register";
	}

	@GetMapping("/register")
	public String register() {
		return "client/register";
	}
}
