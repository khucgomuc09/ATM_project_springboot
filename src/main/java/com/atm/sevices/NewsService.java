package com.atm.sevices;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atm.entities.News;
import com.atm.repositories.NewsRepository;

@Service
public class NewsService  {
	@Autowired
	private NewsRepository nr;

	public ArrayList<News> getHighlightNews() {

		ArrayList<News> listHighlightNews = new ArrayList<News>();
		listHighlightNews.add(nr.getOne(15));
		listHighlightNews.add(nr.getOne(12));
		return listHighlightNews;
	}

	public ArrayList<News> getAllNews() {
		ArrayList<News> News = new ArrayList<News>();
		for (News item : nr.findAll()) {
			News.add(item);
		}
		return News;
	}

}
