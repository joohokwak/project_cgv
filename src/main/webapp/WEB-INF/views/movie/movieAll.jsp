<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link rel="stylesheet" href="/resources/css/movie/movieAll.css?ver=1">
</head>
<body>
	<div id="movieAllWrap">
		
		<ul>
			<c:forEach var="ma" items="${mAll }" varStatus="st">
				<li class="box-li">
					<div class="box-image">
						<a href="/movie/movieDetail?m_num=${ma.m_num }">
							<img alt="moviePoster" src="/resources/images/movie/poster/${ma.m_poster }" width="185px" height="260px">
						</a>
					</div>
					
					<div class="box-contents">
						<a href="/movie/movieDetail?m_num=${ma.m_num }">
							<strong class="title">${ma.m_title1 }</strong>
			            </a>
			            
						<span class="txt-info">
							<strong>
								${ma.m_start }
								<span>개봉</span>
							</strong>
						</span>
						<span class="like">
							<button class="btn-like" value="79738">하트</button>
						<span class="count">
							
						</span>
						<a class="link-reservation" href="/reserve/reserveHome?m_num=${ma.m_num }"></a>
						</span>
					</div>
				</li>
				
				<c:if test="${st.index == 4 }">
					<li class="box-div"></li>
				</c:if>
			</c:forEach>
		</ul>
		
		<div class="box-div2"></div>
		
		<div class="paging">
			<c:forEach var="i" begin="${p.startPage }" end="${p.endPage < p.pageTotalCount ? p.endPage : p.pageTotalCount }">
				<span class="paging-span">
					<a href="/movie/movieAll?pageNum=${i }">${i }&nbsp;</a>
				</span>
			</c:forEach>
		</div>
		
		
	</div>
</body>
</html>