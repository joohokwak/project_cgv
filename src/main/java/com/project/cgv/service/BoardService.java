package com.project.cgv.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface BoardService {
	
	public HashMap<String,Object> getBoardList(HashMap<String, Object> params, int page);
	public void writeBoard(HashMap<String, Object> params, MultipartFile attachfile);
	public void updateBoard(HashMap<String, Object> params, MultipartFile attachfile);
	public HashMap<String, Object> viewBoard(int num);
	public void deleteBoard(int num);
	public void addHit (int num);

}
