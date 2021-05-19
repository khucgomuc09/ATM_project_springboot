package com.atm.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.atm.entities.UserOrder;
import com.atm.sevices.ProductService;

@Controller
public class ProductDetailController {
	@Autowired
	private ProductService ps;

	@GetMapping("{supplier}/{id}")
	public ModelAndView getProductDetail(@PathVariable("id") int id,
			@SessionAttribute(name = "order_session", required = false) UserOrder order) {
		ModelAndView modelAndView = new ModelAndView("client/product_detail");
		modelAndView.addObject(ps.getProductById(id));
		if (order != null)
			modelAndView.addObject("order", order);
		return modelAndView;
	}
}
