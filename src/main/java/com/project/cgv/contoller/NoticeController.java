package com.project.cgv.contoller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.jdbc.StringUtils;
import com.project.cgv.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping("/list")
	public String noticeList(Model model,@RequestParam(defaultValue="1")int page,
			@RequestParam(required=false) HashMap<String,Object> option){
		
		HashMap<String,Object> viewData = nService.getAllNotice(page, option);
		
		model.addAttribute("viewData",viewData);
		
		return ".notice.noticeList";
	}
	
	@RequestMapping("/view")
	public String noticeView(Model model, int num, HttpServletRequest request, HttpServletResponse response){
		
		Cookie[] cookies = request.getCookies();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(cookies != null) {
			for(int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				map.put(cookie.getName(), cookie.getValue());
			}
		}
		
		String readCount = (String)map.get("readCount");
		String newReadCount = "|" + num;
		
		if(StringUtils.indexOfIgnoreCase(readCount, newReadCount) == -1) {
			Cookie cookie = new Cookie("readCount", readCount + newReadCount);
			response.addCookie(cookie);
			
			nService.upCountHit(num);
		}
		
		model.addAttribute("notice",nService.getNoticeByNum(num));
		model.addAttribute("prevInfo",nService.getNoticeByNum(num+1));
		model.addAttribute("nextInfo",nService.getNoticeByNum(num-1));
		
		return ".notice.noticeView";
	}
}
