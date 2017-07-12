<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<style type="text/css">
		#boardListWrap { position:relative; margin: 0 auto; width: 100%; margin-top: 70px;  }
		table,td { width:980px; margin:0 auto; text-align: center; }
		.search { width:500px; position:absolute; left:50%; margin-left:170px; top:0; }
		.blist { padding-top:40px; }
	</style>
</head>
<body>
	<!-- boardListWrap 시작 -->
	<div id="boardListWrap">
		<!-- blist 시작 -->
		<table class="blist">
			<!-- search 시작 -->
			<div class="search">
				<form action="boardlist">
					<select name="type">
					<option value="1">제목</option>
					<option value="2">내용</option>
					<option value="3">제목+내용</option>
					<option value="4">작성자</option>
					</select>
					<input type="text" name="keyword">
					<input type="submit" value="검색">
				</form>	
			</div>
			<!-- search 끝 -->	
			<tr>
				<td colspan="5"></td>
			</tr>
			<tr>
				<th width="5%">번호</th>
				<th width="60%">제목</th>
				<th width="20%">작성자</th>
				<th width="10%">작성일</th>
				<th width="5%">조회수</th>
			</tr>
			
			<c:forEach var="list" items="${viewData.board}">
				<tr>
					<td>${list.b_num}</td>
					<td><a href="/board/boardview?num=${list.b_num}">${list.b_title}</a></td>
					<td>${list.b_writer}</td>
					<td><fmt:formatDate value="${list.b_regdate}" type="date" /></td>
					<td>${list.b_hit}</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="5" align="center">	
					<c:if test="${viewData.current != 1}">
						<!-- 첫페이지 -->
						<a href="/board/boardlist?page=1
							<c:if test="${type != null}">&type=${type}</c:if>
							<c:if test="${keyword != null}">&keyword=${keyword}</c:if>
							">[처음]
						</a>
						<!-- 이전페이지 -->
						<a href="/board/boardlist?page=${viewData.current-1}
							<c:if test="${type != null}">&type=${type}</c:if>
							<c:if test="${keyword != null}">&keyword=${keyword}</c:if>
							">[이전]
						</a>
					</c:if>
					<!-- page numbering 링크x-->
					<c:forEach var="i" begin="${viewData.start}" end="${viewData.end < viewData.last ? viewData.end : viewData.last}">
						<c:choose>
							<c:when test="${i == viewData.current}">
								<b>[${i}]</b>
							</c:when>
							<c:otherwise>
								<a href="/board/boardlist?page=${i}
									<c:if test = "${type != null}">&type=${type}</c:if>
									<c:if test = "${keyword != null}">&keyword=${keyword}</c:if>
								">[${i}]
								</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${viewData.current != viewData.last}">
						<a href="/board/boardlist?page=${viewData.current+1}
							<c:if test = "${type != null}">&type=${type}</c:if>
							<c:if test = "${keyword != null}">&keyword=${keyword}</c:if>						
						">[다음]</a>
						<a href="/board/boardlist?page=${viewData.last}
							<c:if test = "${type != null}">&type=${type}</c:if>
							<c:if test = "${keyword != null}">&keyword=${keyword}</c:if>						
						">[마지막]</a>					
					</c:if>
				</td>
			</tr>
			<a href="/board/boardwrite"><input type="button" value="글쓰기"></a>
		</table>
		<!-- table 끝 -->
	</div>
	<!-- boardListWrap 끝 -->
</body>
</html>