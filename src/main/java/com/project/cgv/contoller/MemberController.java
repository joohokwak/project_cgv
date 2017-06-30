package com.project.cgv.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.cgv.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired private MemberService mService;
	
	@RequestMapping("/memberJoin")
	public String memberJoinForm() {
		return ".reserve.member.joinForm";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		return ".member.loginForm";
	}
	
}
