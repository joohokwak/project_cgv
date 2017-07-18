package com.project.cgv.dao;

import java.util.HashMap;
import java.util.List;

public interface NoticeDao {
	public List<HashMap<String,Object>> selectAll(HashMap<String,Object> params);
	public List<HashMap<String,Object>> bodyNoticeList();
	public HashMap<String,Object> selectOne(int num);
	public int getCount();
	public int getSearchCount(HashMap<String,Object> params);
	public int insertNotice(HashMap<String,Object> params);
	public int updateNotice(HashMap<String,Object> params);
	public int deleteNotice(int num);
}
