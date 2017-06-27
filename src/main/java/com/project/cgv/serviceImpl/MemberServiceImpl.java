package com.project.cgv.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cgv.dao.MemberDao;
import com.project.cgv.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired private MemberDao mDao;
	
}
