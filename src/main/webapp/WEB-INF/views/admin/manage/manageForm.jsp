<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/css/jquery.mCustomScrollbar.css"/>
<script src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
<link rel="stylesheet" href="/resources/css/admin/mybtn.css">
<title>Insert title here</title>
<style type="text/css">

	.manage-wrap{
		position: relative;
		width: 900px;
		margin: 0 auto;
		color: #666666;
		cursor: default;
	}
	
	.manage-info{
		width: 800px;
		margin: 30px auto;
	}

	.manage-info h2{
		text-align: center;
		margin-top: 0px;
		margin-bottom: 15px;
	}
	
	.manage-info .movie-info{
		margin-right: 20px;
	}
	
	.manage-info .actor-info{

	}
	
	.movie-info-head{
		width: 400px;
	}
	
	.movie-info-head h2{
		text-align: center;
	}
	
	.movie-info-head .movie-num{
		float: left;
		width: 50px;
		font-size: 12px;
		font-weight: bold;
		text-align: center;
	}
	
	.movie-info-head .movie-title{
		float: left;
		width: 300px;
		font-size: 12px;
		font-weight: bold;
		overflow: hidden;
		text-align: center;
	}
	
	.movie-info-body{
		height: 200px;
	}
	
	.movie-info-body .movie-num{
		float: left;
		width: 50px;
		font-size: 12px;
		text-align: center;
		padding: 3px 0px;
		margin: 2px 0px;
	}
	
	.movie-info-body .movie-title{
		width: 300px;
		float: left;
		text-align: center;
		font-size: 12px;
		overflow: hidden;
		padding: 3px 0px;
		margin: 2px 0px;
	}
	
	.actor-info-head{
		width: 280px;
	}
	
	.actor-info-head h2{
		text-align: center;
	}
	
	.actor-info-head .actor-num{
		float: left;
		width: 50px;
		font-size: 12px;
		font-weight: bold;
		text-align: center;
	}
	
	.actor-info-head .actor-title{
		float: left;
		width: 200px;
		text-align: center;
		font-size: 12px;
		font-weight: bold;
		overflow: hidden;
		text-align: center;
	}
	
	
	.actor-info-body{
		height: 200px;
	}
	
	.actor-info-body .actor-num{
		float: left;
		width: 50px;
		font-size: 12px;
		text-align: center;
		padding: 3px 0px;
		margin: 2px 0px;
	}
	
	.actor-info-body .actor-title{
		float: left;
		width: 200px;
		text-align: center;
		font-size: 12px;
		overflow: hidden;
		padding: 3px 0px;
		margin: 2px 0px;
	}
	
	.manage-header{
		position: relative;
	}
	
	.manage-header h1{
		font-weight: bold;
		font-size: 25px;
		color: black;
	}
	
	.manage-header p{
		margin: 2px 0px;
	}
	
	.manage-body{
		position: relative;
		width: 800px;
	}
	
	.manage-list{
		margin: 0 auto;
	}
	
	.manage-navi{
		margin: 0 auto;
		width: 500px;
	}
	
	.manage-cate{
		padd
	}
	
	.btn-cate{
		background-color: #898987; /*selected: #ea1400 | none: #898987*/
	    border: none;
	    border-radius: 8px;
	    color: white;
		font-weight: bold;
	    padding: 6px 10px;
	    margin-right: 5px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 12px; 
	    cursor: pointer;
	    float: left;
	}
	
	.btn-cate:HOVER{
		background-color: #ea1400;
	}
	
	.manage-search{
		float: right;
	}
	
	.manage-search input{
		margin-right: 5px;
		padding-left: 3px;
		padding: 2px 3px 2px 0px;
		width: 197px;
		height: 19px;
		border: 1px solid #e1dfd5;
		background: #fdfcf0;
	}
	
	
	.manage-table{
		position: relative;
		top: 20px;
		width: 500px;
		min-height: 400px;
		margin: 0 auto;
		border-collapse: collapse;
	}
	
	.manage-table th{
		border-top: 1px solid #e1dfd5;
		border-bottom: 1px solid #e1dfd5;
		background-color: #edebe1;
		height: 30px;
		cursor: default;
		text-align: center;
	}
	
	.manage-row{
		padding-left: 5px;
	}
	
	.manage-row td{
		height: 30px;
		padding-left: 20px;
	}

	.manage-pagenation{
		display: inline-block;
	}
	
	.manage-pagenation a, b{
	    float: left;
	    margin-top: 2px;
	    margin-bottom: 2px;
	    padding: 8px 13px;
	    text-decoration: none;
	    border-radius: 50px;
	}
	
	.manage-pagenation b{
		cursor: default;
	}
	
	.manage-pagenation a:HOVER{
		background-color: #ea1400;
		transition: background-color .7s;
		color: white;
	}
	
	.manage-pagenation b{
		background-color: #ea1400;
		color: white;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		
		if("${keyword}" == "downcate"){
			$("#down_btn").css("background","#ea1400");
		}else{
			$("#up_btn").css("background","#ea1400");
		}
		
		$(".movie-info-body").mCustomScrollbar({theme:"rounded-dark"});
		$(".actor-info-body").mCustomScrollbar({theme:"rounded-dark"});
		
		$("#up_btn").click(function(){
			location.href='/admin/manage/connection?keyword=upcate';
		});
		
		$("#down_btn").click(function(){
			location.href='/admin/manage/connection?keyword=downcate';
		});
		
		$("#search_btn").click(function(){
			searchOption();
		});
		
		$("#search_bar").keypress(function(e){
			if(e.keyCode == 13){
				searchOption();
			}
		});
		
		$(".movie-info-body .movie-title").click(function(){

			$("#m_num").val($(this).data("movie-num"));
			$(".movie-info-body .movie-title").css({
				background: "none",
				color: "#666666"
			});
			
			$(this).css({
				background: "black",
				color: "white"
			});
			
		});
		
		$(".actor-info-body .actor-title").click(function(){
			$("#a_num").val($(this).data("actor-num"));
		
			$(".actor-info-body .actor-title").css({
				background: "none",
				color: "#666666"
			});
			
			$(this).css({
				background: "black",
				color: "white"
			});
			
		});
		
		$("#manageForm").submit(function(){
			
			return check();
		});
		
	});

