<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.manage-wrap{
		position: relative;
		width: 900px;
		margin: 0 auto;
		color: #666666;
		cursor: default;
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
	
	.manage-table{
		position: relative;
		top: 20px;
		width: 400px;
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
	}

	.manage-pagenation{
		display: inline-block;
	}
	
	.manage-pagenation a, b{
	    float: left;
	    padding: 8px 16px;
	    text-decoration: none;
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

	.manage-info{
		margin-top: 20px;
		width: 700px
	}

	.manage-info h2{
		text-align: center;
	}
	
	.manage-info .movie-info{
		margin-left: 20px;
	}
	
	.manage-info .actor-info{
		margin-right: 20px;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$(".movie-title").click(function(){

			$("#m_num").val($(this).data("movie-num"));
			$(".movie-title").css({
				background: "none",
				color: "#666666"
			});
			
			$(this).css({
				background: "black",
				color: "white"
			});
			
		});
		
		$(".actor-title").click(function(){
			$("#a_num").val($(this).data("actor-num"));
		
			$(".actor-title").css({
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
		alert("영화를 선택하세요!")
		return false;
	}
	
	if($("#a_num").val() == ""){
		alert("배우를 선택하세요!")
		return false;
	}
	
	return;
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
		<div class="manage-list">
			<table class="manage-table">
				<tr>
					<th>영화</th>
					<th>배우</th>
				</tr>
					<!-- forEach -->
				<c:forEach items="${viewData.mgList}" var = "list">
					<tr class="manage-row">
						<td data-movie-num="${list.m_num}">${list.m_title1}</td>
						<td data-actor-num="${list.a_num}">${list.a_kor_name}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="manage-info">
			<div class="movie-info" style="float: left;">
				<h2>영화정보</h2>
				<table class="movie-table">
					<tr>
						<th>번호</th>
						<th>제목</th>
					</tr>
					<!-- forEach -->
					<c:forEach items="${mList}" var = "list">
						<tr class="movie-row">
							<td>${list.m_num}</td>
							<td class="movie-title" data-movie-num="${list.m_num}">${list.m_title1}(${list.m_title2})</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="actor-info" style="float: right;">
				<h2>배우정보</h2>
				<table class="actor-table">
					<tr>
						<th>번호</th>
						<th>이름</th>
					</tr>
					<c:forEach var="list" items="${aList}">
						<tr class="actor-row">
							<td>${list.a_num}</td>
							<td class="actor-title" data-actor-num="${list.a_num}">${list.a_kor_name}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<div class="manage-insert" style="clear: both;">
			<form action="/admin/manage/connection" method="post" id="manageForm">
				<input type="hidden" id="m_num" name="m_num">
				<input type="hidden" id="a_num" name="a_num">
				<button type="submit"><span>등록</span></button>
			</form>		
		</div>
	</div>
</div>

</body>
</html>