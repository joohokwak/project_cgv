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

}
