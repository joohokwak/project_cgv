package com.project.cgv.service;

import java.util.HashMap;
import java.util.List;

public interface NoticeService {
	public HashMap<String, Object> getAllNotice(int page); 
	public HashMap<String, Object> getNoticeByNum(int num);
	public boolean addNotice(HashMap<String,Object> params);
	public boolean modifyNotice(HashMap<String,Object> params);
	public boolean remove(int num);
	public List<HashMap<String,Object>> getMainNotice();
}
