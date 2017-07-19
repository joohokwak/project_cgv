package com.project.cgv.dao;

import java.util.HashMap;

public interface MemberDao {
	
	public HashMap<String, Object> getMember(String id);
	
	public void setMember(HashMap<String, Object> params);
	
	public void savePoint(HashMap<String, Object> params);
	
	public int updateFTheater(HashMap<String, Object> params);
	
	public HashMap<String, Object> findTheater(String t_name);
	
	public void memberUpdate(HashMap<String, Object> params);
}
