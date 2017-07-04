package com.project.cgv.contoller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.cgv.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping("/list")
	public String noticeList(Model model,@RequestParam(defaultValue="1")int page) {
		
		HashMap<String,Object> viewData = nService.getAllNotice(page);
		
		model.addAttribute("viewData",viewData);
		
		return ".admin.notice.noticeList";
	}
	
	@RequestMapping("/view")
	public String noticeView(Model model, int num){
		
		model.addAttribute("notice",nService.getNoticeByNum(num));
		
		return ".admin.notice.noticeView";
	}
}
