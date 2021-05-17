package com.atm.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.atm.entities.Order;
import com.atm.entities.User;
import com.atm.sevices.NewsService;
import com.atm.sevices.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService ps;
	@Autowired
	private NewsService ns;

//
	@GetMapping("/")
	public ModelAndView showProduct(@SessionAttribute(name = "user", required = false) User user,
			@SessionAttribute(name = "order_session", required = false) Order order) {
//		 0:new, 1Hot, 2Sale
		ModelAndView modelAndView = new ModelAndView("client/index");
		modelAndView.addObject("newProducts", ps.getProductByType(0));
		modelAndView.addObject("hotProducts", ps.getProductByType(1));
		modelAndView.addObject("saleProducts", ps.getProductByType(2));
		modelAndView.addObject("hightlight_news", ns.getHighlightNews());
		if (order != null)
			modelAndView.addObject(order);
		if (user != null) {
			System.out.println("session");
			modelAndView.addObject(user);
		} else {

			System.out.println("non-session");
		}
		return modelAndView;
	}

}
