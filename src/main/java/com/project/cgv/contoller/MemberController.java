package com.project.cgv.contoller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(HttpSession session, @RequestParam HashMap<String, Object> params) {
		HashMap<String, Object> member = mService.loginCheck(params);
		
		if(member != null) {
			session.setAttribute("member", member);
			return "redirect:/";
		}else {
			return "redirect:/member/login";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
