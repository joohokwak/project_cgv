<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/resources/css/jquery.mCustomScrollbar.css"/>
<script src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/admin/mybtn.css" />
<style type="text/css">
.time-wrap{
	position: relative;
	width: 1110px;
	margin: 0 auto;
	color: #666666;
	cursor: default;
}

.time-header{
	position: relative;
}

.time-header h1{
	font-weight: bold;
	font-size: 25px;
	color: black;
}

.time-header p{
	font-size: 12px;
}

.time-body{
	position: relative;
	width: 1150px;
}

.time-select{
	width: 1100px;
	margin: 5px auto; 
}

.time-row{
	position: relative;
	top: 5px;
	left: 0px;
	float: left; 
	margin-right: 15px;
}

.time-row select, input{
	padding: 5px;
}

.time-list{
	width: 1000px;
	height: 400px;
	margin: 0px auto;
}

.time-list .list-wrap{

}

.time-list .tname{
	width: 50px;
	float: left; 
	margin: 5px 20px 5px 5px;
	text-align: center;
}

.time-list .mname{
	width: 400px;
	float: left; 
	margin: 5px 20px 5px 5px;
}

.time-list .screen{
	width: 60px;
	float: left; 
	margin: 5px 20px 5px 5px;
	text-align: center;
}

.time-list .date{
	width: 65px;
	float: left; 
	margin: 5px 20px 5px 5px;
	text-align: center;
}

.time-list .time{
	width: 50px;
	float: left; 
	margin: 5px 20px 5px 5px;
	text-align: center;
}

 .time-list .del{ 
 	width: 45px; 
 	float: left;  
 	margin: 5px 20px 5px 5px; 
 } 



.time-clear{
	clear: both;
}
</style>
<script type="text/javascript">
$(function(){
	
	$(".time-list").mCustomScrollbar({theme:"rounded-dark"});
	
	$("#time_menu").css({
		background : "#343132",
		color: "#fff"		
	});
	
	$("#theater_select").change(function(){
		$(this).find("option").each(function(){
			if($(this).is(":selected") == true){
				$("#theater").val($(this).data("theater-num"));
			}
		});	
	});
	
	$("#movie_select").change(function(){
		$(this).find("option").each(function(){
			if($(this).is(":selected") == true){
				$("#movie").val($(this).data("movie-num"));
			}
		});	
	});
	
	$("#screen_select").change(function(){
		$(this).find("option").each(function(){
			if($(this).is(":selected") == true){
				$("#screen").val($(this).data("screen-num"));
			}
		});	
	});
	
	$("#timeForm").on("submit",function(){
		return timeCheck();
	});
	
	$("#seat").blur(function(){
		
		if($("#seat").val() == ""){
			//아무것도 입력하지 않으면 처리x
		}else if(isNaN($("#seat").val()) == true){
			//자동으로 처리되지만 혹시몰라서 ..
			$alert("숫자만 입력하세요!");	
		}else if(Number($("#seat").val()) < 80){
			alert("상영관의 최소 좌석 수는 80좌석입니다.");
			$("#seat").val("80");
		}else if(Number($("#seat").val()) > 300){
			alert("상영관의 최대 좌석 수는 300좌석입니다.");
			$("#seat").val("300");
		}
	});
	
	function timeCheck(){
		if($("#theater").val() == ""){
			alert("영화관을 선택하세요!");
			$("#theater_select").focus();
			return false;
		}
		
		if($("#movie").val() == ""){
			alert("영화를 선택하세요!");
			$("#movie_select").focus();
			return false;
		}
		
		if($("#screen").val() == ""){
			alert("상영관 명을 입력하세요!");
			$("#screen").focus();
			return false;
		}
		
		if($("#seat").val() ==""){
			alert("좌석수를 입력하세요!");
			$("#seat").focus();
			return false;
		}
		
		if($("#mt_date").val() == ""){
			alert("날짜를 입력하세요!");
			$("#mt_date").focus();
			return false;
		}
		
		if($("#mt_time").val() == ""){
			alert("시간을 입력하세요!");
			$("#mt_time").focus();
			return false;
		}
		return;
	}
});


</script>
<div class="time-wrap">
	<div class="time-header">
		<h1>상영 시간 등록/삭제</h1>
		<p>각 상영관의 상영시간을 관리하는 페이지 입니다.</p>
	</div>
	<div class="time-body">
		<div class="time-select" style="margin-bottom: 30px">
			<form action="/admin/movie/timeInsert" method="post" id="timeForm">
				<div class="time-row">
					<select id="theater_select">
						<option value="0">Theater</option>
						<c:forEach items="${tList}" var="t">
							<option data-theater-num="${t.t_num}">${t.t_name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="time-row">
					<select id="movie_select">
						<option value="0">Movie</option>
						<c:forEach items="${mList }" var="m">
							<option data-movie-num="${m.m_num}">${m.m_title1}</option>
						</c:forEach>
					</select>
				</div>
				<div class="time-row">
					<input type="text" id="screen" name="s_title" placeholder="상영관 이름">
					<input type="number" id="seat" name="seat" min="80" max="300" placeholder="좌석">
				</div>
				<div class="time-row">
					<input type="date" id="mt_date" name="mt_date">
				</div>
				<div class="time-row">
					<input type="time" id="mt_time" name="mt_time">
				</div>
				<div class="time-row">
<!-- 					<input type="submit" value="등록" id="submitBtn"> -->
					<button type="submit" id="submitBtn" class="my-btn">등록</button>
				</div>
				
				<input type="hidden" id="theater" name="t_num">
				<input type="hidden" id="movie" name="m_num">
			</form>
			<div class="time-clear"></div>
		</div>
		
		
		<div class="time-list">
			<div class="tname">
				영화관			
			</div>
			<div class="screen">
				상영관
			</div>
			<div class="mname" style="text-align: center">
				영화이름
			</div>
			<div class="date">
				상영날짜
			</div>
			<div class="time">
				상영시간
			</div>			
			<div class="time-clear"></div>
			<c:if test="${mtList ne null}">
				<c:forEach items="${mtList}" var="mt">
					<div class="list-wrap">
						<div class="tname">${mt.t_name}</div>
						<div class="screen">${mt.s_title}</div>
						<div class="mname">${mt.m_title1}(${mt.m_title2})</div>
						<div class="date">${mt.mt_date}</div>
						<div class="time">${mt.mt_time}</div>
					</div>
					
					<div style="float: right; margin-bottom: 10px" class="list-wrap">
						<button type="button" class="my-btn" onclick="location.href='/admin/movie/timeDel?num=${mt.mt_num}'">삭제</button>
					</div>
					<div class="time-clear">
						<hr>
					</div>
				</c:forEach>
			</c:if>
		</div>
		</div>
	</div>	
