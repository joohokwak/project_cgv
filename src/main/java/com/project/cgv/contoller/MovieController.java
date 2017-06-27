package com.project.cgv.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.cgv.service.MovieService;

@Controller
@RequestMapping("/movie/*")
public class MovieController {

	@Autowired private MovieService mvService;
	
	@RequestMapping("/movieList")
	public ModelAndView movieList() {
		ModelAndView mv = new ModelAndView(".movie.movieList");
		mv.addObject("imgInfo", "h2_movie.png");
		return mv;
	}
	
	@RequestMapping("/movieDetail")
	public ModelAndView movieDetail(@RequestParam("m_num") int m_num) {
		ModelAndView mv = new ModelAndView(".movie.movieDetail");
		mv.addObject("imgInfo", "h2_movie.png");
		return mv;
	}
	
}
