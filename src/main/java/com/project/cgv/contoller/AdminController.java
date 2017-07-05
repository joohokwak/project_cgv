package com.project.cgv.contoller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

import com.project.cgv.service.NoticeService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	//member, board, notice, movie, actor 관리하는 controller
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping("/main")//.admin.layout.body
	public String mainForm(){
		return ".admin.layout.admin_body";
	}
	
	// Notice Start ///////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("/notice/insertForm")
	public String noticeInsertForm(){
		return ".admin.notice.noticeInsertForm";
	}
	
	@RequestMapping("/notice/result")
	public String noticeResult(){
		return ".admin.notice.noticeResult";
	}
	
	@RequestMapping("/notice/list")
	public String noticeList(Model model, @RequestParam(defaultValue="1")int page){
		
		HashMap<String,Object> viewData = nService.getAllNotice(page);
		
		model.addAttribute("viewData",viewData);
		
		return ".admin.notice.noticeList";
	}
	
	@RequestMapping("/notice/view")
	public String noticeView(Model model, int num){
		
		model.addAttribute("notice",nService.getNoticeByNum(num));
		
		return ".admin.notice.noticeView";
	}
	
	@RequestMapping("/notice/insert")
	public String noticeInsert(Model model,@RequestParam HashMap<String,Object> params){
		boolean result = nService.addNotice(params);
		
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 입력되었습니다.";
			loc="/admin/notice/list";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:result";
	}
	
	@RequestMapping("/notice/updateForm")
	public String noticeUpdateForm(Model model, int num){
		model.addAttribute("notice",nService.getNoticeByNum(num));
		return ".admin.notice.noticeUpdateForm";
	}
	
	@RequestMapping("/notice/update")
	public String noticeUpdate(Model model, @RequestParam HashMap<String,Object> params){
		
		boolean result = nService.addNotice(params);
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 수정되었습니다.";
			loc="/notice/list";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:result";
	}
	
	@RequestMapping("/notice/delete")
	public String noticeDelete(Model model, int num){
		
		boolean result = nService.remove(num);
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 삭제되었습니다.";
			loc="/notice/list";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:result";
	}
	
	// Notice end /////////////////////////////////////////////////////////////////////////////////////////
	
	// Photo Start ////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/photo/uploadForm")
	public String photoUploadForm(){
		return ".admin.photoUpload.photoUploadMain";
	}
	
	
	@RequestMapping("/photo/upload")
	@ResponseBody
	public String photoUpload(MultipartHttpServletRequest multipartRequest){
		
		String str = multipartRequest.getParameterMap().get("myId")[0];
		//System.out.println(str);
		
		Iterator<String> itr =  multipartRequest.getFileNames();
        
        String filePath = "C:/test";
         
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            
            //테스트후 지우자
            String originFileName = mpf.getOriginalFilename();
            System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
            String originalFilename = mpf.getOriginalFilename(); //파일명
            String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로
            
            /*
             	가져와야할 정보
              	영화 포스터
              	  - 영화 등록 번호
              	배우 얼굴
              	  - 배우 번호
              	스틸컷
              	  - 영화 등록 번호 
             */
            
            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                 
                System.out.println("originalFilename => "+originalFilename);
                System.out.println("fileFullPath => "+fileFullPath);
      
            } catch (Exception e) {
                System.out.println("postTempFile_ERROR======>"+fileFullPath);
                e.printStackTrace();
                return "fail";
            }
       }//while
        return "success";
    }
	
	
	
	
	
	// Photo End //////////////////////////////////////////////////////////////////////////////////////////
	
	
}////////////////////////////////////////














