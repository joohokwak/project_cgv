package com.project.cgv.contoller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.cgv.service.ActorService;
import com.project.cgv.service.MovieService;
import com.project.cgv.service.NoticeService;
import com.project.cgv.service.UploadService;

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
	
	@Autowired
	private UploadService upService;
	
	
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
	public String showNoticeListForm(Model model, @RequestParam(defaultValue="1")int page
			, @RequestParam(required=false) HashMap<String,Object> option){
		
		HashMap<String,Object> viewData = nService.getAllNotice(page, option);
		
		model.addAttribute("viewData",viewData);
		model.addAttribute("keyword",option.get("keyword"));
		
		return ".admin.notice.noticeList";
	}
	
	@RequestMapping("/notice/view")
	public String showNoticeView(Model model, int num){
		
		model.addAttribute("notice",nService.getNoticeByNum(num));
		
		return ".admin.notice.noticeView";
	}
	
	@RequestMapping(value="/notice/insert", method=RequestMethod.GET)
	public String showNoticeInsertForm(){
		return ".admin.notice.noticeInsertForm";
	}
	
	@RequestMapping(value="/notice/insert", method=RequestMethod.POST)
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
		
		return "forward:/admin/result";
	}
	
	@RequestMapping(value="/notice/update", method=RequestMethod.GET)
	public String showNoticeUpdateForm(Model model, int num){
		model.addAttribute("notice",nService.getNoticeByNum(num));
		return ".admin.notice.noticeUpdateForm";
	}
	
	@RequestMapping(value="/notice/update", method=RequestMethod.POST)
	public String updateNotice(Model model, @RequestParam HashMap<String,Object> params){
		
		boolean result = nService.modifyNotice(params);
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 수정되었습니다.";
			loc="/admin/notice/list";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:/admin/result";
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
		
		return "forward:/admin/result";
	}
	
	// Notice end /////////////////////////////////////////////////////////////////////////////////////////
	
	
	// Photo Start ////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("/photo/infoList")
	@ResponseBody
	public ResponseEntity<List<HashMap<String,Object>>> showInfoList(@RequestParam HashMap<String,Object> params){
		
		ResponseEntity<List<HashMap<String, Object>>> entity = null;
		
		String opt = (String) params.get("opt");
		
		try{
			if(opt.equals("배우")){
				entity = new ResponseEntity<List<HashMap<String,Object>>>(aService.showActorList(),HttpStatus.OK);
			}else{
				entity = new ResponseEntity<List<HashMap<String,Object>>>(mService.reserveMoive(),HttpStatus.OK);
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
	public ResponseEntity<String> uploadPhoto(MultipartHttpServletRequest multipartRequest){
		
		ResponseEntity<String> entity = null;
		
		String option = multipartRequest.getParameterMap().get("option")[0]; // 버튼
		String num = multipartRequest.getParameterMap().get("num")[0]; // 선택된 아이템
        
        
       try{
    	   HashMap<String,Object> params = new HashMap<String,Object>();
           params.put("option", option);
           params.put("num", num);
           params.put("files", multipartRequest);
           
           upService.uploadFile(params);
           entity = new ResponseEntity<String>("success",HttpStatus.OK);
           
           return entity;
       }catch (Exception e) {
    	   entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
    	   
    	   return entity;
       }
         
        
        
    }
	
	// Photo End //////////////////////////////////////////////////////////////////////////////////////////
	
	
	// Movie Start //////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("/movie/list")
	public String showMovieListForm(Model model, @RequestParam(defaultValue="1") int page, @RequestParam(required=false)HashMap<String, Object> option){
		
		HashMap<String,Object> viewData = mService.showSearchResult(page, option);
		
		model.addAttribute("viewData",viewData);
		
		return ".admin.movie.movieList";
	}
	
	@RequestMapping(value="/movie/insert", method=RequestMethod.GET)
	public String showMovieInsertForm(Model model){
		
		model.addAttribute("gList",mService.showGenreList());
		
		return ".admin.movie.movieInsertForm";
	}
	
	@RequestMapping(value="/movie/insert", method=RequestMethod.POST)
	public String insertMovie(Model model, @RequestParam HashMap<String,Object> params){
		
		boolean result = mService.addMovie(params);
		
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 등록되었습니다.";
			loc="/admin/movie/list";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:/admin/result";
	}
	
	@RequestMapping(value="/movie/update", method=RequestMethod.GET)
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
			loc="/admin/movie/list";
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
	@RequestMapping("/connect/form")
	public String showConnectionForm(Model model){
		return ".admin.connection.";
	}
	
	// Manage End //////////////////////////////////////////////////////////////////////////////////////////
	
	// MovieTime Start //////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="/movie/time", method=RequestMethod.GET)
	public String setMovieTimeForm(Model model){
		model.addAttribute("tList", mService.theaterList());
		model.addAttribute("mList",mService.reserveMoive());
		model.addAttribute("sList",mService.showScreenList());
		model.addAttribute("mtList", mService.showMoviesInfo());
		return ".admin.time.movieTime";
	}
	
	@RequestMapping(value="/movie/timeInsert", method=RequestMethod.POST)
	public String setMovieTime(Model model, @RequestParam HashMap<String,Object> params){
		
		boolean result = mService.addMovieTime(params);
		
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 등록되었습니다.";
			loc="/admin/movie/time";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:/admin/result";
	}
	
	@RequestMapping(value="/movie/timeDel", method=RequestMethod.GET)
	public String setMovieTime(Model model, int num){
		
		boolean result = mService.removeMovieTime(num);
		
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 등록되었습니다.";
			loc="/admin/movie/time";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:/admin/result";
	}
	
	// MovieTime End //////////////////////////////////////////////////////////////////////////////////////////
	
	
	// 매출관리
	@RequestMapping("/salesManagement")
	public ModelAndView salse() {
		ModelAndView mv = new ModelAndView(".admin.sales.salesManagement");
		
		List<HashMap<String, Object>> list = mService.salseManagement();
		
		String sales = "";
		
		for(int i = 0; i < list.size(); i++) {
			sales += ((Double)list.get(i).get("sales")).intValue() + ", ";
		}
		
		sales = sales.substring(0, sales.length()-2);
		
		String tlist = "";
		
		for(int i = 0; i < list.size(); i++) {
			tlist += "'" + list.get(i).get("t_name") + "', ";
		}
		
		tlist = tlist.substring(1, tlist.length()-3);
		
		mv.addObject("slist", sales);
		mv.addObject("tlist", tlist);
		mv.addObject("size", list.size());
		
		return mv;
	}
	
	@RequestMapping(value="/manage/joinForm", method=RequestMethod.GET)
	public String showMatchForm(){
		
		return ".admin.manage.manageForm";
	}
	
	@RequestMapping(value="/manage/join", method=RequestMethod.POST)
	public String matchInfo(HashMap<String,Object> params){
		
		return "";
	}
	
}////////////////////////////////////////

	












