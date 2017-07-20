package com.project.cgv.service;
 
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;


public interface MemberService {

	public HashMap<String, Object> loginCheck(HashMap<String, Object> params);
	
	public String setMember(HashMap<String, Object> params);
	
	public int idCheck(String id);
	
	public void savePoint(HashMap<String, Object> params);
	
	public HashMap<String, Object> getMember(String id);
	
	public void updateFtheater(HashMap<String, Object> params);
	
	public int memberFupdate(HashMap<String, Object> params);
	
	public HashMap<String, Object> findTheater(String t_name);
	
	public String memberUpdate(HashMap<String, Object> params, HttpSession session, MultipartFile file);
	
	String memberUpdateAdmin(HashMap<String, Object> params, HttpSession session, MultipartFile file);
	
	public List<HashMap<String, Object>> reserveList(HashMap<String, Object> params);
	
	public HashMap<String,Object> showMembers(int page);

	

}
