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

	@Override
	public String setMember(HashMap<String, Object> params) {
		
		String birth = (String)params.get("birthYear")+"."+(String)params.get("birthMonth")+"."+(String)params.get("birthDay");
		String phone = (String)params.get("phone1")+"-"+(String)params.get("phone2")+"-"+(String)params.get("phone3");
		String email = (String)params.get("email_id")+"@"+(String)params.get("email_domain");
		
		params.put("birth", birth);
		params.put("phone", phone);
		params.put("email", email);
		
		mDao.setMember(params);
		String id = (String)params.get("id");
		HashMap<String, Object> member = mDao.getMember(id);
		

		if(member != null){
			return ".reserve.member.joincomplate";
		}else{
			return "redirect:/member/memberJoin";
		}
	}

	@Override
	public int idCheck(String id) {
		HashMap<String, Object> member = getMember(id);
		if(member != null){
			return 1;
		}else{
			return 0;
		}
	}

	@Override
	public void savePoint(HashMap<String, Object> params) {
		mDao.savePoint(params);
	}

	@Override
	public HashMap<String, Object> getMember(String id) {
		return mDao.getMember(id);
	}

	@Override
	public void updateFtheater(HashMap<String, Object> params) {
		mDao.updateFTheater(params);
	}

	@Override
	public int memberFupdate(HashMap<String, Object> params) {
		return mDao.updateFTheater(params);
	}

	@Override
	public HashMap<String, Object> findTheater(String t_name) {
		return mDao.findTheater(t_name);
	}
	
	
	
}
