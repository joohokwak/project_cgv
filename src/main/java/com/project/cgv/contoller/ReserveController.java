package com.project.cgv.contoller;

import java.util.ArrayList;
import java.util.Calendar;
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
@RequestMapping("/reserve/*")
public class ReserveController {
	
	@Autowired private MovieService mvService;
	@Autowired private MemberService mService;
	
	@RequestMapping("/reserveHome")
	public ModelAndView ticketSelect(@RequestParam(value="m_num", defaultValue="0") int m_num) {
		ModelAndView mv = new ModelAndView(".reserve.ticket.main");
		mv.addObject("imgInfo", "h2_ticket.png");
		mv.addObject("movieList", mvService.movieList());
		mv.addObject("theaterList", mvService.theaterList());
		if(m_num != 0) {
			mv.addAllObjects(mvService.movieDetail(m_num));
		}
		
		return mv;
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
	
	/**
	 * @param params 
	 * @param model
	 * @return
	 */
	@RequestMapping("/reserveChoice")
	public String reserveChoiceForm(@RequestParam HashMap<String, Object> params, Model model) {
		int m_num = Integer.parseInt((String)params.get("movieInfo"));
		int t_num = Integer.parseInt((String)params.get("theaterInfo"));
		int s_num = Integer.parseInt((String)params.get("screenInfo"));
		
		// 영화정보
		model.addAttribute("movieInfo", mvService.movieDetail(m_num));
		// 극장 정보
		model.addAttribute("theaterInfo", mvService.getTheater(t_num));
		// 상영관정보
		model.addAttribute("screenInfo", mvService.getScreen(s_num));
		
		// 날짜(년-월-일-요일)
		model.addAttribute("dateInfo", params.get("dateInfo"));
		// 예약시간
		model.addAttribute("timeInfo", params.get("timeInfo"));
		
		// 선택 영화의 종료시간
		HashMap<String, Object> mte = new HashMap<String, Object>();
		mte.put("movieStartTime", params.get("timeInfo"));
		mte.put("m_num", Integer.parseInt((String)params.get("movieInfo")));
		model.addAttribute("movieEndTime", mvService.movieEndTime(mte));
		
		// 좌석의 행을 a,b,c 로 표시하기 위해 배열에 담기
		String[] seatABC = {  
				"/resources/images/reserve/reserve_abc/a.jpg", "/resources/images/reserve/reserve_abc/b.jpg", "/resources/images/reserve/reserve_abc/c.jpg",
				"/resources/images/reserve/reserve_abc/d.jpg", "/resources/images/reserve/reserve_abc/e.jpg", "/resources/images/reserve/reserve_abc/f.jpg",
				"/resources/images/reserve/reserve_abc/g.jpg", "/resources/images/reserve/reserve_abc/h.jpg", "/resources/images/reserve/reserve_abc/i.jpg",
				"/resources/images/reserve/reserve_abc/j.jpg", "/resources/images/reserve/reserve_abc/k.jpg", "/resources/images/reserve/reserve_abc/l.jpg",
			    "/resources/images/reserve/reserve_abc/m.jpg", "/resources/images/reserve/reserve_abc/n.jpg"};
		
		model.addAttribute("seatABC", seatABC);
		
		// 상영관의 좌석이 예약 되었는지 확인
		HashMap<String, Object> seatInfo = new HashMap<String, Object>();
		seatInfo.put("mt_time", params.get("timeInfo"));
		seatInfo.put("mt_date", params.get("mtDateInfo"));
		seatInfo.put("s_num", s_num);
		List<HashMap<String, Object>> seatList = mvService.seatList(seatInfo);
		
		// 예매가 완료된 시트의 상태값을 얻어서 담을 리스트
		List<String> seat = new ArrayList<String>();
		
		if(seatList.size() > 0){
			for(int i = 0; i < seatList.size(); i++){
				String t = (String)seatList.get(i).get("seat_status");
				char ch = t.substring(0, 1).charAt(0);
				seat.add((int)ch+":"+t.substring(1, t.length()));
			}

			model.addAttribute("seatList", seat);
		}
		
		return ".reserve.reserve.reserveChoice";
	}
	
	@RequestMapping("/selectPay")
	public ModelAndView selectPay(@RequestParam HashMap<String, Object> params, HttpSession session) {
		ModelAndView mv = new ModelAndView(".reserve.reserve.reservePay");
		mv.addAllObjects(params);
		
		int m_num = Integer.parseInt((String)params.get("m_num"));
		int t_num = Integer.parseInt((String)params.get("t_num"));
		int s_num = Integer.parseInt((String)params.get("s_num"));
		
		mv.addObject("movie", mvService.movieDetail(m_num));
		mv.addObject("screen", mvService.getScreen(s_num));
		mv.addObject("theater", mvService.getTheater(t_num));
		
		HashMap<String, Object> member = (HashMap<String, Object>)session.getAttribute("member");
		mv.addAllObjects(mService.getMember((String)member.get("id")));
		
		return mv;
	}
	
	@RequestMapping("/reserveSign")
	public String reserveSign(@RequestParam HashMap<String, Object> params) {
		int rv_pay = Integer.parseInt((String)params.get("rv_pay"));
		String id = (String)params.get("id");
		int result = mvService.reserveSign(params);
		
		if(result > 0) {
			double savePoint = rv_pay * 0.02;
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("point", savePoint);
			mService.savePoint(map);
		}
		
		return "redirect:/";
	}
	
}
