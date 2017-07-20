package com.project.cgv.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cgv.dao.ManageDao;
import com.project.cgv.service.ManageService;
import com.project.cgv.util.Paging;

@Service
public class ManageServiceImpl implements ManageService {
	
	@Autowired
	public ManageDao mgDao;

	@Override
	public HashMap<String, Object> showConnectionList(int page, HashMap<String,Object> option) {
		//aDao.getActorList();
		HashMap<String,Object> result = new HashMap<String,Object>();
		
		//paging
		int totalCount = mgDao.getConnectionCount();
		int currentPageNumber = page;
				
		Paging p = new Paging(totalCount,currentPageNumber);
		
		result.put("current", currentPageNumber);
		result.put("start", p.getStartPage());
		result.put("end", p.getEndPage());
		result.put("last", p.getPageTotalCount());
		
		HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("skip", p.getSkip());
		params.put("qty", p.getQty());
		
		List<HashMap<String, Object>> mgList = mgDao.getConnectionList(params);
		result.put("mgList", mgList);
		
		return result;
	}

	@Override
	public boolean addConnection(HashMap<String, Object> params) {
		HashMap<String,Object> actor = new HashMap<String,Object>();
		
		try {
			mgDao.insertConnection(params);
			return true;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean removeConnection(int num) {
		int delete = mgDao.deleteConnection(num);
		
		if(delete == 1){
			return true;
		}else{
			return false;
		}
	}

}
