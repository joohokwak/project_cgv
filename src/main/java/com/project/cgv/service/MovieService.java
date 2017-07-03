package com.project.cgv.service;

import java.util.HashMap;
import java.util.List;

public interface MovieService {
	
	public List<HashMap<String, Object>> movieList();
	public HashMap<String, Object> movieDetail(int m_num);
	public void likeUp(int m_num);
	public int likeUpResult(int m_num);
	public void likeDown(int m_num);
	
	// stealcut
	public List<HashMap<String, Object>> stealcutList(int m_num);
	
	// trailer
	public List<HashMap<String, Object>> trailerList(int m_num);

}
