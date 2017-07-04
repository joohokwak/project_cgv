package com.project.cgv.contoller;

import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.cgv.service.MovieService;

@Controller
@RequestMapping("/reserve/*")
public class ReserveController {
	
	@Autowired private MovieService mvService;
	
	@RequestMapping("/reserveHome")
	public String ticketSelect(Model model, @RequestParam(value="m_num", defaultValue="1") int m_num) {
		model.addAttribute("imgInfo", "h2_ticket.png");
		model.addAttribute("movieList", mvService.movieList());
		model.addAttribute("theaterList", mvService.theaterList());
		model.addAttribute("m_num", m_num);
		return ".reserve.ticket.main";
	}
	
	@ResponseBody
	@RequestMapping("/reserve_date")
	public HashMap<String, Object> reserve_date() {
		Calendar cal = Calendar.getInstance();
		int toYear = cal.get(Calendar.YEAR);
		int toMonth = cal.get(Calendar.MONTH) + 1;
		int toDate = cal.get(Calendar.DAY_OF_MONTH);
		int toDay = cal.get(Calendar.DAY_OF_WEEK) - 1;
		int lastDate = cal.getMaximum(Calendar.DATE);
		
		int nextMonth = toMonth + 1;
		
		if(nextMonth == 13){
			nextMonth=1;
		}
		
		cal.set(toYear, nextMonth, 1);
		int nextLastDate = cal.getMaximum(Calendar.DATE);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("toYear", toYear);
		map.put("toMonth", toMonth);
		map.put("toDate", toDate);
		map.put("toDay", toDay);
		map.put("lastDate", lastDate);
		map.put("nextMonth", nextMonth);
		map.put("nextLastDate", nextLastDate);
		
		return map;
	}
	
}
