package com.project.cgv.contoller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String boardWrite(@RequestParam HashMap<String, Object> params, RedirectAttributes r_attr){

		bService.writeBoard(params);
		r_attr.addFlashAttribute("msg","등록되었습니다");
		return "redirect:boardlist";
		
	}
	
	@RequestMapping("/boardview")
	public String ViewForm(Model model, @RequestParam int num, HttpSession session, HttpServletRequest request, HttpServletResponse response){

		HashMap<String, Object> member = (HashMap<String, Object>)session.getAttribute("member");
		HashMap<String, Object> viewBoard = bService.viewBoard(num);
		int countReply = bService.countReply(num);
		
		
		if(member != null && (viewBoard.get("id") != null && (viewBoard.get("id")).equals(member.get("id")) || (member.get("id")).equals("admin"))){
			model.addAttribute("mine", true);
			
		}else {
			model.addAttribute("mine", false);
		}
		
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
		model.addAttribute("countReply",countReply);
		
		return ".board.boardView";
		
	}	
	
	@RequestMapping("/delete")
	public String boardDelete(@RequestParam int num, RedirectAttributes r_attr){
		
		bService.deleteBoard(num);
		r_attr.addFlashAttribute("msg", "삭제되었습니다.");
		
		return "redirect:boardlist";
		
	}
	
	@RequestMapping("/boardupdate")
	public String UpdateForm(Model model, @RequestParam int num){
		
		HashMap<String, Object> viewBoard = bService.viewBoard(num);
		model.addAttribute("viewBoard", viewBoard);
		
		return ".board.boardUpdate";
		
	}
	
	@RequestMapping("/update")
	public String boardUpdate(@RequestParam HashMap<String, Object> params, RedirectAttributes r_attr){
		
		bService.updateBoard(params);
		r_attr.addFlashAttribute("msg", "수정되였습니다.");
		
		return "redirect:boardlist";
		
	}

		
	@RequestMapping(value = "/replies", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestParam HashMap<String, Object> params, HttpSession session){

		ResponseEntity<String>  entity = null;
		HashMap<String,Object> member = (HashMap<String,Object>)session.getAttribute("member");
		
		try {
			params.put("id", member.get("id"));
			bService.writeReply(params);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}	
	
	
	@RequestMapping(value = "/replies/all/{num}", method = RequestMethod.GET)
	public ResponseEntity<List<HashMap<String, Object>>> list(@PathVariable("num") int num){

		ResponseEntity<List<HashMap<String, Object>>> entity = null;
		try{
			
			entity = new ResponseEntity<List<HashMap<String, Object>>>(bService.getReplyList(num),HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<HashMap<String, Object>>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	
	}
	
	
	@RequestMapping(value = "/replies/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("rno") int rno){
	
		ResponseEntity<String> entity = null;
		
		try{
			bService.deleteReply(rno);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	
	
	}
	
	
	
}

