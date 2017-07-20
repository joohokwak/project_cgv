package com.project.cgv.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.cgv.dao.MovieDao;
import com.project.cgv.service.MovieService;
import com.project.cgv.util.MoviePaging;
import com.project.cgv.util.Paging;

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
	
	@Override
	public List<HashMap<String, Object>> showGenreList() {
		return mvDao.getGenreList();
	}

	@Override
	public HashMap<String, Object> showSearchResult(int page, HashMap<String, Object> option) {
		
		HashMap<String,Object> result = new HashMap<String,Object>();
		
		//paging 
		int totalCount = mvDao.getMovieCount();
		int currentPageNumber = page;
				
		Paging p = new Paging(totalCount,currentPageNumber);
		
		result.put("current", currentPageNumber);
		result.put("start", p.getStartPage());
		result.put("end", p.getEndPage());
		result.put("last", p.getPageTotalCount());
		
		HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("skip", p.getSkip());
		params.put("qty", p.getQty());
		params.put("keyword", option.get("keyword"));
		params.put("value", option.get("value"));
		
		
		List<HashMap<String, Object>> mList = mvDao.searchMovieList(params);
		result.put("mList", mList);
		
		return result;
		
	}
	
	@Transactional
	@Override
	public boolean addMovie(HashMap<String, Object> params) {
		
		if((String)params.get("site") == ""){
			params.put("site", null);
		}
		
		if((String)params.get("video1") == ""){
			params.put("video1", null);
		}
		
		if((String)params.get("video2") == ""){
			params.put("video2", null);
		}
		
		if((String)params.get("video3") == ""){
			params.put("video3", null);
		}
		
		
		List<String> addr = new ArrayList<String>();
		
		addr.add((String)params.get("video1"));
		addr.add((String)params.get("video2"));
		addr.add((String)params.get("video3"));
		
		int result = mvDao.insertMovie(params);
		int result2 = 0;
		
		HashMap<String,Object> video = new HashMap<String,Object>();
		video.put("num", params.get("num"));
		for(int i = 0; i < addr.size(); i++){
			
			if(i != 0 && result2 < 1){
				break;
			}
			
			video.put("addr", addr.get(i));
			result2 = mvDao.insertVideo(video);
			
		}
		
		if(result == 1 && result2 == 1){
			return true;
		}else{
			return false;
		}
	}

	@Transactional
	@Override
	public boolean modifyMovie(HashMap<String, Object> params) {
		if((String)params.get("site") == ""){
			params.put("site", null);
		}
		
		if((String)params.get("video1") == ""){
			params.put("video1", null);
		}
		
		if((String)params.get("video2") == ""){
			params.put("video2", null);
		}
		
		if((String)params.get("video3") == ""){
			params.put("video3", null);
		}
		
		
		List<String> addr = new ArrayList<String>();
		List<Integer> addr_num = new ArrayList<Integer>(); 
		
		addr.add((String)params.get("video1"));
		addr.add((String)params.get("video2"));
		addr.add((String)params.get("video3"));
		
		addr_num.add(Integer.parseInt((String) params.get("video1_num")));
		addr_num.add(Integer.parseInt((String) params.get("video2_num")));
		addr_num.add(Integer.parseInt((String) params.get("video3_num")));
		
		int result = mvDao.updateMovie(params);
		int result2 = 0;
		
		HashMap<String,Object> video = new HashMap<String,Object>();
		video.put("num", params.get("num"));
		for(int i = 0; i < addr.size(); i++){
			
			if(i != 0 && result2 < 1){
				break;
			}
			
			video.put("addr", addr.get(i));
			video.put("v_num", addr_num.get(i));
			
			result2 = mvDao.updateVideo(video);
			
		}
		
		if(result == 1 && result2 == 1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int mrInsert(HashMap<String, Object> params) {
		return mvDao.mrInsert(params);
	}

	@Override
	public List<HashMap<String, Object>> mrList(int m_num) {
		return mvDao.mrList(m_num);
	}

	@Override
	public int mrDelete(int mr_num) {
		return mvDao.mrDelete(mr_num);
	}

	@Override
	public HashMap<String, Object> movieAll(int pageNum) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		int totalCount = mvDao.movieTotalCount();
		
		MoviePaging p = new MoviePaging(totalCount, pageNum);
		
		int start = p.getSkip();
		int end = p.getQty();
		
		params.put("start", start);
		params.put("end", end);
		
		HashMap<String, Object> maps = new HashMap<String, Object>();
		maps.put("p", p);
		maps.put("mAll", mvDao.movieAll(params));
		
		return maps;
	}

	@Override
	public List<HashMap<String, Object>> reserveMoive() {
		return mvDao.reserveMoive();
	}

	@Override

	public List<HashMap<String, Object>> showScreenList() {
		return mvDao.selectAllScreen();
	}

	@Override
	public List<HashMap<String, Object>> showMoviesInfo() {
		return mvDao.selectMovieView();
	}

	@Override
	public boolean addMovieTime(HashMap<String, Object> params) {
	
		HashMap<String,Object> screen = new HashMap<String,Object>();
		HashMap<String,Object> movieTime = new HashMap<String,Object>();
		
		screen.put("s_title", params.get("s_title"));
		screen.put("t_num", params.get("t_num"));
		screen.put("m_num", params.get("m_num"));
		screen.put("seat", params.get("seat"));
		
		int result1 = mvDao.insertScreen(screen);
		
		movieTime.put("mt_date",params.get("mt_date"));
		movieTime.put("mt_time", params.get("mt_time"));
		movieTime.put("s_num", screen.get("num"));
		
		int result2 = mvDao.insertMovieTime(movieTime);
		
		if(result1 == 1 && result2 == 1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean removeMovieTime(int num) {
		int result = mvDao.deleteMovieTime(num);
		
		if(result == 1){
			return true;
		}else{
			return false;
		}
	}
	public List<HashMap<String, Object>> salseManagement() {
		return mvDao.salseManagement();
	}
	
	
}
