package com.project.cgv.serviceImpl;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.cgv.dao.ActorDao;
import com.project.cgv.dao.MovieDao;
import com.project.cgv.service.UploadService;

@Service
public class UploadServiceImpl implements UploadService {
	
	@Autowired
	private MovieDao mDao;
	
	@Autowired 
	private ActorDao aDao;

	@Transactional
	@Override
	public void uploadFile(HashMap<String,Object> params) {
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) params.get("files"); 
		
		Iterator<String> itr =  multipartRequest.getFileNames();
		//test 경로. 실제 경로 주입할 때는 option마다 따로 주어야 함.
        String filePath = "";
        String option = (String) params.get("option");
        String num = (String) params.get("num");
        
        if(option.equals("영화")){
        	filePath = "/resources/images/movie/poster";
        }else if(option.equals("배우")){
        	filePath = "/resources/images/actor";
        }else if(option.equals("스틸컷")){
        	filePath = "/resources/images/movie/stealcut";
        }
        
        HashMap<String,Object> inputData = new HashMap<String,Object>();
		
		while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            
            //테스트후 지우자
            String originFileName = mpf.getOriginalFilename();
            
            String saveFileName = makeFileName(originFileName);
            String fileFullPath = multipartRequest.getServletContext().getRealPath(filePath)+"/"+saveFileName; //파일 전체 경로
            
            inputData.put("num", num);
            inputData.put("image", saveFileName);
            
            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath));
                if(option.equals("영화")){
                	mDao.updatePoster(inputData);
                }else if(option.equals("배우")){
                	aDao.updateActorImage(inputData);
                }else if(option.equals("스틸컷")){
                	mDao.insertStealCut(inputData);
                }
      
            } catch (Exception e) {
                System.out.println("postTempFile_ERROR======>"+fileFullPath);
                e.printStackTrace();
            }
       }//while	
		
	}
	
	//파일 이름을 생성
	private String makeFileName(String originalName){
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		return savedName;
	}

}

























