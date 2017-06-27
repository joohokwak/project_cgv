package com.project.cgv.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cgv.dao.MovieDao;
import com.project.cgv.service.MovieService;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired private MovieDao mvDao;
	
}
