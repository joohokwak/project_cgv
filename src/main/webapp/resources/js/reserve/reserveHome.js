var select_movie_num = null;
var select_theater_num = null;
var select_date = null;
var dayInfo = null;

$(function() {
	$("#date-list").mCustomScrollbar({theme:"rounded-dark"});
	$("#reserve-movie-list").mCustomScrollbar({theme:"rounded-dark"});
	$("#reserve-theater-list").mCustomScrollbar({theme:"rounded-dark"});
	
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
					$("#date_table").append("<div id='date_month' style='text-align: center; font-size: 30px; font-weight: bold; color: #666666; margin-bottom: 20px;'>"+ nextMonth +"</div>");
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
						$("#date_table").append("<div class='choice_date' data-info='"+toYear+"."+nextMonth+"."+OverDate+"["+day[wDay]+"]' style='cursor:pointer;color:blue;height:33px;line-height: 31px; padding:2px;'>"+
						"<div id='day' style='font-family: Verdana; font-size:14px;'>"+day[wDay]+"&nbsp;"+w_d+"</div></div>");
					}else if(day[wDay] == '일') {
						$("#date_table").append("<div class='choice_date' data-info='"+toYear+"."+nextMonth+"."+OverDate+"["+day[wDay]+"]' style='cursor:pointer;color:red;height:33px;line-height: 31px; padding:2px;'>"+
						"<div id='day' style='font-family: Verdana; font-size:14px;'>"+day[wDay]+"&nbsp;"+w_d+"</div></div>");
					}else {
						$("#date_table").append("<div class='choice_date' data-info='"+toYear+"."+nextMonth+"."+OverDate+"["+day[wDay]+"]' style='cursor:pointer;height:33px;line-height: 31px; padding:2px;'>"+
						"<div id='day' style='font-family: Verdana; font-size:14px;'>"+day[wDay]+"&nbsp;"+w_d+"</div></div>");
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
						$("#date_table").append("<div class='choice_date' data-info='"+toYear+"."+toMonth+"."+wDate+"["+day[wDay]+"]' style='cursor:pointer;color:blue;height:33px;line-height: 31px; padding:2px;'>"+
						"<div id='day' style='font-family: Verdana; font-size:14px;'>"+day[wDay]+"&nbsp;"+w_d+"</div></div>");
					}else if(day[wDay] == "일") {
						$("#date_table").append("<div class='choice_date' data-info='"+toYear+"."+toMonth+"."+wDate+"["+day[wDay]+"]' style='cursor:pointer;color:red;height:33px;line-height: 31px; padding:2px;'>"+
						"<div id='day' style='font-family: Verdana; font-size:14px;'>"+day[wDay]+"&nbsp;"+w_d+"</div></div>");
					}else {
						$("#date_table").append("<div class='choice_date' data-info='"+toYear+"."+toMonth+"."+wDate+"["+day[wDay]+"]' style='cursor:pointer;height:33px;line-height: 31px; padding:2px;'>"+
						"<div id='day' style='font-family: Verdana; font-size:14px;'>"+day[wDay]+"&nbsp;"+w_d+"</div></div>");
					}
				}
			}
		}
		
		
		// 날짜 선택시
		$(".choice_date").click(function(e) {
			$(".choice_date").removeClass("select-date");
			$(".choice_date").children().removeClass("select-date2");
			
			$("#infoTheater").css("background", "#1d1d1c");
			
			dayInfo = $(this).attr("data-info");
			$("#row-date").css("display", "block").html("<span style='display: inline-block; width: 40px;'>일시</span><span>"+dayInfo+"</span>");
			
			select_date = dayInfo.split("[")[0];
			dateChoice();
			
			$(this).addClass("select-date");
			$(this).children().addClass("select-date2");
		});
	});// 날짜 end
	
	
	// 영화 선택시
	$(".col-movie").click(function(e) {
		$(".col-movie").css("background", "#fdfcf0");
		$(".col-movie").find(".text").css("color", "#333");
		$(".col-movie").find(".col-movie2").css("border", "none");
		
		$("#infoMovie").css("background", "none");
		$("#infoMovie").find("table").remove();
		
		select_movie_num = $(this).find(".m_num").val();
		var m_poster = $(this).find(".m_poster").val();
		var m_title1 = $(this).find(".m_title1").val();
		var m_grade = $(this).find(".m_grade").val();
		
		var table = $("<table style='border-spacing: 0; width: 214px; height: 108px; position: relative; top: -58%;'>");
		
		table.append($("<tr>").append("<td width='74px' rowspan='2'><img src='/resources/images/movie/poster/"+m_poster+"' width='74px' height='104px'></td>")
				.append("<td align='left'><div style='margin-left: 5px; overflow: hidden; font-weight: bold;'>"+m_title1+"</div></td>"));
		table.append($("<tr><td align='left'><div style='margin-left: 5px; font-weight: bold;'>"+m_grade+"</div></td></tr>"))
		
		$("#infoMovie").append(table);
		
		dateChoice();
		
		$(this).css("background", "#333");
		$(this).find(".text").css("color", "#fff");
		
		$(this).find(".col-movie2").css("border", "1px solid gray");
		
	});
	
	
	// 극장 선택시
	$(".col-theater").click(function(e) {
		$(".col-theater").css("background", "#fdfcf0");
		$(".col-theater").find(".col-theater2").css({"border": "none", "color" : "#333"});
		
		$("#infoTheater").css("background", "#1d1d1c");
		
		var theater_name = $.trim($(this).find(".col-theater2").text());
		select_theater_num = $(this).find(".t_num").val();
		$("#row-theater").css("display", "block").html("<span style='display: inline-block; width: 40px;'>극장</span><span>"+theater_name+"&gt;</span>");
		
		dateChoice();
		
		$(this).css({"background": "#333"});
		$(this).find(".col-theater2").css({"border": "1px solid gray", "color" : "#fff"});
	});
	
	
	// 로그인창 닫기 버튼
	$("#btn_close_x").click(function(e) {
		$("#loginDiv").css({display: "none"});
		$("#ticketSelectWrap").prop('disabled', false).css({"pointer-events": "auto", opacity: "1"});
	});
	
	// 비밀번호창에서 엔터키 적용
	$("#loginDivPw").keyup(function(e) {
		if(e.keyCode == 13) {
			$("#login_bd_btn").click();
		}
	});
	
	// 로그인 버튼 클릭
	$("#login_bd_btn").click(function(e) {
		var divId = $.trim($("#loginDivId").val());
		var divPw = $.trim($("#loginDivPw").val());
		
		if(divId.length > 0 && divPw.length >0) {
			$.ajax({
				url : "/member/reserveLogin",
				type : "post",
				data : {"id": divId, "pass":divPw},
				dataType : "json",
				success: function(data) {
					if(data.result == 'success') {
						$("#reserveChoiceForm").submit();
					}else {
						$.alert({
							title: '',
						    content: '<font color="#333"><b>아이디 또는 비밀번호를 확인하세요</b></font>',
						    boxWidth: '300px',
						    useBootstrap: false,
						    type: 'red'
						});
					}
				}
			});
		}
	});
	
	
	// 좌석선택 버튼 클릭시
	$("#step-btn").click(function(e) {
		if($(this).attr("data-info") == 'check') {
			
			// 로그인체크
			$.ajax({
				url : "/member/loginCheck",
				dataType : "text",
				success : function(data) {
					if(data == 'login') {
						// 좌석선택창으로 이동
						$("#reserveChoiceForm").submit();
						
					} else {
						// 로그인 창 띄우기
						$("html, body").stop().animate({scrollTop : '0'});
						$("#loginDiv").css({display: "block"});
						$("#ticketSelectWrap").prop('disabled', true).css({"pointer-events": "none", opacity: "0.5"});
					}
				}
			});
			
		}
	});
});

