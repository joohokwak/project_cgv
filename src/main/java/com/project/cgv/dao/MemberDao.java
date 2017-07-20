package com.project.cgv.dao;

import java.util.HashMap;
import java.util.List;

public interface MemberDao {
	
	public HashMap<String, Object> getMember(String id);
	
	public void setMember(HashMap<String, Object> params);
	
	public void savePoint(HashMap<String, Object> params);
	
	public int updateFTheater(HashMap<String, Object> params);
	
	public HashMap<String, Object> findTheater(String t_name);
	
	public void memberUpdate(HashMap<String, Object> params);
	
	public List<HashMap<String, Object>> reserveList(HashMap<String, Object> params);

	public int getMemberCount();

	public List<HashMap<String, Object>> selectAllMember(HashMap<String, Object> params);
	
	public int deleteReserve(int rv_num);
	
	public int findMtNum(HashMap<String, Object> params);
	
	public void deleteSeat(HashMap<String, Object> params);
}
