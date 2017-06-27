package com.project.cgv.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.cgv.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired private MemberService mService;
	
	@RequestMapping("/memberJoin")
	public String memberJoinForm() {
		return ".member.joinForm";
	}
	
}
