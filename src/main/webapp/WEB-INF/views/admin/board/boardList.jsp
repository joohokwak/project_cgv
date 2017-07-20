<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/event/eventPage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.css">
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#board_menu").css({
		background : "#343132",
		color: "#fff"		
	});
});
</script>
</head>
<body>
	<!-- boardListWrap 시작 -->
	<div id="boardListWrap">
		<div class="list_title">
			<h2 class="sub_title">이벤트&컬쳐</h2>
			<p>CGV의 이벤트와 각종 문화소식을 확인할 수 있는 게시판입니다.</p>			
		</div>	
		<!-- blist 시작 -->
		<table class="blist">
			<!-- search 시작 -->
			<div class="search">
				<form action="boardlist" class="select_form">
					<select name="type" class="s_select" style="width:100px;">
						<option value="1">제목</option>
						<option value="2">내용</option>
						<option value="3">제목+내용</option>
						<option value="4">작성자</option>
					</select>
					<input type="text" name="keyword" class="s_input" style="width:185px;">
					<input type="submit" value="검색하기" class="btn_search">
				</form>	
			</div>
			<!-- search 끝 -->	
			<colgroup>
				<col style="width: 70px;"/>
				<col style="width: 100px;"/>
				<col style="width: 580px;"/>
				<col style="width: 140px;"/>
				<col style="width: 120px;"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th scope="col">작성자</th>
					<th scope="col" class="txt" >제목</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${viewData.board}">
					<tr>
						<td>${list.b_num}</td>
						<td>[&nbsp;${list.b_writer}&nbsp;]</td>					
						<td class="txt"><a href="/admin/board/boardview?num=${list.b_num}">${list.b_title}</a></td>
						<td><fmt:formatDate value="${list.b_regdate}" type="date" /></td>
						<td>${list.b_hit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- table 끝 -->
		<!-- paging 시작 -->
		<div class="paging">
			<c:if test="${viewData.current != 1}">
				<!-- 첫페이지 -->
				<div class="btn_frist">
					<a href="/board/boardlist?page=1
								<c:if test="${type != null}">&type=${type}</c:if>
								<c:if test="${keyword != null}">&keyword=${keyword}</c:if>
								">
						<img src="/resources/images/event/btn_paging_first.jpg" alt="첫페이지">
					</a>
				</div>
				<!-- 이전페이지 -->
				<div class="btn_prev">
					<a href="/admin/board/boardlist?page=${viewData.current-1}
								<c:if test="${type != null}">&type=${type}</c:if>
								<c:if test="${keyword != null}">&keyword=${keyword}</c:if>
								"><img
						src="/resources/images/event/btn_paging_prev.jpg" alt="이전페이지">
					</a>
				</div>
			</c:if>
			<!-- page numbering 시작 -->
			<ul>
				<c:forEach var="i" begin="${viewData.start}"
					end="${viewData.end < viewData.last ? viewData.end : viewData.last}">
					<c:choose>
						<c:when test="${i == viewData.current}">
							<li><b>${i}</b></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="/admin/board/boardlist?page=${i}
										<c:if test = "${type != null}">&type=${type}</c:if>
										<c:if test = "${keyword != null}">&keyword=${keyword}</c:if>
									">${i}</a></li>

						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
			<!-- page numbering 끝 -->
			<c:if test="${viewData.current != viewData.last}">
				<div class="btn_next">
					<a href="/admin/board/boardlist?page=${viewData.current+1}
								<c:if test = "${type != null}">&type=${type}</c:if>
								<c:if test = "${keyword != null}">&keyword=${keyword}</c:if>						
					"><img src="/resources/images/event/btn_paging_next.jpg" alt="다음페이지"></a>
				</div>
				<div class="btn_end">
					<a href="/admin/board/boardlist?page=${viewData.last}
								<c:if test = "${type != null}">&type=${type}</c:if>
								<c:if test = "${keyword != null}">&keyword=${keyword}</c:if>						
					"><img src="/resources/images/event/btn_paging_end.jpg" alt="마지막페이지"></a>
				</div>
			</c:if>
		</div>			
		<!-- paging 끝 -->
		<!-- 글쓰기버튼 -->
		<input type="button" id="writeBtn" value="글쓰기" class="btn_write" onclick="location.href='/admin/board/boardwrite'">
	</div>
