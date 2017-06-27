package com.project.cgv.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cgv.dao.BoardDao;
import com.project.cgv.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired private BoardDao bDao;
	
}
