package com.project.cgv.contoller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.cgv.service.MemberService;
import com.project.cgv.service.MovieService;

@Controller
@RequestMapping("/movie/*")
public class MovieController {
	
	@Autowired private MovieService mvService;
	@Autowired private MemberService mService;
	
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
		mv.addObject("mrList", mvService.mrList(m_num));
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
	
	@ResponseBody
	@RequestMapping("/movieTimeInfo")
	public HashMap<String, Object> movieTimeInfo(@RequestParam HashMap<String, Object> params) {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		List<HashMap<String, Object>> result1 = mvService.movieTimeInfo(params);
		List<HashMap<String, Object>> result2 = mvService.timeGroupSeat((String)params.get("mt_date"));
		
		result.put("result1", result1);
		result.put("result2", result2);
		
		return result;
	}
	
	@RequestMapping("/mrInsert")
	public String mrInsert(@RequestParam HashMap<String, Object> params, HttpSession session) {
		HashMap<String, Object> member = (HashMap<String, Object>) session.getAttribute("member");
		params.put("mr_img",  member.get("pic"));
		params.put("id",  member.get("id"));
		
		int result = mvService.mrInsert(params);
		
		if(result > 0) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", member.get("id"));
			map.put("point", 10);
			mService.savePoint(map);
		}
		
		return "redirect:/movie/movieDetail?m_num="+params.get("m_num")+"#reply-content-content";
	}
	
	@RequestMapping("/mrDelete")
	public String mrDelete(int m_num, int mr_num) {
		mvService.mrDelete(mr_num);
		return "redirect:/movie/movieDetail?m_num="+m_num+"#reply-content-content";
	}
	
}
