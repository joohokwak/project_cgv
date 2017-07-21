<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="v" value="${viewData}"></c:set>
<link rel="stylesheet" type="text/css" href="/resources/css/admin/mybtn.css" />
<style type="text/css">
	
	.notice-wrap{
		position: relative;
		width: 900px;
		margin: 0 auto;
		color: #666666;
		cursor: default;
	}
	
	.notice-header{
		position: relative;
	}
	
	.notice-header h1{
		font-weight: bold;
		font-size: 25px;
		color: black;
	}
	
	.notice-body{
		position: relative;
		width: 800px;
	}
	
	.notice-search{
		position: relative;
		top: 15px;
	}
	
	.notice-search select{
		margin-right: 5px;
		padding: 2px 3px 2px 0px;
		width: 100px;
		height: 24px;
		border-color: #e1dfd5;
		background: #fdfcf0;
	}
	
	.notice-search input{
		margin-right: 5px;
		padding-left: 3px;
		padding: 2px 3px 2px 0px;
		width: 197px;
		height: 19px;
		border: 1px solid #e1dfd5;
		background: #fdfcf0;
	}
	
	#category{
		position: relative;
		top: 40px;
		border-bottom: 1px solid #898987;
	}
	
	.btn-cate{
		background-color: #898987; /*selected: #ea1400 | none: #898987*/
	    border: none;
	    border-radius: 8px 8px 0px 0px;
	    color: white;
		font-weight: bold;
	    padding: 12px 20px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 12px; 
	    cursor: pointer;
	}
	
	.notice-count{
		position: relative;
		top: 60px;
	}
	
	.btn-cate:HOVER{
		background-color: #ea1400;
	}
	
	.notice-table{
		position: relative;
		margin-top: 80px;
		width: 800px;
		border-collapse: collapse;
	}
	
	.notice-table th{
		border-top: 1px solid #e1dfd5;
		border-bottom: 1px solid #e1dfd5;
		background-color: #edebe1;
		height: 37px;
		cursor: default;
		text-align: center;
	}
	
	.notice-row:HOVER{
		background-color: #eae8e1;
	}
	
	.notice-row td{
		height: 46px;
		text-align: center;
		cursor: default;
	}
	
	.notice-row td a{
		width: 100%;
		padding: 10px 0px;
		display: inline-block;
		text-decoration: none;
	}
	
	.notice-pagenation{
		display: inline-block;
	}
	
	.notice-pagenation a, b{
	    float: left;
	    padding: 8px 13px;
	    text-decoration: none;
	    border-radius: 50px;
	}
	
	.notice-pagenation b{
	    cursor: default;
	}
	
	.notice-pagenation a:HOVER{
		background-color: #ea1400;
		transition: background-color .7s;
		color: white;
	}
	
	.notice-pagenation b{
		background-color: #ea1400;
		color: white;
	}
	
	.my-btn{
      width: 73px;
      height: 26px;
      background: url("/resources/images/btn_bg.gif") no-repeat;
      color:#fff;
      border: 0;
      cursor: pointer;
   }
   
   .my-btn span{
      text-align: center;
      line-height: 8px;
      font-size: 12px; 
      font-weight: bold;
         
   }
   
   .my-btn:HOVER{
   	opacity: 0.9;
   }
</style>
<script type="text/javascript">
$(function(){
	
	$("#notice_menu").css({
		background : "#343132",
		color: "#fff"		
	});
	
	$("#all").click(function(){
		location.href='/notice/list?keyword=all'
	});
	
	$("#check").click(function(){
		location.href='/notice/list?keyword=check'
	});
	
	$("#theater").click(function(){
		location.href='/notice/list?keyword=theater'
	});
	
	$("#etc").click(function(){
		location.href='/notice/list?keyword=etc'
	});
	
	$("#search").click(function(){
		search();
	});
	
	$("#search_bar").keypress(function(e){
		if(e.keyCode == 13){
			search();
		}
	});
	
	switch("${keyword}"){
	case "check" :
		$("#check").css("background","#ea1400");		
		break;
	case "theater" :
		$("#theater").css("background","#ea1400");
		break;
	case "etc" : 
		$("#etc").css("background","#ea1400");
		break;
	
	default : 
		$("#all").css("background","#ea1400");
	}
	
});

function search(){
	var key = $("#search_select").val();
	var search_val = $.trim($("#search_bar").val());
	
	if(search_val == ""){
		alert("검색할 내용을 입력하세요!");
		return false;
	}
	location.href='/notice/list?keyword='+ key +'&val=' + search_val;
}
</script>

<div class="notice-wrap">
	<div class="notice-header">
		<h1>공지사항</h1>
		<p>공지사항을 관리하는 페이지 입니다.</p>
	</div>
	<div class="notice-body">
		<div class="notice-search">
			<select id="search_select">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" id="search_bar" placeholder="검색어를 입력해주세요.">
			<button id="search" class="my-btn"><span>검색하기</span></button>
		</div>
		<div id="category" align="left">
			<button type="button" id="all" class="btn-cate">전체</button>
			<button type="button" id="check" class="btn-cate">시스템점검</button>
			<button type="button" id="theater" class="btn-cate">극장</button>
			<button type="button" id="etc" class="btn-cate">기타</button>
		</div>
		<div class="notice-count">
			<span id="cnt_text">총 <strong>${v.nCount}</strong>이 검색되었습니다.</span>
		</div>
		<table class="notice-table">
			<tr>
				<th style="width: 34px">번호</th>
				<th style="width: 76px">구분</th>
				<th style="width: 570px">제목</th>
				<th style="width: 64px">등록일</th>
				<th style="width: 56px">조회수</th>
			</tr>
			<c:forEach var="list" items="${v.nList}">
				<tr class="notice-row">
					<td>${list.n_num}</td>
					<td>[${list.n_cate}]</td>
					<td style="text-align: left;">
						<a href="view?num=${list.n_num}">${list.n_title}</a>
					</td>
					<td>
						<fmt:formatDate value="${list.n_regdate}"/>
					</td>
					<td>${list.n_hit}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="right" style="text-align: right; padding-top: 20px; padding-bottom: 20px;" >
					<button type="button" class="my-btn" onclick="location.href='/notice/insert'" style="margin-right: 15px;">
						<span>글쓰기</span>
					</button>
				</td>
			</tr>
			<tr>
				<td colspan="5" style="text-align: center; padding-top: 10px; padding-bottom: 10px;" >
				<div class="notice-pagenation">
					<c:if test="${v.start != 1 }">
						<a href="list?page=1">처음</a>
						<a href="list?page=${viewData.start-1 }">이전</a>
					</c:if>
					
					<c:forEach begin="${v.start}" end="${v.end<v.last ? v.end:v.last }" var="i">
						<c:choose>
							<c:when test="${i==v.current }">
								<b>${i}</b>
							</c:when>
							<c:otherwise>
								<a href="list?page=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach> 
					
					<c:if test="${v.end < v.last }">
						<a href="list?page=${v.end+1}">다음</a>	
						<a href="list?page=${v.last}">마지막</a>					
					</c:if>
				</div>
				</td>
			</tr>
		</table>
	</div>
</div>
