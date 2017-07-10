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
	public List<HashMap<String, Object>> timeGroupSeat(String mt_date);
	public int mtNumSearch(HashMap<String, Object> params);
	
	// seat
	public void seatInsert(HashMap<String, Object> params);
	public List<HashMap<String, Object>> seatList(HashMap<String, Object> params);
	
	// reserve
	public int reserveSign(HashMap<String, Object> params);
	

	//genre
	public List<HashMap<String,Object>> showGenreList();
	
	public boolean addMovie(HashMap<String,Object> params);
	
	public HashMap<String,Object> showSearchResult(int page, HashMap<String,Object> option);

}
