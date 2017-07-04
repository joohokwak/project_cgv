package com.project.cgv.contoller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.cgv.service.NoticeService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	//member, board, notice, movie, actor 관리하는 controller
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping("/main")//.admin.layout.body
	public String mainForm(){
		return ".admin.layout.admin_body";
	}
	
	@RequestMapping("/notice/insertForm")
	public String noticeInsertForm(){
		return ".admin.notice.noticeInsertForm";
	}
	
	@RequestMapping("/notice/result")
	public String noticeResult(){
		return ".admin.notice.noticeResult";
	}
	
	@RequestMapping("/notice/list")
	public String noticeList(Model model, @RequestParam(defaultValue="1")int page){
		
		HashMap<String,Object> viewData = nService.getAllNotice(page);
		
		model.addAttribute("viewData",viewData);
		
		return ".admin.notice.noticeList";
	}
	
	@RequestMapping("/notice/view")
	public String noticeView(Model model, int num){
		
		model.addAttribute("notice",nService.getNoticeByNum(num));
		
		return ".admin.notice.noticeView";
	}
	
	@RequestMapping("/notice/insert")
	public String noticeInsert(Model model,@RequestParam HashMap<String,Object> params){
		boolean result = nService.addNotice(params);
		
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 입력되었습니다.";
			loc="/admin/notice/list";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:result";
	}
	
	@RequestMapping("/notice/updateForm")
	public String noticeUpdateForm(Model model, int num){
		model.addAttribute("notice",nService.getNoticeByNum(num));
		return ".admin.notice.noticeUpdateForm";
	}
	
	@RequestMapping("/notice/update")
	public String noticeUpdate(Model model, @RequestParam HashMap<String,Object> params){
		
		boolean result = nService.addNotice(params);
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 수정되었습니다.";
			loc="/notice/list";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:result";
	}
	
	@RequestMapping("/notice/delete")
	public String noticeDelete(Model model, int num){
		
		boolean result = nService.remove(num);
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 삭제되었습니다.";
			loc="/notice/list";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:result";
	}
}














