package com.project.cgv.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.cgv.service.NoticeService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping("/main")//.admin.layout.body
	public String mainForm(){
		return ".admin.layout.admin_body";
	}
}
