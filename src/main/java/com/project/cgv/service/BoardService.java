package com.project.cgv.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface BoardService {
	
	public HashMap<String,Object> getBoardList(HashMap<String, Object> params, int page);
	public void writeBoard(HashMap<String, Object> params);
	public void updateBoard(HashMap<String, Object> params);
	public HashMap<String, Object> viewBoard(int num);
	public void deleteBoard(int num);
	public void addHit (int num);
	
	public void writeReply(HashMap<String, Object> params) throws Exception;
	public List<HashMap<String, Object>> getReplyList(int num) throws Exception;
	public void deleteReply(int rno) throws Exception;
	public HashMap<String, Object> viewReply(int rno);
	public int countReply(int num);

}
