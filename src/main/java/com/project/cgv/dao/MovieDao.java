package com.project.cgv.dao;

import java.util.HashMap;
import java.util.List;

public interface MovieDao {

	// movie
	public List<HashMap<String, Object>> movieList();
	public HashMap<String, Object> movieDetail(int m_num);
	public void likeUp(int m_num);
	public int likeUpResult(int m_num);
	public void likeDown(int m_num);
	public String movieEndTime(HashMap<String, Object> params);
	
	// stealcut
	public List<HashMap<String, Object>> stealcutList(int m_num);
	
	// trailer
	public List<HashMap<String, Object>> trailerList(int m_num);
	
	// theater
	public List<HashMap<String, Object>> theaterList();
	public HashMap<String, Object> getTheater(int t_num);
	
	// movieTime
	public List<HashMap<String, Object>> movieTimeInfo(HashMap<String, Object> params);
	
}
