package com.project.cgv.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cgv.dao.MovieDao;
import com.project.cgv.service.MovieService;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired private MovieDao mvDao;

	@Override
	public List<HashMap<String, Object>> movieList() {
		return mvDao.movieList();
	}

	@Override
	public HashMap<String, Object> movieDetail(int m_num) {
		return mvDao.movieDetail(m_num);
	}

	@Override
	public void likeUp(int m_num) {
		mvDao.likeUp(m_num);
	}

	@Override
	public int likeUpResult(int m_num) {
		return mvDao.likeUpResult(m_num);
	}

	@Override
	public void likeDown(int m_num) {
		if(mvDao.likeUpResult(m_num) > 0) {
			mvDao.likeDown(m_num);
		}
	}

	@Override
	public List<HashMap<String, Object>> stealcutList(int m_num) {
		return mvDao.stealcutList(m_num);
	}

	@Override
	public List<HashMap<String, Object>> trailerList(int m_num) {
		return mvDao.trailerList(m_num);
	}

	@Override
	public List<HashMap<String, Object>> theaterList() {
		return mvDao.theaterList();
	}

	@Override
	public List<HashMap<String, Object>> movieTimeInfo(HashMap<String, Object> params) {
		return mvDao.movieTimeInfo(params);
	}

	@Override
	public HashMap<String, Object> getTheater(int t_num) {
		return mvDao.getTheater(t_num);
	}

	@Override
	public String movieEndTime(HashMap<String, Object> params) {
		return mvDao.movieEndTime(params);
	}

	@Override
	public HashMap<String, Object> getScreen(int s_num) {
		return mvDao.getScreen(s_num);
	}

	@Override
	public List<HashMap<String, Object>> seatList(HashMap<String, Object> params) {
		return mvDao.seatList(params);
	}

	@Override
	public List<HashMap<String, Object>> timeGroupSeat(String mt_date) {
		return mvDao.timeGroupSeat(mt_date);
	}

	@Override
	public int reserveSign(HashMap<String, Object> params) {
		
		int s_num = Integer.parseInt((String)params.get("s_num"));
		String seat = (String)params.get("rv_seat");
		String dateStr = (String)params.get("rv_date");
		String timeStr = (String)params.get("rv_time");
		
		String date = dateStr.substring(0, dateStr.length()-3);
		String time = timeStr.split("~")[0];
		
		HashMap<String, Object> mtnum = new HashMap<String, Object>();
		mtnum.put("s_num", s_num);
		mtnum.put("mt_date", date);
		mtnum.put("mt_time", time);
		
		int mt_num = mtNumSearch(mtnum);
		
		seat = seat.trim();
		
		String[] s = seat.split(", ");
		
		for(int i = 0; i < s.length; i++) {
			HashMap<String, Object> seatin = new HashMap<String, Object>();
			seatin.put("s_num", s_num);
			seatin.put("mt_num", mt_num);
			seatin.put("seat_status", s[i]);
			
			mvDao.seatInsert(seatin);
		}
		
		return mvDao.reserveSign(params);
	}

	@Override
	public int mtNumSearch(HashMap<String, Object> params) {
		return mvDao.mtNumSearch(params);
	}

	@Override
	public void seatInsert(HashMap<String, Object> params) {
		mvDao.seatInsert(params);
	}
	
	
	
}
