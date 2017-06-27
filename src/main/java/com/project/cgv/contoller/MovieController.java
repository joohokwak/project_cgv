package com.project.cgv.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.cgv.service.MovieService;

@Controller
public class MovieController {

	@Autowired private MovieService mvService;
	
	
	
}
