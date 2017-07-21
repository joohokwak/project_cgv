package com.project.cgv.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cgv.dao.NoticeDao;
import com.project.cgv.service.NoticeService;
import com.project.cgv.util.Paging;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao nDao;

	@Override
	public HashMap<String, Object> getAllNotice(int page, HashMap<String,Object> option) {
		
		HashMap<String,Object> result = new HashMap<String,Object>();
		
		HashMap<String,Object> cParams = new HashMap<String,Object>();
		
		
		cParams.put("keyword", option.get("keyword"));
		cParams.put("val", option.get("val"));
		
		//paging
		int totalCount = 0;
		totalCount = nDao.getSearchCount(cParams);	

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
		params.put("val", option.get("val"));
		
		List<HashMap<String, Object>> nList = nDao.selectAll(params);
		result.put("nCount", nDao.getSearchCount(params));
		
		
		result.put("nList", nList);
		
		return result;
	}

	@Override
	public HashMap<String, Object> getNoticeByNum(int num) {
		return nDao.selectOne(num);
	}

	@Override
	public boolean addNotice(HashMap<String, Object> params) {
		
		HashMap<String,Object> notice = new HashMap<String,Object>();
		
		int insert = nDao.insertNotice(params);
		
		if(insert == 1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean modifyNotice(HashMap<String, Object> params) {
		
		int update = nDao.updateNotice(params);
		
		if(update == 1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean remove(int num) {
		
		int delete = nDao.deleteNotice(num);
		
		if(delete == 1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<HashMap<String,Object>> getMainNotice() {
		return nDao.bodyNoticeList();
	}

	@Override
	public void upCountHit(int num) {
		nDao.updateHit(num);
	}

}
