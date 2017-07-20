package com.project.cgv.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cgv.dao.ActorDao;
import com.project.cgv.service.ActorService;
import com.project.cgv.util.Paging;

@Service
public class ActorServiceImpl implements ActorService{
	
	@Autowired
	private ActorDao aDao;
	
	@Override
	public List<HashMap<String, Object>> showActorList() {
		return aDao.getActorList();
	}

	@Override
	public HashMap<String, Object> showActorList(int page) {
		
		HashMap<String,Object> result = new HashMap<String,Object>();
		
		//paging
		int totalCount = aDao.getActorCount();
		int currentPageNumber = page;
				
		Paging p = new Paging(totalCount,currentPageNumber);
		
		result.put("current", currentPageNumber);
		result.put("start", p.getStartPage());
		result.put("end", p.getEndPage());
		result.put("last", p.getPageTotalCount());
		
		HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("skip", p.getSkip());
		params.put("qty", p.getQty());
		
		List<HashMap<String, Object>> aList = aDao.selectAllActor(params);
		result.put("aList", aList);
		
		return result;
	}
	
	@Override
	public HashMap<String, Object> showActor(int num) {
		return aDao.selectActor(num);
	}

	@Override
	public boolean addActor(HashMap<String, Object> params) {
		HashMap<String,Object> actor = new HashMap<String,Object>();
		
		int insert = aDao.insertActor(params);
		
		if(insert == 1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean modifyActor(HashMap<String, Object> params) {
		int update = aDao.updateActor(params);
		
		if(update == 1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean removeActor(int num) {
		int delete = aDao.deleteActor(num);
		
		if(delete == 1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<HashMap<String, Object>> getMovieActor(int m_num) {
		return aDao.getMovieActor(m_num);
	}
}
