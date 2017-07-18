<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="v" value="${viewData}"></c:set>
<link rel="stylesheet" href="/resources/css/admin/mybtn.css">
<style type="text/css">

	.movie-wrap{
		position: relative;
		width: 900px;
		color: #666666;
		cursor: default;
	}
	
	.movie-header{
		position: relative;
		left: 70px; 
	}
	
	.movie-header h1{
		font-weight: bold;
		font-size: 25px;
		color: black;
	}
	
	.movie-header p{
		margin: 2px 0px;
	}
	
	.movie-body{
		position: relative;
		left: 70px; 
		width: 800px;
	}
	
	.movie-table{
		position: relative;
		top: 20px;
		width: 800px;
		border-collapse: collapse;
	}
	
	.movie-table th{
		border-top: 1px solid #e1dfd5;
		border-bottom: 1px solid #e1dfd5;
		background-color: #edebe1;
		height: 37px;
		cursor: default;
		text-align: center;
	}
	
	.movie-row:HOVER{
		background-color: #eae8e1;
	}
	
	.movie-row td{
		height: 46px;
		cursor: default;
	}
	
	.movie-row td a{
		width: 100%;
		padding: 10px 0px;
		display: inline-block;
		text-decoration: none;
	}
	
	.movie-pagenation{
		display: inline-block;
	}
	
	.movie-pagenation a, b{
	    float: left;
	    padding: 8px 16px;
	    text-decoration: none;
	}
	
	.movie-pagenation b{
		cursor: default;
	}
	
	.movie-pagenation a:HOVER{
		background-color: #ea1400;
		transition: background-color .7s;
		color: white;
	}
	
	.movie-pagenation b{
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

<div class="movie-wrap">
	<div class="movie-header">
		<h1>영화 정보</h1>
		<p>영화의 정보를 확인하는 페이지 입니다.</p>
		<p>영화의 제목을 클릭하면 수정, 삭제 페이지로 이동합니다.</p>
	</div>
	<div class="movie-body">
		<table class="movie-table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>추천수</th>
			</tr>
			<!-- forEach -->
			<c:forEach items="${v.mList}" var = "list">
				<tr class="movie-row">
					<td style="text-align: center;">${list.m_num}</td>
					<td><a href="/admin/movie/update?num=${list.m_num}">${list.m_title1}(${list.m_title2})</a></td>
					<td style="text-align: center;">${list.m_like}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="3" align="right"><button type="button" class="my-btn" onclick="location.href='/admin/movie/insert'"><span>영화등록</span></button></td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center;">
				<div class="movie-pagenation">
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
