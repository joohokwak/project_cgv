package com.project.cgv.contoller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.cgv.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired private MemberService mService;
	
	@RequestMapping("/memberJoin")
	public String memberJoinForm() {
		return ".reserve.member.joinForm";
	}
	
	@RequestMapping("/memberJoinsubmit")
	public ModelAndView memberJoin(@RequestParam HashMap<String, Object> params){
		ModelAndView mv = new ModelAndView();
		mv.setViewName( mService.setMember(params));
		mv.addObject(params);
		return mv;
	}

	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.POST )
	public int idcheck(@RequestParam("id") String id){
		return mService.idCheck(id);
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
	
	@ResponseBody
	@RequestMapping("/loginCheck")
	public String loginCheck(HttpSession session) {
		
		if(session.getAttribute("member") != null) {
			return "login";
		}
		
		return "unlogin";
	}
	
	@ResponseBody
	@RequestMapping("/reserveLogin")
	public HashMap<String, String> reserveLogin(HttpSession session, @RequestParam HashMap<String, Object> params) {
		HashMap<String, Object> member = mService.loginCheck(params);
		
		HashMap<String, String> result = new HashMap<String, String>();
		
		if(member != null) {
			session.setAttribute("member", member);
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@RequestMapping("/mycgv")
	public String myCGV(Model model, HttpSession session) {
		model.addAttribute("imgInfo", "h2_mycgv.png");
		
		HashMap<String, Object> member = (HashMap<String, Object>)session.getAttribute("member");
		model.addAllAttributes(mService.getMember((String)member.get("id")));
		
		return ".reserve.member.myCGV";
	}
	
	@RequestMapping("/memberUpdatePop")
	public String popup() {
		return "/member/memberUpdatePop";
	}
	
	
	
}
