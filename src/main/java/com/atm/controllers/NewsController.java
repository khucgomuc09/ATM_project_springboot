package com.atm.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.atm.sevices.NewsService;

@Controller
public class NewsController {
	@Autowired
	private NewsService ns;

	@GetMapping("homepage_news")
	public ModelAndView getHighlightsNews() {
		ModelAndView modelAndView = new ModelAndView("client/index", "hightlight_news", ns.getAllNews());
		return modelAndView;
	}

	@GetMapping("news")
	public ModelAndView showNews() {
		ModelAndView modelAndView = new ModelAndView("client/news", "list_news", ns.getAllNews());
		return modelAndView;
	}

	@GetMapping("news_detail/{id}")
	public ModelAndView showNewsDetail(@PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView("client/news_detail", "news", ns.getNewsByID(id));
		modelAndView.addObject("listNews", ns.getHighlightNews());
		return modelAndView;

	}

	@GetMapping("question")
	public String question() {
		return "client/question";
	}

}
