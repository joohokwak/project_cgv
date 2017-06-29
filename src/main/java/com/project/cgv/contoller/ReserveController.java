package com.project.cgv.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reserve/*")
public class ReserveController {
	
	
	
	@RequestMapping("/ticketSelect")
	public String ticketSelect(Model model) {
		model.addAttribute("imgInfo", "h2_ticket.png");
		return ".reserve.ticket.main";
	}
	
}
