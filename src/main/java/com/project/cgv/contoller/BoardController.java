package com.project.cgv.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.cgv.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired private BoardService bService;
	
	@RequestMapping("/boardlist")
	public String boardList() {
		return ".board.boardList";
	}
}
