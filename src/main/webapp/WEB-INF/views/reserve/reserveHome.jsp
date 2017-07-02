<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link rel="stylesheet" href="/resources/css/reserve/ticket.css">
	<link rel="stylesheet" href="/resources/css/jquery.mCustomScrollbar.css" />
	<script src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#date-list").mCustomScrollbar({theme:"rounded-dark"});
			
			// 날짜
			$.getJSON('/reserve/reserve_date', function(date){
				var day = ['일', '월', '화', '수', '목', '금', '토'];
				var indexList = [30, 30, 30, 30, 30, 30, 30];
				toYear = date.toYear;
				toMonth = date.toMonth;
				var toDate = date.toDate;
				var toDay = date.toDay;
				var lastDate = date.lastDate;
				var nextMonth = date.nextMonth;
				var nextLastDate = date.nextLastDate;
				var OverDate = 1;
				var nextCheck = 0;
				
				$("#date_table").append("<div id='date_year' style='text-align: center; font-size: 14px; font-weight: bold;'>"+toYear+"</div>");
				$("#date_table").append("<div id='date_month' style='text-align: center; font-size: 30px; font-weight: bold; color: #666666;'>"+toMonth+"</div><br/>");
				
				var index = indexList[toDay];
				//화면에 뿌려질 일 계산할때 사용될 마지막 요일
				var wLastDate = lastDate; 
				for(var i = 0; i < 30; i++){
					var wDay = (toDay + i) % 7; //화면에 뿌려질 요일 index
					var wDate = toDate + i;//화면에 뿌려질 일
					var w_d = 0;
					//날짜 목록 div로 추가하기
					if(wDate > wLastDate) { //마지막 날짜보다 크다면
						if(nextCheck == 0) {
							if(nextMonth == 1) {
								toYear = toYear + 1;
							}
							
							$("#date_table").append("<div id='date_year' style='text-align: center; font-size: 14px; font-weight: bold; margin-top: 30px;'>"+ toYear +"</div>");
							$("#date_table").append("<div id='date_month' style='text-align: center; font-size: 30px; font-weight: bold; color: #666666;'>"+ nextMonth +"</div>");
							nextCheck = 1;
						}
					
						wLastDate = nextLastDate;
						if(OverDate < 10) {
							w_d = "&nbsp;&nbsp;" + OverDate;
						}else {
							w_d = OverDate;
						}
						
						//날짜 목록 div로 추가하기
						if(i < index) {
							if(day[wDay] == '토') {
								$("#date_table").append("<div class='choice_date' style='cursor:pointer;color:blue;height:31px;line-height: 29px;'><div id='day' style='font-family: Verdana; font-size:14px;'>"+day[wDay]+"&nbsp;"+w_d+"</div></div>");
							}else if(day[wDay] == '일') {
								$("#date_table").append("<div class='choice_date' style='cursor:pointer;color:red;height:31px;line-height: 29px;'><div id='day' style='font-family: Verdana; font-size:14px;'>"+day[wDay]+"&nbsp;"+w_d+"</div></div>");
							}else {
								$("#date_table").append("<div class='choice_date' style='cursor:pointer;height:31px;line-height: 29px;'><div id='day' style='font-family: Verdana; font-size:14px;'>"+day[wDay]+"&nbsp;"+w_d+"</div></div>");
							}
						}
						
						OverDate = parseInt(OverDate) + 1;
					}else {
						if(wDate < 10){
							w_d = "&nbsp;&nbsp;" + wDate;
						}else {
							w_d = wDate;
						}
						//날짜 목록 div로 추가하기
						if(i < index) {
							if(day[wDay] == "토"){
								$("#date_table").append("<div class='choice_date' style='cursor:pointer;color:blue;height:31px;line-height: 29px;'><div id='day' style='font-family: Verdana; font-size:14px;'>"+day[wDay]+"&nbsp;"+w_d+"</div></div>");
							}else if(day[wDay] == "일") {
								$("#date_table").append("<div class='choice_date' style='cursor:pointer;color:red;height:31px;line-height: 29px;'><div id='day' style='font-family: Verdana; font-size:14px;'>"+day[wDay]+"&nbsp;"+w_d+"</div></div>");
							}else {
								$("#date_table").append("<div class='choice_date' style='cursor:pointer;height:31px;line-height: 29px;'><div id='day' style='font-family: Verdana; font-size:14px;'>"+day[wDay]+"&nbsp;"+w_d+"</div></div>");
							}
						}
					}
				}
				
				// 날짜 선택시
				$(".choice_date").click(function(e) {
					$(".choice_date").removeClass("select-date");
					$(".choice_date").children().removeClass("select-date2");
					
					$(this).addClass("select-date");
					$(this).children().addClass("select-date2");
				});
			});// 날짜 end
			
			// 좌석선택 버튼 클릭시
			$("#step-btn").click(function(e) {
				$(this).css("background", "url('/resources/images/reserve/tnb_buttons.png') no-repeat -150px -220px")
			});
		});
	</script>
</head>
<body>
	<div id="ticketSelectWrap">
		<div id="step">
			<div id="section-movie">
				<div class="col-head">영화</div>
			</div>
			
			<div id="section-theater">
				<div class="col-head">극장</div>
			</div>
			
			<div id="section-date">
				<div class="col-head">날짜</div>
				<div id="col-body">
					<div id="date-list">
						<div id="date_table"></div>
					</div>
				</div>
			</div>
			
			<div id="section-time">
				<div class="col-head">시간</div>
				<div class="time-option">
					<span class="morning">조조</span><span class="night">심야</span>
				</div>
			</div>
		</div>
	</div>
	
	<div id="tnb">
		<div id="step1">
			<div id="infoMovie">
				
				<div class="infoBlock"></div>
			</div>
			
			<div id="infoTheater">
				
				<div class="infoBlock"></div>
			</div>
			
			<div id="infoPath">
				<div id="path2">
					
				</div>
				
				<div id="path3">
					
				</div>
			</div>
			
			<div id="step-btn">
				
			</div>
		</div>
	</div>
</body>
</html>