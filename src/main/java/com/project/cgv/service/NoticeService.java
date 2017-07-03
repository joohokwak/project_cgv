package com.project.cgv.service;

import java.util.HashMap;
import java.util.List;

public interface NoticeService {
	public HashMap<String, Object> getAllNotice(int page); 
	public HashMap<String, Object> getNoticeByNum(int num);
}
