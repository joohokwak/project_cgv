package com.project.cgv.service;

import java.util.HashMap;

public interface MemberService {

	public HashMap<String, Object> loginCheck(HashMap<String, Object> params);
	
	public String setMember(HashMap<String, Object> params);
	
	public int idCheck(String id);
	
	public void savePoint(HashMap<String, Object> params);
	
	public HashMap<String, Object> getMember(String id);
	
	public void updateFtheater(HashMap<String, Object> params);
}
