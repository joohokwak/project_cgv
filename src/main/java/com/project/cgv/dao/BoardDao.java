package com.project.cgv.dao;

import java.util.HashMap;
import java.util.List;

public interface BoardDao {
	
	public void insertBoard(HashMap<String, Object> params);
	public void updataBoard(HashMap<String, Object> params);
	public void deleteBoard(int num);
	public List<HashMap<String, Object>> selectAll(HashMap<String,Object> params);
	public List<HashMap<String, Object>> searchBoard(HashMap<String, Object> params);	
	public HashMap<String, Object> selectOne (int num);
	public void addHit (int num);
	public int getCount();	
	
	public void insertReply(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectAllReply(int num);
	public void deleteReply(int rno);
	public HashMap<String,Object> seletOneReply(int rno);
	public void deleteReplyBoard(int num);
	public int getCountReply(int num);
	
	public int selectCount(HashMap<String, Object> params);

}
