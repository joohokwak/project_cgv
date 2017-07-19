package com.project.cgv.contoller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.cgv.service.MemberService;
import com.project.cgv.service.MovieService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired private MemberService mService;
	@Autowired private MovieService mvService;
	
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
		model.addAttribute("reserve",mService.reserveList(member));
		
		
		
		return ".member.myCGV";
	}
	
	@RequestMapping("/memberUpdatePop")
	public String popup() {
		return "/member/memberUpdatePop";
	}
	
	@RequestMapping("/favoriteTheaterPop")
	public String fPopup(Model model,HttpSession session) {
		List<HashMap<String, Object>> tList = mvService.theaterList();
		model.addAttribute("tList",tList);
		return "/member/favoriteTheaterPop";
	}
	
	@ResponseBody
	@RequestMapping("/memberFupdate")
	public String memberFupdate(@RequestParam HashMap<String, Object> params,HttpSession session){
		int result = mService.memberFupdate(params);
		HashMap<String, Object> member = (HashMap<String, Object>)session.getAttribute("member");
		if(result > 0) {
			session.setAttribute("member", mService.getMember((String)member.get("id")));
			return "success";
		}
		
		return "fail";
	}
	
	@ResponseBody
	@RequestMapping(value= "/findTheater" , method=RequestMethod.POST)
	public HashMap<String, Object> findTheater(@RequestParam("t_name") String t_name){
		return mService.findTheater(t_name);
	}
	
	@ResponseBody
	@RequestMapping(value= "/memberUpdate" , method=RequestMethod.POST)
	public HashMap<String, String> memberUpdate(@RequestParam HashMap<String, Object> params, HttpSession session, @RequestParam MultipartFile file){
		HashMap<String, Object> member = (HashMap<String, Object>)session.getAttribute("member");
		String id = (String)member.get("id");
		String phone = (String)params.get("num1")+"-"+(String)params.get("num2")+"-"+(String)params.get("num3");
		String email = (String)params.get("emailId")+"@"+(String)params.get("emailDomain");
		params.put("id", id);
		params.put("phone", phone);
		params.put("email", email);
		
		String str = mService.memberUpdate(params,session,file);
		
		member = mService.loginCheck(params);
		session.setAttribute("member", member);
		
		HashMap<String, String> result = new HashMap<String, String>();
		result.put("result", str);
		
		return result;
		
	}
	
	
}
