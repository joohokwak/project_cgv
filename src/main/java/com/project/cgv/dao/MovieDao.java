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
	public List<HashMap<String, Object>> getGenreList();
	
	public int insertMovie(HashMap<String,Object> params);
	public int updateMovie(HashMap<String,Object> params);
	public int updatePoster(HashMap<String,Object> params);
	public int deleteMovie(int num);
	
	public List<HashMap<String,Object>> searchMovieList(HashMap<String,Object> option);
	public int getMovieCount();
	
	
	// movie_re
	public int mrInsert(HashMap<String, Object> params);
	public List<HashMap<String, Object>> mrList(int m_num);
	public int mrDelete(int mr_num);
	
}
