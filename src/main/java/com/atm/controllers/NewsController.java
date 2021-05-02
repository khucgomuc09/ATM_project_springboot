package com.atm.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.atm.sevices.NewsService;

@Controller
public class NewsController {
	@Autowired
	private NewsService ns;

	@GetMapping("news")
	public ModelAndView getHighlightsNews() {
		ModelAndView modelAndView = new ModelAndView("client/index", "hightlight_news", ns.getAllNews());
		return modelAndView;
	}
}
