<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="v" value="${viewData}"></c:set>

<div id="movieWrap" style="border: 1px solid; margin: 50px 0px 0px 30px; ">
	<div class="sk-header">
		<h1>영화 정보</h1>
		<p>모든 영화의 정보를 확인하는 페이지 입니다.</p>
	</div><!-- header -->
	<div style="font-size: 15px; font-weight: bold;">
		<a href="/admin/movie/insertForm">영화 등록</a>
	</div>
	<div class="sk-body">
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>수정</th>
			</tr>
			<!-- forEach -->
			<c:forEach items="${v.mList}" var = "list">
				<tr>
					<td>${list.m_num}</td>
					<td>${list.m_title1}(${list.m_title2})</td>
					<td><a href="/admin/movie/updateForm?num=${list.m_num}">수정</a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="3">
				<c:if test="${v.start != 1 }">
					<a href="list?page=1">[처음]</a>
					<a href="list?page=${viewData.start-1 }">[이전]</a>
				</c:if>
				
				<c:forEach begin="${v.start}" end="${v.end<v.last ? v.end:v.last }" var="i">
					<c:choose>
						<c:when test="${i==v.current }">
							<b>[${i}]</b>
						</c:when>
						<c:otherwise>
							<a href="list?page=${i}">[${i}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach> 
				
				<c:if test="${v.end < v.last }">
					<a href="list?page=${v.end+1}">[다음]</a>	
					<a href="list?page=${v.last}">[마지막]</a>					
				</c:if>
				</td>
			</tr>
		</table>
	</div>
</div>
