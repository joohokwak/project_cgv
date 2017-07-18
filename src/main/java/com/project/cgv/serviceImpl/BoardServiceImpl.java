package com.project.cgv.serviceImpl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.project.cgv.dao.BoardDao;
import com.project.cgv.service.BoardService;
import com.project.cgv.util.Paging;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired private BoardDao bDao;

	@Override
	public HashMap<String,Object> getBoardList(HashMap<String, Object> params, int page) {
		
		HashMap<String,Object> result = new HashMap<String,Object>();
		
		int totalCount = bDao.getCount();		
		Paging paging = new Paging(totalCount, page);	
		int last = paging.getPageTotalCount();
		int start = paging.getStartPage();//page : 1일떄  (board table에 있는)1번째글  / page : 2일때 11번째글  / page : 3일때 21번째 글
		int end = paging.getEndPage();//qty -> 페이지에 보여줄 글의 개수 -> paging객체에 있는 countPerPage와 같음.
		
		params.put("skip", paging.getSkip());
		params.put("qty", paging.getQty());//qty -> 페이지에 보여줄 글의 개수 -> paging객체에 있는 countPerPage와 같음.		
		
		List<HashMap<String,Object>> boardList = bDao.searchBoard(params);
				
		result.put("current", page);//현재 페이지 번호
		result.put("last", last);//페이지의 총 개수
		result.put("board", boardList);//board
		result.put("start", start);
		result.put("end", end);
		
		//현재 페이지 번호 -> page
		return result;
		
	}

	@Override
	public void writeBoard(HashMap<String, Object> params) {
		
		bDao.insertBoard(params);
		
	}

	
	@Override
	public HashMap<String, Object> viewBoard(int num) {
		
		HashMap<String, Object> result = bDao.selectOne(num);

		
		return result;
	}

	
	@Override
	public void deleteBoard(int num) {
		
		bDao.deleteReplyBoard(num);
		bDao.deleteBoard(num);
		
	}

	@Override
	public void updateBoard(HashMap<String, Object> params) {
		
		bDao.updataBoard(params);
		
	}

	@Override
	public void addHit(int num) {
		
		bDao.addHit(num);
	}


	@Override
	public void writeReply(HashMap<String, Object> params)  throws Exception {
		bDao.insertReply(params);
		
	}

	@Override
	public List<HashMap<String, Object>> getReplyList(int num) {
		
		return bDao.selectAllReply(num);
	}


	@Override
	public void deleteReply(int rno) {
		
		bDao.deleteReply(rno);
		
	}

	@Override
	public HashMap<String, Object> viewReply(int rno) {
		
		return bDao.seletOneReply(rno);
	}


	

	
	
}
