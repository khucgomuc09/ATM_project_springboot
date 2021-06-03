package com.atm.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.atm.entities.UserOrder;
import com.atm.entities.Product;
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
			@SessionAttribute(name = "order_session", required = false) UserOrder order) {
//		 0:new, 1Hot, 2Sale
		ModelAndView modelAndView = new ModelAndView("client/index");
		modelAndView.addObject("newProducts", ps.getProductByType(0));
		modelAndView.addObject("hotProducts", ps.getProductByType(1));
		modelAndView.addObject("saleProducts", ps.getProductByType(2));
		modelAndView.addObject("hightlight_news", ns.getHighlightNews());
		if (order != null) {
			modelAndView.addObject("order", order);

		}
		if (user != null) {
			modelAndView.addObject(user);
		} else {

		}
		return modelAndView;
	}

	@GetMapping("/{supplier}")
	public ModelAndView showProductBySupplier(@PathVariable String supplier,
			@SessionAttribute(name = "user", required = false) User user,
			@SessionAttribute(name = "order_session", required = false) UserOrder order,
			@RequestParam(required = false, value = "page", defaultValue = "0") int page) {
		ModelAndView modelAndView = new ModelAndView("client/product_by_supplier");

		if (order != null)
			modelAndView.addObject("order", order);
		if (user != null)
			modelAndView.addObject(user);

		Page<Product> p = ps.getProductBySupplier(supplier, PageRequest.of(page, 8));

		modelAndView.addObject("list_products", p.toList());
		modelAndView.addObject("supplier", supplier);
		modelAndView.addObject("total_pages", p.getTotalPages());
		modelAndView.addObject("current_page", p.getNumber());
		return modelAndView;
	}

	@PostMapping("/search")
	@ResponseBody
	public List<String> seacrh(@RequestParam String keywords) {
		return ps.search(keywords);
	}

}