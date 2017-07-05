var select_movie_num = null;
var select_theater_num = null;
var select_date = null;
	
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
			
			var dayInfo = $(this).attr("data-info");
			$("#row-date").css("display", "block").html("<span style='display: inline-block; width: 40px;'>일시</span>"+dayInfo);
			
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
		
		var theater_name = $(this).find(".col-theater2").text();
		select_theater_num = $(this).find(".t_num").val();
		$("#row-theater").css("display", "block").html("<span style='display: inline-block; width: 40px;'>극장</span>"+theater_name + ">");
		
		dateChoice();
		
		$(this).css({"background": "#333"});
		$(this).find(".col-theater2").css({"border": "1px solid gray", "color" : "#fff"});
	});
	
	
	// 좌석선택 버튼 클릭시
	$("#step-btn").click(function(e) {
		$(this).css("background", "url('/resources/images/reserve/tnb_buttons.png') no-repeat -150px -220px")
	});
});

function dateChoice() {
	if(select_movie_num != null && select_theater_num != null && select_date != null) {
		$.ajax({
			url : "/movie/movieTimeInfo",
			type : "post",
			data : {"m_num" : select_movie_num, "t_num" : select_theater_num, "mt_date" : select_date},
			dataType : "json",
			success : function(data) {
				var str = "";
				$(data).each(function(i, element) {
					//alert(element.mt_time);
					str +="<span style='border: 1px solid #333; padding: 2px; display: inline-block; width: 50px; height: 20px; font-size: 14px; font-weight: bold; text-align: center;'>"
						+element.mt_time+"</span><span style='color: green;'>"
						+element.s_cnt_seat+"석</span>";
				});
				
				$("#movieTimeTable").html(str);
			}
		});
	}
}