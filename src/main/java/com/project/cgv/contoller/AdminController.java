package com.project.cgv.contoller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.jdbc.StringUtils;
import com.project.cgv.service.ActorService;
import com.project.cgv.service.BoardService;
import com.project.cgv.service.ManageService;
import com.project.cgv.service.MemberService;
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
	
	@Autowired
	private ManageService mgService;
	
	@Autowired 
	private BoardService bService;
	
	@Autowired private MemberService mbService;
	
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
		model.addAttribute("prevInfo",nService.getNoticeByNum(num+1));
		model.addAttribute("nextInfo",nService.getNoticeByNum(num-1));
		
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
	
	@RequestMapping("/photo/stealCutDelete")
	@ResponseBody
	public ResponseEntity<String> deleteStealCut(String num){
		ResponseEntity<String> entity = null;
		
		int result = upService.removeStealCut(num);
		
		if(result >= 0){
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
			return entity;
		}else{
			entity = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
			return entity;
		}
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
		model.addAttribute("video1",mService.trailerList(num).get(0));
		model.addAttribute("video2",mService.trailerList(num).get(1));
		model.addAttribute("video3",mService.trailerList(num).get(2));
		
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
	
	@RequestMapping(value="/manage/connection", method=RequestMethod.GET)
	public String showMatchForm(Model model, 
			@RequestParam(defaultValue="1")int page, 
				@RequestParam(required=false)HashMap<String,Object> option){
		
		model.addAttribute("viewData", mgService.showConnectionList(page, option));
		model.addAttribute("mList", mService.reserveMoive());
		model.addAttribute("aList", aService.showActorList());
		
		return ".admin.manage.manageForm";
	}
	
	@RequestMapping(value="/manage/connection", method=RequestMethod.POST)
	public String matchInfo(Model model, @RequestParam HashMap<String,Object> params){
		
		boolean result = mgService.addConnection(params);
		
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 등록되었습니다.";
			loc="/admin/manage/connection";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:/admin/result";
	}
	
	@RequestMapping(value="/manage/connectionDel", method=RequestMethod.GET)
	public String matchInfo(Model model, int num){
		boolean result = mgService.removeConnection(num);
		
		String msg = "";
		String loc = "";
		
		if(result){
			msg="정상적으로 삭제되었습니다.";
			loc="/admin/manage/connection";
		}else{
			msg="실패하였습니다.";
			loc="javascript:history.back()";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "forward:/admin/result";
	}
	
	// Board Start ///////////////////////////////////////////////////////
	
	@RequestMapping("/board/boardlist")
	public String boardList(Model model,@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,@RequestParam(defaultValue="1")int page) {
		
		HashMap<String,Object> params = new HashMap<String,Object>();		
		
		params.put("keyword", keyword);
		params.put("type", type);
		
		if(type==1){
			//제목
			params.put("b_title", keyword);
		}else if(type==2){
			//내용
			params.put("b_content", keyword);
		}else if(type==3){
			//제목+내용
			params.put("b_title", keyword);
			params.put("b_content", keyword);
		}else if(type==4){
			//작성자
			params.put("b_writer", keyword);
		}
		
		HashMap<String,Object> viewData = bService.getBoardList(params, page); 		

		model.addAttribute("viewData", viewData);
		return ".admin.board.boardList";
		
	}

	@RequestMapping("/board/boardwrite")
	public String WriteForm(){
		
		return ".admin.board.boardWrite";
	}
	
	@RequestMapping("/board/write")
	public String boardWrite(@RequestParam HashMap<String, Object> params){

		bService.writeBoard(params);
		return "redirect:/admin/board/boardlist";
		
	}
	
	@RequestMapping("/board/boardview")
	public String ViewForm(Model model, @RequestParam int num, HttpSession session, HttpServletRequest request, HttpServletResponse response){

		HashMap<String, Object> member = (HashMap<String, Object>)session.getAttribute("member");
		HashMap<String, Object> viewBoard = bService.viewBoard(num);
				
		if(member != null && viewBoard.get("id") != null && (viewBoard.get("id")).equals(member.get("id")) || (member.get("id")).equals("admin")){
			model.addAttribute("mine", true);
			
		}else {
			model.addAttribute("mine", false);
		}
		
		// 조회수
		Cookie[] cookies = request.getCookies();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(cookies != null) {
			for(int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				map.put(cookie.getName(), cookie.getValue());
			}
		}
		
		String readCount = (String)map.get("readCount");
		String newReadCount = "|" + num;
		
		if(StringUtils.indexOfIgnoreCase(readCount, newReadCount) == -1) {
			Cookie cookie = new Cookie("readCount", readCount + newReadCount);
			response.addCookie(cookie);
			
			bService.addHit(num);
		}
		
		
		model.addAttribute("viewBoard", viewBoard);
		
		return ".admin.board.boardView";
		
	}	
	
	@RequestMapping("/board/delete")
	public String boardDelete(@RequestParam int num){
		
		bService.deleteBoard(num);
		return "redirect:/admin/board/boardlist";
		
	}
	
	@RequestMapping("/board/boardupdate")
	public String UpdateForm(Model model, @RequestParam int num){
		
		HashMap<String, Object> viewBoard = bService.viewBoard(num);
		model.addAttribute("viewBoard", viewBoard);
		return ".admin.board.boardUpdate";
		
	}
	
	@RequestMapping("/board/update")
	public String boardUpdate(@RequestParam HashMap<String, Object> params){
		
		bService.updateBoard(params);
		return "redirect:/admin/board/boardlist";
		
	}

		
	@RequestMapping(value = "/replies", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestParam HashMap<String, Object> params, HttpSession session){

		ResponseEntity<String>  entity = null;
		HashMap<String,Object> member = (HashMap<String,Object>)session.getAttribute("member");
		
		try {
			params.put("id", member.get("id"));
			bService.writeReply(params);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}	
	
	
	@RequestMapping(value = "/replies/all/{num}", method = RequestMethod.GET)
	public ResponseEntity<List<HashMap<String, Object>>> list(@PathVariable("num") int num){

		ResponseEntity<List<HashMap<String, Object>>> entity = null;
		try{
			entity = new ResponseEntity<List<HashMap<String, Object>>>(bService.getReplyList(num),HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<List<HashMap<String, Object>>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	
	}
	
	
	@RequestMapping(value = "/replies/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("rno") int rno){
	
		ResponseEntity<String> entity = null;
		
		try{
			bService.deleteReply(rno);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	
	
	}
	
	// Board End /////////////////////////////////////////////////////////
	
	// Member Start //////////////////////////////////////////////////////
	
	@RequestMapping("/member/list")
	public String showMemberList(Model model, @RequestParam(defaultValue="1")int page){
		
		HashMap<String,Object> viewData = mbService.showMembers(page);
		model.addAttribute("viewData",viewData);
		
		return ".admin.member.memberList";
	}
	
	@RequestMapping("/member/memberJoin")
	public String memberJoinForm() {
		return ".admin.member.joinForm";
	}
	
	@RequestMapping("/member/memberJoinsubmit")
	public ModelAndView memberJoin(@RequestParam HashMap<String, Object> params){
		ModelAndView mv = new ModelAndView();
		mv.setViewName( mbService.setMember(params));
		mv.addObject(params);
		return mv;
	}
	
	@RequestMapping("/member/mycgv")
	public String myCGV(Model model, String id) {
		model.addAttribute("imgInfo", "h2_mycgv.png");
		HashMap<String, Object> member = mbService.getMember(id);
		model.addAttribute("member",member);
		model.addAttribute("reserve",mbService.reserveList(member));
		
		return ".admin.member.myCGV";
	}
	
	@RequestMapping("/member/memberUpdatePop")
	public String popup(Model model, String id) {
		model.addAttribute("member", mbService.getMember(id));
		return "/admin/member/memberUpdatePop";
	}
	
	@ResponseBody
	@RequestMapping(value= "/member/memberUpdate" , method=RequestMethod.POST)
	public HashMap<String, String> memberUpdate(@RequestParam HashMap<String, Object> params, HttpSession session, @RequestParam MultipartFile file){
		String phone = (String)params.get("num1")+"-"+(String)params.get("num2")+"-"+(String)params.get("num3");
		String email = (String)params.get("emailId")+"@"+(String)params.get("emailDomain");
		params.put("phone", phone);
		params.put("email", email);
		
		String str = mbService.memberUpdateAdmin(params, session, file);
		
		HashMap<String, String> result = new HashMap<String, String>();
		result.put("result", str);
		System.out.println(result.get("result"));
		return result;
	}
	
	@RequestMapping("/member/favoriteTheaterPop")
	public String fPopup(Model model, String id) {
		List<HashMap<String, Object>> tList = mService.theaterList();
		model.addAttribute("tList",tList);
		model.addAttribute("member",mbService.getMember(id));
		return "/admin/member/favoriteTheaterPop";
	}
	
	@ResponseBody
	@RequestMapping("/member/memberFupdate")
	public String memberFupdate(@RequestParam HashMap<String, Object> params, String id){
		int result = mbService.memberFupdate(params);

		if(result > 0) {
			return "success";
		}
		
		return "fail";
	}
	// Member End ////////////////////////////////////////////////////////
	
	
}////////////////////////////////////////

	












