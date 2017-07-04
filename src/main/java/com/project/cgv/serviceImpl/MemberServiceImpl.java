package com.project.cgv.serviceImpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cgv.dao.MemberDao;
import com.project.cgv.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired private MemberDao mDao;

	@Override
	public HashMap<String, Object> loginCheck(HashMap<String, Object> params) {
		
		String id = (String) params.get("id");
		String pass = (String) params.get("pass");
		
		HashMap<String, Object> member = mDao.getMember(id);
		
		if(member != null) {
			if(member.get("pass").equals(pass)) {
				return member;
			}
		}
		
		return null;
	}
	
}
