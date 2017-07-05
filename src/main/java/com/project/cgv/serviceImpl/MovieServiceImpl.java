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
	
	
	
}
