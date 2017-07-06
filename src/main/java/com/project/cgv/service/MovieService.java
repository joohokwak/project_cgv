package com.project.cgv.service;

import java.util.HashMap;
import java.util.List;

public interface MovieService {
	
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
	
	// screen
	public HashMap<String, Object> getScreen(int s_num);
	
	// movieTime
	public List<HashMap<String, Object>> movieTimeInfo(HashMap<String, Object> params);
	
	// seat
	public List<HashMap<String, Object>> seatList(int s_num);

}
