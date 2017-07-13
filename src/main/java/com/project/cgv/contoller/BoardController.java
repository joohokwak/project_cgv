package com.project.cgv.contoller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.fabric.xmlrpc.base.Params;
import com.mysql.jdbc.StringUtils;
import com.project.cgv.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired private BoardService bService;
	/*@Autowired private BoardService bService;*/
	
	@RequestMapping("/boardlist")
	public String boardList(Model model,@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,@RequestParam(defaultValue="1")int page) {
		
		HashMap<String,Object> params = new HashMap<String,Object>();		
		
		params.put("keyword", keyword);
		params.put("type", type);
		
		if(type==1){
			//제목
			params.put("b_title", keyword);
		}else if(type==2){
			//내용
			params.put("b_content", keyword);
		}else if(type==3){
			//제목+내용
			params.put("b_title", keyword);
			params.put("b_content", keyword);
		}else if(type==4){
			//작성자
			params.put("b_writer", keyword);
		}
		
		HashMap<String,Object> viewData = bService.getBoardList(params, page); 		

		model.addAttribute("viewData", viewData);
		return ".board.boardList";
		
	}

	@RequestMapping("/boardwrite")
	public String WriteForm(){
		
		return ".board.boardWrite";
	}
	
	@RequestMapping("/write")
	public String boardWrite(@RequestParam HashMap<String, Object> params, MultipartFile attachfile){

		bService.writeBoard(params,attachfile);
		return "redirect:boardlist";
		
	}
	
	@RequestMapping("/boardview")
	public String ViewForm(Model model, @RequestParam int num, HttpSession session, HttpServletRequest request, HttpServletResponse response){

		HashMap<String, Object> member = (HashMap<String, Object>)session.getAttribute("member");
		HashMap<String, Object> viewBoard = bService.viewBoard(num);
				
		if(member != null && viewBoard.get("id") != null && (viewBoard.get("id")).equals(member.get("id"))){
			model.addAttribute("mine", true);
			
		}else {
			model.addAttribute("mine", false);
		}
		
		// 조회수
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
			
			bService.addHit(num);
		}
		
		
		model.addAttribute("viewBoard", viewBoard);
		return ".board.boardView";
		
	}	
	
	@RequestMapping("/delete")
	public String boardDelete(@RequestParam int num){
		
		bService.deleteBoard(num);
		return "redirect:boardlist";
		
	}
	
	@RequestMapping("/boardupdate")
	public String UpdateForm(Model model, @RequestParam int num){
		
		HashMap<String, Object> viewBoard = bService.viewBoard(num);
		model.addAttribute("viewBoard", viewBoard);
		return ".board.boardUpdate";
		
	}
	
	@RequestMapping("/update")
	public String boardUpdate(@RequestParam HashMap<String, Object> params, MultipartFile attachfile){
		
		bService.updateBoard(params,attachfile);
		return "redirect:boardlist";
		
	}

		
	
	
	
	
}

