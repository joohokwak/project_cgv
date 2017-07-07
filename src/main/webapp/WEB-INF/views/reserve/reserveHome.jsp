<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link rel="stylesheet" href="/resources/css/reserve/ticket.css?ver=1">
	<link rel="stylesheet" href="/resources/css/jquery.mCustomScrollbar.css" />
	<script src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="/resources/js/reserve/reserveHome.js"></script>
	<script type="text/javascript">
		$(function() {
			m_numMove("${m_num }", "${m_poster}", "${m_title1}", "${m_grade}");
		});
	</script>
</head>
<body>
	<div id="ticketSelectWrap">
		<div id="step">
			<div id="section-movie">
				<div class="col-head">영화</div>
				<div class="col-head2">
					&nbsp;&nbsp;예매율순
					<span></span>
				</div>
				<div id="reserve-movie-list">
					<c:forEach var="movie" items="${movieList }">
						<c:choose>
							<c:when test="${movie.m_num == m_num }">
								<div class="col-movie" style="background: #333; ">
									<input type="hidden" class="m_num" value="${movie.m_num }">
									<input type="hidden" class="m_poster" value="${movie.m_poster }">
									<input type="hidden" class="m_title1" value="${movie.m_title1 }">
									<input type="hidden" class="m_grade" value="${movie.m_grade }">
									<div class="col-movie2" style="border: 1px solid gray;">
										<c:choose>
											<c:when test="${movie.m_grade == '12세 이상' }">
												<div class="icon" style="background: url('/resources/images/reserve/icon_ratings.png') 0px -30px no-repeat;"></div>
											</c:when>
											<c:when test="${movie.m_grade == '15세 이상' }">
												<div class="icon" style="background: url('/resources/images/reserve/icon_ratings.png') 0px -65px no-repeat;"></div>
											</c:when>
											<c:when test="${movie.m_grade == '청소년 관람불가' }">
												<div class="icon" style="background: url('/resources/images/reserve/icon_ratings.png') 0px -100px no-repeat;"></div>
											</c:when>
											<c:otherwise>
												<div class="icon" style="background: url('/resources/images/reserve/icon_ratings.png') 0px 0px no-repeat;"></div>
											</c:otherwise>
										</c:choose>
										
										<div class="text" style="color: #fff;">${movie.m_title1 }</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-movie">
									<input type="hidden" class="m_num" value="${movie.m_num }">
									<input type="hidden" class="m_poster" value="${movie.m_poster }">
									<input type="hidden" class="m_title1" value="${movie.m_title1 }">
									<input type="hidden" class="m_grade" value="${movie.m_grade }">
									<div class="col-movie2">
										<c:choose>
											<c:when test="${movie.m_grade == '12세 이상' }">
												<div class="icon" style="background: url('/resources/images/reserve/icon_ratings.png') 0px -30px no-repeat;"></div>
											</c:when>
											<c:when test="${movie.m_grade == '15세 이상' }">
												<div class="icon" style="background: url('/resources/images/reserve/icon_ratings.png') 0px -65px no-repeat;"></div>
											</c:when>
											<c:when test="${movie.m_grade == '청소년 관람불가' }">
												<div class="icon" style="background: url('/resources/images/reserve/icon_ratings.png') 0px -100px no-repeat;"></div>
											</c:when>
											<c:otherwise>
												<div class="icon" style="background: url('/resources/images/reserve/icon_ratings.png') 0px 0px no-repeat;"></div>
											</c:otherwise>
										</c:choose>
										
										<div class="text">${movie.m_title1 }</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
			
			<div id="section-theater">
				<div class="col-head">극장</div>
				<div class="col-head2">
					&nbsp;&nbsp;서울전체
					<span></span>
				</div>
				
				<div id="reserve-theater-list">
					<c:forEach var="theater" items="${theaterList }">
						<div class="col-theater">
							<div class="col-theater2">
								${theater.t_name }
								<input type="hidden" class="t_num" value="${theater.t_num }">
							</div>
						</div>
					</c:forEach>
				</div>
				
			</div>
			
			<div id="section-date">
				<div class="col-head">날짜</div>
				<div id="col-body">
					<div id="date-list">
						<div id="date_table"></div>
					</div>
				</div>
			</div>
			
			<div id="section-time">
				<div class="col-head">시간</div>
				<div class="time-option">
					<span class="morning">조조</span><span class="night">심야</span>
				</div>
				
				<div id="movieTimeTable"></div>
			</div>
		</div>
	</div>
	
	<div id="tnb">
		<div id="step1">
			<div id="infoMovie">
				<div class="infoBlock"></div>
			</div>
			
			<div id="infoTheater">
				<div class="infoBlock"></div>
				<div id="row-theater"></div>
				<div id="row-date"></div>
				<div id="row-screen"></div>
				<div id="row-number"></div>
			</div>
			
			<div id="infoPath">
				<div id="path2">
					
				</div>
				
				<div id="path3">
					
				</div>
			</div>
			
			<div id="step-btn">
				
			</div>
		</div>
	</div>
	
	<!-- 로그인 창 -->
	<div id="loginDiv">
		<div id="login_hd">
			<div id="login_title">CGV 회원 로그인</div>
			<a id="btn_close_x">닫기</a>
		</div>
		
		<div id="login_bd">
			<div id="login_bd_form">
				<div id="login_wrap_id">
					<input type="text" id="loginDivId" tabindex="1">
				</div>
				
				<div id="login_wrap_pw">
					<input type="password" id="loginDivPw" tabindex="2">
				</div>
				
				<div id="login_wrap_btn">
					<button id="login_bd_btn" tabindex="3">로그인</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- 좌석 선택 페이지로 넘겨줄 데이터 -->
	<form id="reserveChoiceForm" action="/reserve/reserveChoice" method="post">
		<input type="hidden" id="movieInfo" name="movieInfo">
		<input type="hidden" id="theaterInfo" name="theaterInfo">
		<input type="hidden" id="screenInfo" name="screenInfo">
		<input type="hidden" id="dateInfo" name="dateInfo">
		<input type="hidden" id="mtDateInfo" name="mtDateInfo">
		<input type="hidden" id="timeInfo" name="timeInfo">
	</form>
</body>
</html>