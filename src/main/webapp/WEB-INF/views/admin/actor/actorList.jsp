<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="v" value="${viewData}"></c:set>
<div>
	<a href="/admin/actor/insertForm" class="btn btn-default">글쓰기</a>
	<table>
		<tr>
			<th style="width: 34px">번호</th>
			<th style="width: 76px">이름</th>
		</tr>
		<c:forEach var="list" items="${v.aList}">
			<tr>
				<td>${list.a_num}</td>
				<td>${list.a_kor_name}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="2">
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