function check(){
	
	if($("#m_num").val() == ""){
		alert("영화를 선택하세요!");
		return false;
	}
	
	if($("#a_num").val() == ""){
		alert("배우를 선택하세요!")
		return false;
	}
	
	return;
}

function searchOption(){
	var content = $("#search_bar").val();
	
	if(content == ""){
		alert("검색할 내용을 입력하세요!");
		return false;
	}
	
	location.href='/admin/manage/connection?keyword=search&val='+content;
}
</script>
</head>
<body>
<div class="manage-wrap">
	<div class="manage-header">
		<h1>연결 관리</h1>
		<p>영화와 배우의 정보를 연결시켜주는 페이지 입니다.</p>
	</div>
	
	<div class="manage-body">
		<div class="manage-info">
			<div class="movie-info" style="float: left;">
				<div class="movie-info-head">
					<h2>영화 정보</h2>
					<div class="movie-num">번호</div>
					<div class="movie-title">제목</div>
				</div>
				
				<div style="clear: both;"></div>
				
				<div class="movie-info-body">
					<c:forEach items="${mList}" var = "list">
						<div class="movie-num">${list.m_num}</div>
						<div class="movie-title" data-movie-num="${list.m_num}" style="text-align: left;">${list.m_title1}(${list.m_title2})</div>
						<div style="clear: both;"></div>
					</c:forEach>
				</div>
			</div>
			
			<div class="actor-info" style="float: right;">
				<div class="actor-info-head">
					<h2>배우 정보</h2>
					<div class="actor-num">번호</div>
					<div class="actor-title">제목</div>
				</div>
				
				<div style="clear: both;"></div>
				
				<div class="actor-info-body">
					<c:forEach items="${aList}" var = "list">
						<div class="actor-num">${list.a_num}</div>
						<div class="actor-title" data-actor-num="${list.a_num}" style="text-align: left;">${list.a_kor_name}</div>
						<div style="clear: both;"></div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<div class="manage-insert" style="clear: both; text-align: right; margin: 20px 0px">
			<form action="/admin/manage/connection" method="post" id="manageForm">
				<input type="hidden" id="m_num" name="m_num">
				<input type="hidden" id="a_num" name="a_num">
				<button type="submit" class="my-btn"><span>등록</span></button>
			</form>		
		</div>
		<hr style="margin: 50px 0px 30px;">
		
		<div class="manage-list">
			<h2 align="center" style="margin: 0px; margin-bottom: 20px;">등록 현황</h2>
			<div class="manage-navi">
				<div class="manage-cate">
					<button type="button" id="up_btn" class="btn-cate">오름차순</button>
					<button type="button" id="down_btn" class="btn-cate">내림차순</button>
				</div>
				<div class="manage-search">
					<input type="text" id="search_bar" placeholder="영화의 제목을 입력해주세요.">
					<button id="search_btn" class="my-btn"><span>검색하기</span></button>
				</div>
			</div>
			<div style="clear: both;"></div>
			<table class="manage-table">
				<tr>
					<th>영화</th>
					<th>배우</th>
					<th>삭제</th>
				</tr>
					<!-- forEach -->
				<c:forEach items="${viewData.mgList}" var = "list">
					<tr class="manage-row">
						<td data-movie-num="${list.m_num}">${list.m_title1}</td>
						<td data-actor-num="${list.a_num}">${list.a_kor_name}</td>
						<td><button type="button" onclick="location.href='/admin/manage/connectionDel?a_num=${list.a_num}&m_num=${list.m_num}'">삭제</button></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3" style="text-align: center;">
					<div class="manage-pagenation">
						<c:if test="${viewData.start != 1 }">
							<a href="/admin/manage/connection?page=1">처음</a>
							<a href="/admin/manage/connection?page=${viewData.start-1 }">이전</a>
						</c:if>
						
						<c:forEach begin="${viewData.start}" end="${viewData.end<viewData.last ? viewData.end:viewData.last }" var="i">
							<c:choose>
								<c:when test="${i==viewData.current }">
									<b>${i}</b>
								</c:when>
								<c:otherwise>
									<a href="/admin/manage/connection?page=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> 
						
						<c:if test="${viewData.end < viewData.last }">
							<a href="/admin/manage/connection?page=${viewData.end+1}">다음</a>	
							<a href="/admin/manage/connection?page=${viewData.last}">마지막</a>					
						</c:if>
					</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

</body>
</html>