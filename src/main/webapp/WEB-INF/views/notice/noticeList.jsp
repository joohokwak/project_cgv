<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="v" value="${viewData}"></c:set>
<style type="text/css">
	
	*{
		color: #666666;
	}

	#noticeWrap{
		margin: 0 auto; width: 100%; min-height: 600px;
	}
	
	#category{
		margin: 20px 0px;
		position: relative;
		left: 432px;
	}
	
	table{
		width: 800px;
		margin: 20px;
		padding: 20px;
		border-collapse: collapse;
	}
	
	th{
		border-top: 1px solid #e1dfd5;
		border-bottom: 1px solid #e1dfd5;
		background-color: #edebe1;
		height: 37px;
	}
	
	td{
		height: 46px;
		text-align: center;
	}
	
	.btn-cate{
		background-color: #898987; /*selected: #ea1400 | none: #898987*/
	    border: none;
	    border-radius: 8px;
	    color: white;
		font-weight: bold;
	    padding: 15px 32px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 12px;
	}
</style>

<div id="noticeWrap" align="center" >
	<div id="category" align="left">
		<button type="button" class="btn-cate">전체</button>
		<button type="button" class="btn-cate">시스템점검</button>
		<button type="button" class="btn-cate">극장</button>
		<button type="button" class="btn-cate">기타</button>
	</div>
	<table>
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
				<td>${list.n_cate}</td>
				<td style="text-align: left;">
					<a href="noticeView?num=${list.n_num}">${list.n_title}</a>
				</td>
				<td>
					<fmt:formatDate value="${list.n_regdate}"/>
				</td>
				<td>${list.n_hit}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
			<c:if test="${v.start != 1 }">
				<a href="noticeList?page=1">[처음]</a>
				<a href="noticeList?page=${viewData.start-1 }">[이전]</a>
			</c:if>
			
			<c:forEach begin="${v.start}" end="${v.end<v.last ? v.end:v.last }" var="i">
				<c:choose>
					<c:when test="${i==v.current }">
						<b>[${i}]</b>
					</c:when>
					<c:otherwise>
						<a href="noticeList?page=${i}">[${i}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach> 
			
			<c:if test="${v.end < v.last }">
				<a href="noticeList?page=${v.end+1}">[다음]</a>	
				<a href="noticeList?page=${v.last}">[마지막]</a>					
			</c:if>
			</td>
		</tr>
	</table>
</div>
