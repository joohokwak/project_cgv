package com.project.cgv.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.cgv.service.MovieService;

@Controller
public class MovieController {

	@Autowired private MovieService mvService;
	
	@RequestMapping("/movieList")
	public ModelAndView movieList() {
		ModelAndView mv = new ModelAndView(".movie.movieList");
		
		return mv;
	}
	
}
