package com.project.cgv.dao;

import java.util.HashMap;
import java.util.List;

public interface NoticeDao {
	public List<HashMap<String,Object>> selectAll(HashMap<String,Object> params);
	public HashMap<String,Object> selectOne(int num);
	public int getCount();
}