// 영화, 극장, 날짜가 모두 선택 되었을때 시간 가져오는 메서드
function dateChoice() {
	$("#step-btn").css({"background": "url('/resources/images/reserve/tnb_buttons.png') no-repeat 0px -220px", "cursor": "auto"});
	$("#step-btn").attr("data-info", "uncheck");
	
	if(select_movie_num != null && select_theater_num != null && select_date != null) {
		$.ajax({
			url : "/movie/movieTimeInfo",
			type : "post",
			data : {"m_num" : select_movie_num, "t_num" : select_theater_num, "mt_date" : select_date},
			dataType : "json",
			success : function(data) {
				var str = "";
				var s_title = null;
				
				$(data.result1).each(function(i, element) {
					if(s_title != element.s_title) {
						s_title = element.s_title;
						if(i == 0) {
							str += "<div style='margin-bottom: 10px;'><span style='font-size: 14px; font-weight: bold;'>"+element.s_title+"</span> (총"+element.s_cnt_seat+"석)</div>";
						}else {
							str += "<div style='padding-top: 10px; margin-bottom: 10px; border-top: 2px solid #cfcdc3;'><span style='font-size: 14px; font-weight: bold;'>"+element.s_title+"</span> (총"+element.s_cnt_seat+"석)</div>";
						}
					}
					
					var timeInfo = null;
					
					$(data.result2).each(function(j, elt) {
						if(element.mt_time == elt.mt_time) {
							timeInfo = element.s_cnt_seat - elt.tgs;
						}
					});
					
					if(timeInfo == null) {
						timeInfo = element.s_cnt_seat;
					}
					
					var d = new Date();
					
					var curDay = d.getDate();
					var curHour = d.getHours();
					var curMin = d.getMinutes();
					
					var deHour = element.mt_time.split(":")[0];
					var deMin = element.mt_time.split(":")[1];
					
					if(Number(curDay) == Number(select_date.split(".")[2])) {
						if(curHour == deHour) {
							if((curMin - deMin) > 10) {
								str += "<span class='timeChoice' style='border: 1px solid #cfcdc3; padding: 2px; display: inline-block; width: 50px; height: 21px; font-size: 14px;"+
									" font-weight: bold; text-align: center; cursor: pointer; margin-bottom: 15px;'>"+
									"<span data-screen='"+element.s_title+"' data-screenNum='"+element.s_num+"' style='display: inline-block; width: 48px; height: 19px; text-decoration: line-through; cursor: auto;'>"+element.mt_time+"</span></span><span style='color: green;'>"
									+"완료</span>";
							}
						}else if(curHour - deHour > 0) {
							str += "<span class='timeChoice' style='border: 1px solid #cfcdc3; padding: 2px; display: inline-block; width: 50px; height: 21px; font-size: 14px; text-decoration: line-through; cursor: auto;"+
								" font-weight: bold; text-align: center; cursor: pointer; margin-bottom: 15px;'>"+
								"<span data-screen='"+element.s_title+"' data-screenNum='"+element.s_num+"' style='display: inline-block; width: 48px; height: 19px; text-decoration: line-through; cursor: auto;'>"+element.mt_time+"</span></span><span style='color: green;'>"
								+"완료</span>";
						}else {
							str += "<span class='timeChoice' style='border: 1px solid #cfcdc3; padding: 2px; display: inline-block; width: 50px; height: 21px; font-size: 14px;"+
								" font-weight: bold; text-align: center; cursor: pointer; margin-bottom: 15px;'>"+
								"<span data-screen='"+element.s_title+"' data-screenNum='"+element.s_num+"' style='display: inline-block; width: 48px; height: 19px;'>"+element.mt_time+"</span></span><span style='color: green;'>"
								+timeInfo+"석</span>";
						}
					}else {
						str += "<span class='timeChoice' style='border: 1px solid #cfcdc3; padding: 2px; display: inline-block; width: 50px; height: 21px; font-size: 14px;"+
							" font-weight: bold; text-align: center; cursor: pointer; margin-bottom: 15px;'>"+
							"<span data-screen='"+element.s_title+"' data-screenNum='"+element.s_num+"' style='display: inline-block; width: 48px; height: 19px;'>"+element.mt_time+"</span></span><span style='color: green;'>"
							+timeInfo+"석</span>";
					}
					
				});
				
				$("#movieTimeTable").html(str);
				$("#movieTimeTable").mCustomScrollbar({theme:"rounded-dark"});
				
				$(".timeChoice").click(function(e) {
					
					if($(this).find("span:first").css("cursor") == "pointer") {
						$(".timeChoice").css({background: "#fdfcf0"});
						$(".timeChoice").find(":first-child").css({border: "none", color: "#333"});
						
						var screenInfo = $(this).children().attr("data-screen");
						$("#row-screen").css("display", "block").html("<span style='display: inline-block; width: 40px;'>상영관</span><span>"+screenInfo+"</span>");
						
						$(this).css({background: "#333", border: "1px solid gray"});
						$(this).find(":first-child").css({border: "1px solid gray", color: "#fff"});
						
						$("#step-btn").css({"background": "url('/resources/images/reserve/tnb_buttons.png') no-repeat -150px -220px", "cursor": "pointer"});
						$("#step-btn").attr("data-info", "check");
						
						// 선택된 정보들을 form에 담기
						$("#movieInfo").val(select_movie_num);
						$("#theaterInfo").val(select_theater_num);
						$("#dateInfo").val(dayInfo);
						$("#mtDateInfo").val(select_date);
						$("#screenInfo").val($(this).children().attr("data-screenNum"));
						$("#timeInfo").val($(this).find(":first-child").text());
					}
				});
				
			}
		});
	}
}


// 영화 정보가 넘어 왔을 때 선택 되어 있도록
function m_numMove(m, p, t, g) {
	if(m != 0) {
		select_movie_num = m;
		$("#infoMovie").css("background", "none");
		
		var table = $("<table style='border-spacing: 0; width: 214px; height: 108px; position: relative; top: -58%;'>");
		
		table.append($("<tr>").append("<td width='74px' rowspan='2'><img src='/resources/images/movie/poster/"+p+"' width='74px' height='104px'></td>")
				.append("<td align='left'><div style='margin-left: 5px; overflow: hidden; font-weight: bold;'>"+t+"</div></td>"));
		table.append($("<tr><td align='left'><div style='margin-left: 5px; font-weight: bold;'>"+g+"</div></td></tr>"))
		
		$("#infoMovie").append(table);
	}
}