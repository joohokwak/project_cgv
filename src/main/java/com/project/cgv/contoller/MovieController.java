package com.project.cgv.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		mv.addObject("mvList", mvService.movieList());
		return mv;
	}
	
	@RequestMapping("/movieDetail")
	public ModelAndView movieDetail(@RequestParam("m_num") int m_num) {
		ModelAndView mv = new ModelAndView(".movie.movieDetail");
		mv.addObject("imgInfo", "h2_movie.png");
		mv.addObject("stealList", mvService.stealcutList(m_num));
		mv.addObject("trailerList", mvService.trailerList(m_num));
		mv.addAllObjects(mvService.movieDetail(m_num));
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/likeUp")
	public int likeUp(@RequestParam("m_num") int m_num) {
		mvService.likeUp(m_num);
		
		return mvService.likeUpResult(m_num);
	}
	
	@ResponseBody
	@RequestMapping("/likeDown")
	public int likeDown(@RequestParam("m_num") int m_num) {
		mvService.likeDown(m_num);
		
		return mvService.likeUpResult(m_num);
	}
	
}
