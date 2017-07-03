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
	public HashMap<String, Object> getAllNotice(int page) {
		
		HashMap<String,Object> result = new HashMap<String,Object>();
		
		//paging
		int totalCount = nDao.getCount();
		int currentPageNumber = page;
				
		Paging p = new Paging(totalCount,currentPageNumber);
		
		result.put("current", currentPageNumber);
		result.put("start", p.getStartPage());
		result.put("end", p.getEndPage());
		result.put("last", p.getPageTotalCount());
		
		HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("skip", p.getSkip());
		params.put("qty", p.getQty());
		
		List<HashMap<String, Object>> nList = nDao.selectAll(params);
		result.put("nList", nList);
		
		return result;
	}

	@Override
	public HashMap<String, Object> getNoticeByNum(int num) {
		System.out.println(nDao.selectOne(num));
		return nDao.selectOne(num);
	}

}
