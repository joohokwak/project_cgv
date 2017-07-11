package com.project.cgv.contoller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.cgv.service.ActorService;
import com.project.cgv.service.MovieService;
import com.project.cgv.service.NoticeService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	//member, board, notice, movie, actor 관리하는 controller
	
	//notice
	@Autowired
	private NoticeService nService;

	//movie
	@Autowired
	private MovieService mService;
	
	//actor
	@Autowired
	private ActorService aService;
	
	
	@RequestMapping("/main")//.admin.layout.body
	public String showMainForm(){
		return ".admin.layout.admin_body";
	}
	
	@RequestMapping("/result")
	public String getResult(){
		return ".admin.result.showResult";
	}
	
	// Notice Start ///////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("/notice/list")
	public String showNoticeListForm(Model model, @RequestParam(defaultValue="1")int page){
		
		HashMap<String,Object> viewData = nService.getAllNotice(page);
		
		model.addAttribute("viewData",viewData);
		
		return ".admin.notice.noticeList";
	}
	
	@RequestMapping("/notice/view")
	public String showNoticeView(Model model, int num){
		
		model.addAttribute("notice",nService.getNoticeByNum(num));
		
		return ".admin.notice.noticeView";
	}
	
	@RequestMapping("/notice/insertForm")
	public String showNoticeInsertForm(){
		return ".admin.notice.noticeInsertForm";
	}
	
	@RequestMapping("/notice/insert")
	public String insertNotice(Model model,@RequestParam HashMap<String,Object> params){
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
		
		return "forward:../result";
	}
	
	@RequestMapping("/notice/updateForm")
	public String showNoticeUpdateForm(Model model, int num){
		model.addAttribute("notice",nService.getNoticeByNum(num));
		return ".admin.notice.noticeUpdateForm";
	}
	
	@RequestMapping("/notice/update")
	public String updateNotice(Model model, @RequestParam HashMap<String,Object> params){
		
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
	public String deleteNotice(Model model, int num){
		
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
	
	@RequestMapping("/photo/infoList")
	@ResponseBody
	public ResponseEntity<List<HashMap<String,Object>>> showInfoList(@RequestParam HashMap<String,Object> params){
		
		ResponseEntity<List<HashMap<String, Object>>> entity = null;
		
		String opt = (String) params.get("opt");
		
		try{
			if(opt.equals("actorBtn")){
				entity = new ResponseEntity<List<HashMap<String,Object>>>(HttpStatus.OK);
			}else{
				entity = new ResponseEntity<List<HashMap<String,Object>>>(mService.movieList(),HttpStatus.OK);
			}
		}catch (Exception e) {
			entity = new ResponseEntity<List<HashMap<String,Object>>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping("/photo/uploadForm")
	public String showPhotoUploadForm(){
		return ".admin.photoUpload.photoUploadMain";
	}
	
	
	@RequestMapping("/photo/upload")
	@ResponseBody
	public String uploadPhoto(MultipartHttpServletRequest multipartRequest){
		
		String option = multipartRequest.getParameterMap().get("option")[0]; // 버튼
		String num = multipartRequest.getParameterMap().get("num")[0]; // 선택된 아이템
		
		Iterator<String> itr =  multipartRequest.getFileNames();
        
        String filePath = "C:/test";
         
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            
            //테스트후 지우자
            String originFileName = mpf.getOriginalFilename();
            System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력
            
            String saveFileName = makeFileName(originFileName);
            String fileFullPath = filePath+"/"+saveFileName; //파일 전체 경로
            
            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath));
      
            } catch (Exception e) {
                System.out.println("postTempFile_ERROR======>"+fileFullPath);
                e.printStackTrace();
                return "fail";
            }
       }//while
        return "success";
    }
	
	//파일이름, 실제 데이터
	private String makeFileName(String originalName){
		//파일 이름이 겹치지 않도록 UUID를 이용.
		
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		return savedName;
	}
	// Photo End //////////////////////////////////////////////////////////////////////////////////////////
	
	
	// Movie Start //////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("/movie/list")
	public String showMovieListForm(Model model, @RequestParam(defaultValue="1") int page, @RequestParam(required=false)HashMap<String, Object> option){
		
		HashMap<String,Object> viewData = mService.showSearchResult(page, option);
		
		model.addAttribute("viewData",viewData);
		System.out.println(viewData.get("mList"));
		
		return ".admin.movie.movieList";
	}
	
	@RequestMapping("/movie/insertForm")
	public String showMovieInsertForm(Model model){
		
		model.addAttribute("gList",mService.showGenreList());
		
		return ".admin.movie.movieInsertForm";
	}
	
	@RequestMapping("/movie/insert")
	public String insertMovie(Model model, @RequestParam HashMap<String,Object> params){
		
		boolean result = mService.addMovie(params);
		
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 등록되었습니다.";
			loc="/admin/main";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:/admin/result";
	}
	
	@RequestMapping("/movie/updateForm")
	public String showMovieUpdateForm(Model model, int num){
		
		model.addAttribute("gList",mService.showGenreList());
		model.addAttribute("movie",mService.movieDetail(num));
		
		return ".admin.movie.movieUpdateForm";
	}
	
	@RequestMapping("/movie/update")
	public String updateMovie(Model model, @RequestParam HashMap<String,Object> params){
		
		boolean result = mService.modifyMovie(params);
		
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 수정되었습니다.";
			loc="/admin/main";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:/admin/result";
	}
	
	// Movie End //////////////////////////////////////////////////////////////////////////////////////////

	// Actor Start //////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="/actor/list", method = RequestMethod.GET)
	public String showActorListForm(Model model, @RequestParam(defaultValue="1")int page){
		
		HashMap<String,Object> viewData = aService.showActorList(page);
		model.addAttribute("viewData",viewData);

		return ".admin.actor.actorList";
	}
	
	@RequestMapping(value="/actor/insert", method = RequestMethod.GET)
	public String insertActorForm(){
		return ".admin.actor.actorInsertForm";
	}
	
	@RequestMapping(value="/actor/insert", method = RequestMethod.POST)
	public String insertActor(Model model, @RequestParam HashMap<String,Object> params){
		
		boolean result = aService.addActor(params);
		
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 등록되었습니다.";
			loc="/admin/actor/list";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:/admin/result";
	}
	
	@RequestMapping(value="/actor/update", method = RequestMethod.GET)
	public String updateActorForm(Model model, int num){
		model.addAttribute("actor",aService.showActor(num));
		return ".admin.actor.actorUpdateForm";
	}
	
	@RequestMapping(value="/actor/update", method = RequestMethod.POST)
	public String updateActor(Model model, @RequestParam HashMap<String,Object> params){
		boolean result = aService.modifyActor(params);
		
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 수정되었습니다.";
			loc="/admin/actor/list";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:/admin/result";
	}
	
	@RequestMapping(value="/actor/delete", method = RequestMethod.GET)
	public String deleteActor(Model model, int num){
		boolean result = aService.removeActor(num);
		
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 삭제되었습니다.";
			loc="/admin/actor/list";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:/admin/result";
	}
	// Actor End //////////////////////////////////////////////////////////////////////////////////////////
	// Manage Start //////////////////////////////////////////////////////////////////////////////////////////
	
	
	
}////////////////////////////////////////














