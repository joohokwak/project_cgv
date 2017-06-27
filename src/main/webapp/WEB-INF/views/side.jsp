<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="/resources/css/sidemenu.css"/>

<script type="text/javascript">
	var lastScrollY = 0;
	
	$(function() {
		setInterval(quick, 10);
	});
	
	function quick() {
		//현재 스크롤바 top 위치, .scrollTop() - 선택한 element의 scroll 가능한 영역에서 가장 위쪽 위치
		currentY = $(window).scrollTop();
	   
		//위치가 틀린 경우
		if(currentY != lastScrollY) {
			//percent=움직임속도 * (현재 scrollTop위치) - (마지막 scrollTop위치) 
			percent = 0.1 * (currentY - lastScrollY);
			//percent가 0보다 크면 수를 올림  작으면 수를 내림. 
			percent = ( percent > 0 ? Math.ceil(percent) : Math.floor(percent) );
			//quick의 style:top을 현재의 top에서 percent를 더한 값(음수라면 빼지겠지?)으로 바꿔준다. 
			$("#sidemenuWrap").css("top", parseInt($("#sidemenuWrap").css("top")) + percent);
			//현재 위치를 lastScrollY에 저장해준다.
			lastScrollY = lastScrollY + percent;
		}
	
		//현재 ((윈도우넓이/2) +510) 을 left로 지정
		$("#sidemenuWrap").css("left",($(window).width() / 2 ) + 510);
	}   
</script>

<div id="sidemenuWrap">
	<div id="side_contents_top">
		<a href="#"><img src="http://img.cgv.co.kr/R2014/images/common/btn/btn_person_theater.gif" alt="CGV THEATER"></a>
		<a href="#"><img src="http://img.cgv.co.kr/R2014/images/common/btn/btn_person_arthouse.gif" alt="CGV arthouse"></a>
		<a href="#"><img src="http://img.cgv.co.kr/R2014/images/common/btn/btn_person_special.gif" alt="CGV SPECIAL"></a>
		<a href="http://phototicket.cgv.co.kr/" target="_blank"><img src="http://img.cgv.co.kr/R2014/images/common/btn/btn_person_phototicket.gif" alt="CGV 포토티켓"></a>
		<a href="#" class="required-login"><img src="http://img.cgv.co.kr/R2014/images/common/btn/btn_person_ticket.gif" alt="CGV TICKET INFO"></a>
		<a href="http://section.cgv.co.kr/discount/Special/discount/Default.aspx" target="_blank"><img src="http://img.cgv.co.kr/R2014/images/common/btn/btn_person_discount.gif" alt="CGV DISCOUNT INFO"></a>
	</div>
	
	<div id="btn-top">
		<a href="#" onclick="scrollTo(0,0); return false;">
			<img alt="btn-top" src="/resources/images/body/btn_top.png">
		</a>
	</div>
</div>
