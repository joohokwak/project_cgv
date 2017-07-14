<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="v" value="${viewData}"></c:set>
<style type="text/css">
	
	.notice-wrap{
		margin: 30px auto; 
		color: #666666;
	}
	
	.notice-header{
		margin: 5px;
		padding: 10px;
	}
	
	.notice-header h1{
		font-weight: bold;
		font-size: 25px;
		color: black;
	}
	
	.notice-body{
		margin: 5px;
		padding: 10px;
		width: 800px;
	}
	
	#category{
		position: relative;
		top: 13px;
		left: 20px;
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
	}
	
	.btn-cate:HOVER{
		background-color: #ea1400;
	}
	
	
	.notice-table{
		position: relative;
		top: 50px;
		left: 20px;
		width: 800px;
		border-collapse: collapse;
	}
	
	.notice-table th{
		border-top: 1px solid #e1dfd5;
		border-bottom: 1px solid #e1dfd5;
		background-color: #edebe1;
		height: 37px;
		cursor: default;
	}
	
	.notice-table td{
		height: 46px;
		text-align: center;
	}
	
	.notice-pagenation{
		display: inline-block;
	}
	
	.notice-pagenation a, b{
	    float: left;
	    padding: 8px 16px;
	    text-decoration: none;
	    cursor: default;
	    transition: background-color .3s;
	}
	
	.notice-pagenation a:HOVER{
		background-color: #ea1400;
		color: white;
	}
	
	
	
	.notice-pagenation b{
		background-color: #ea1400;
		color: white;
	}
	
	.my-btn{
		border: none;
		background-color: #222222;
		border-radius: 4px;
		width: 72px;
		height: 32px;
		display: inline-block;
		margin: 0px;
		padding-bottom: 2px;
		
	}
	.my-btn span{
		border: 1px solid #5b5b58;
		border-radius: 4px;
		text-decoration: none;
		padding: 4px 14px;
		font-size: 10px;
		color: white;
	}
</style>

<div class="notice-wrap">
	<div class="notice-header">
		<h1>공지사항</h1>
		<p>공지사항을 관리하는 페이지 입니다.</p>
	</div>
	<div class="notice-body">
		<div id="category" align="left">
			<button type="button" class="btn-cate">전체</button>
			<button type="button" class="btn-cate">시스템점검</button>
			<button type="button" class="btn-cate">극장</button>
			<button type="button" class="btn-cate">기타</button>
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
				<tr>
					<td>${list.n_num}</td>
					<td>${list.n_cate}</td><!-- [ ] 넣어야 함. -->
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
				<td colspan="5" align="right" style="text-align: center">
					<button type="button" class="my-btn" onclick="location.href='/admin/notice/insert'">
						<span>글쓰기</span>
					</button>
				</td>
			</tr>
			<tr>
				<td colspan="5">
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
