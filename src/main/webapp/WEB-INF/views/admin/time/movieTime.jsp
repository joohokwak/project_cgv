<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.sk-wrap{
	margin: 30px;
}
.sk-row{
	padding: 10px; 
}
</style>
<script type="text/javascript">
$(function(){
	
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
</head>
<body>
<div class="sk-wrap" style="min-height: 300px">
	<div class="sk-header">
		<h1>상영 시간 등록/삭제</h1>
		<p>각 상영관의 상영시간을 관리하는 페이지 입니다.</p>
	</div>
	<div class="sk-body">
		<form action="/admin/movie/timeInsert" method="post" id="timeForm">
			<div class="sk-row">
				<select id="theater_select">
					<option value="0">Theater</option>
					<c:forEach items="${tList }" var="t">
						<option data-theater-num="${t.t_num}">${t.t_name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="sk-row">
				<select id="movie_select">
					<option value="0">Movie</option>
					<c:forEach items="${mList }" var="m">
						<option data-movie-num="${m.m_num}">${m.m_title1}</option>
					</c:forEach>
				</select>
			</div>
			<div class="sk-row">
				<input type="text" id="screen" name="s_title">
				<input type="number" id="seat" name="seat" min="80" max="300" >
			</div>
			<div class="sk-row">
				<input type="text" id="theater" name="t_num">
				<input type="text" id="movie" name="m_num">
				
				<input type="date" id="mt_date" name="mt_date">
				<input type="time" id="mt_time" name="mt_time">
				<input type="submit" value="등록" id="submitBtn">
			</div>
		</form>
		
		<div>
			<c:if test="${mtList ne null}">
				<c:forEach items="${mtList}" var="mt">
					<div>
						<div>
							<div class="sk-row" style="float: left; margin: 5px 20px 5px 5px">${mt.t_name}</div>
							<div class="sk-row" style="float: left; margin: 5px 20px 5px 5px">${mt.m_title1}(${mt.m_title2})</div>
							<div class="sk-row" style="float: left; margin: 5px 20px 5px 5px">${mt.s_title}</div>
							<div class="sk-row" style="float: left; margin: 5px 20px 5px 5px">${mt.mt_date}</div>
							<div class="sk-row" style="float: left; margin: 5px 20px 5px 5px">${mt.mt_time}</div>
						</div>
						<div style="float: left">
							<button type="button" onclick="location.href='/admin/movie/timeDel?num=${mt.mt_num}'">삭제</button>
						</div>
					</div>
					<div style="clear: both">
						<hr>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>	
</div>

</body>
</html>