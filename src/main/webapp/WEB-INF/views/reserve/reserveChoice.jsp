<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link rel="stylesheet" href="/resources/css/jquery.mCustomScrollbar.css" />
	<script src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.js"></script>
	<link rel="stylesheet" href="/resources/css/reserve/choice.css">
	<script type="text/javascript" src="/resources/js/reserve/reserveChoice.js"></script>
	
</head>
<body>
	<div id="reserve_Choice_wrap">
		<div id="col-head"></div>
		
		<div id="personWrap">
			<div id="section-numberofpeople">
				<div id="a_count_type">
					<span class="typeSpan">일반</span>
					<img src="/resources/images/reserve/reserve_count/select0.jpg" id="a_0" class="ct"/>
					<img src="/resources/images/reserve/reserve_count/p1.jpg" id="a_1" class="ct"/>
					<img src="/resources/images/reserve/reserve_count/p2.jpg" id="a_2" class="ct"/>
					<img src="/resources/images/reserve/reserve_count/p3.jpg" id="a_3" class="ct"/>
					<img src="/resources/images/reserve/reserve_count/p4.jpg" id="a_4" class="ct"/>
					<img src="/resources/images/reserve/reserve_count/p5.jpg" id="a_5" class="ct"/>
					<img src="/resources/images/reserve/reserve_count/p6.jpg" id="a_6" class="ct"/>
				</div>
				
				<div id="b_count_type">
					<span class="typeSpan">청소년</span>
					<img src="/resources/images/reserve/reserve_count/select0.jpg" id="c_0" name="c_ct_img" class="ct"/>
					<img src="/resources/images/reserve/reserve_count/p1.jpg" id="c_1" name="c_ct_img" class="ct"/>
					<img src="/resources/images/reserve/reserve_count/p2.jpg" id="c_2" name="c_ct_img" class="ct"/>
					<img src="/resources/images/reserve/reserve_count/p3.jpg" id="c_3" name="c_ct_img" class="ct"/>
					<img src="/resources/images/reserve/reserve_count/p4.jpg" id="c_4" name="c_ct_img" class="ct"/>
					<img src="/resources/images/reserve/reserve_count/p5.jpg" id="c_5" name="c_ct_img" class="ct"/>
					<img src="/resources/images/reserve/reserve_count/p6.jpg" id="c_6" name="c_ct_img" class="ct"/>
				</div>
				
				<div id="seat_type">
					<span class="typeSpan">묶음선택</span>
					<label>
						<input type="radio" name="seattype" value="st_img1" disabled="disabled"/>
						<img id="st_img1" src="/resources/images/reserve/reserve_img/seat_1.jpg"/>
					</label>
					<label>
						<input type="radio" name="seattype" value="st_img2" disabled="disabled"/>
						<img id="st_img2" src="/resources/images/reserve/reserve_img/seat_2.jpg"/>
					</label>
					<label>
						<input type="radio" name="seattype" value="st_img3" disabled="disabled"/>
						<img id="st_img3" src="/resources/images/reserve/reserve_img/seat_3.jpg"/>
					</label>
				</div>
			</div>
			
			<div id="section-screenInfo">
				<div id="col-screen-step">
					<p>${theaterInfo.t_name }&nbsp;&nbsp;|&nbsp;&nbsp;${screenInfo.s_title }&nbsp;&nbsp;|&nbsp;&nbsp;남은좌석 <span style="color: #ca4d10; font-size: 13px; font-weight: bold;">${screenInfo.s_cnt_seat - fn:length(seatList) }</span>/${screenInfo.s_cnt_seat }</p>
					<p>${dateInfo} ${timeInfo } ~ ${movieEndTime }</p>
				</div>
			</div>
		</div>
	
		<div id="screenDiv">
			<img src="/resources/images/reserve/reserve_img/screen.PNG"/>

			<%-- 좌석 --%>
			<div id="seat">
				<c:set var="seatABC" value="${seatABC }"/>
				<fmt:parseNumber var="check" type="number" value="${(screenInfo.s_cnt_seat/22) }" integerOnly="true"/>
				<c:choose>
					<c:when test="${(screenInfo.s_cnt_seat%22) != 0 }"> <%-- 총좌석을 22로 나눈 나머지가 0이 아니라면 --%>
						<c:set var="check" value="${check+1 }"/>
						<c:forEach var="i" begin="1" end="${(screenInfo.s_cnt_seat/22)+1 }">
							<img src="${seatABC[i-1] }"/>
							<c:choose>
								<c:when test="${i==check }">
									<c:forEach var="j" begin="1" end="${screenInfo.s_cnt_seat%22 }">
										<c:if test="${j==5||j==19 }">
											&nbsp;&nbsp;
										</c:if>
										<c:set var="stNum" value="${i+64 }:${j}"/>
										<c:set var="img_src" value="/resources/images/reserve/reserve_img/${j }.jpg"/>
										<c:choose>
											<c:when test="${empty seatList }">
												<img src="${img_src }" id="${i+64 }:${j}" name="seatImg" onclick="countSeatClick(this);"
													style="cursor:pointer;" onmouseover="seatOver(this);" onmouseout="seatOut(this);"/>
											</c:when>
											<c:otherwise>
												<c:forEach var="list" items="${seatList }">
													<c:choose>
														<c:when test="${stNum==list }">
															<c:set var="img_src" value="/resources/images/reserve/reserve_img/seat_false.jpg"/>
														</c:when>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${img_src=='/resources/images/reserve/reserve_img/seat_false.jpg' }">
														<img src="${img_src }" id="${i+64 }:${j}" name="seatImg"/>
													</c:when>
													<c:otherwise>
														<img src="${img_src }" id="${i+64 }:${j}" name="seatImg" onclick="countSeatClick(this);"
																   style="cursor:pointer;" onmouseover="seatOver(this);" onmouseout="seatOut(this);"/>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								
								<c:otherwise>
									<c:forEach var="j" begin="1" end="22">
										<c:if test="${j==5||j==19 }">
											&nbsp;&nbsp;
										</c:if>
										<c:set var="stNum" value="${i+64 }:${j}"/>
										<c:set var="img_src" value="/resources/images/reserve/reserve_img/${j }.jpg"/>
										<c:choose>
											<c:when test="${empty seatList }">
												<img src="${img_src }" id="${i+64 }:${j}" name="seatImg"
													 onclick="countSeatClick(this);"
													style="cursor:pointer;" onmouseover="seatOver(this);" onmouseout="seatOut(this);"/>
											</c:when>
											<c:otherwise>
												<c:forEach var="list" items="${seatList }">
													<c:choose>
														<c:when test="${stNum==list }">
															<c:set var="img_src" value="/resources/images/reserve/reserve_img/seat_false.jpg"/>
														</c:when>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${img_src=='/resources/images/reserve/reserve_img/seat_false.jpg' }">
														<img src="${img_src }" id="${i+64 }:${j}" name="seatImg"/>
													</c:when>
													<c:otherwise>
														<img src="${img_src }" id="${i+64 }:${j}" name="seatImg" onclick="countSeatClick(this);"
																   style="cursor:pointer;" onmouseover="seatOver(this);" onmouseout="seatOut(this);"/>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<br/>
						</c:forEach>
					</c:when>
					
					<c:otherwise> <%-- 총 좌석을 나눈 나머지가 0이라면 --%>
						<c:forEach var="i" begin="1" end="${screenInfo.s_cnt_seat/22 }">
							<img src="${seatABC[i-1] }"/>
							<c:choose>
								<c:when test="${i==check+1 }">
									<c:forEach var="j" begin="1" end="${screenInfo.s_cnt_seat%22 }">
										<c:if test="${j==5||j==19 }">
											&nbsp;&nbsp;
										</c:if>
										<c:set var="stNum" value="${i+64 }:${j}"/>
										<c:set var="img_src" value="/resources/images/reserve/reserve_img/${j }.jpg"/>
										<c:choose>
											<c:when test="${empty seatList }">
												<img src="${img_src }" id="${i+64 }:${j}" name="seatImg" onclick="countSeatClick(this);"
													style="cursor:pointer;" onmouseover="seatOver(this);" onmouseout="seatOut(this);"/>
											</c:when>
											<c:otherwise>
												<c:forEach var="list" items="${seatList }">
													<c:choose>
														<c:when test="${stNum==list }">
															<c:set var="img_src" value="/resources/images/reserve/reserve_img/seat_false.jpg"/>
														</c:when>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${img_src=='/resources/images/reserve/reserve_img/seat_false.jpg' }">
														<img src="${img_src }" id="${i+64 }:${j}" name="seatImg"/>
													</c:when>
													<c:otherwise>
														<img src="${img_src }" id="${i+64 }:${j}" name="seatImg" onclick="countSeatClick(this);"
																   style="cursor:pointer;" onmouseover="seatOver(this);" onmouseout="seatOut(this);"/>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach var="j" begin="1" end="22">
										<c:if test="${j==5||j==19 }">
											&nbsp;&nbsp;
										</c:if>
										<c:set var="stNum" value="${i+64 }:${j}"/>
										<c:set var="img_src" value="/resources/images/reserve/reserve_img/${j }.jpg"/>
										<c:choose>
											<c:when test="${empty seatList }">
												<img src="${img_src }" id="${i+64 }:${j}" name="seatImg"
													 onclick="countSeatClick(this);"
													style="cursor:pointer;" onmouseover="seatOver(this);" onmouseout="seatOut(this);"/>
											</c:when>
											<c:otherwise>
												<c:forEach var="list" items="${seatList }">
													<c:choose>
														<c:when test="${stNum==list }">
															<c:set var="img_src" value="/resources/images/reserve/reserve_img/seat_false.jpg"/>
														</c:when>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${img_src=='/resources/images/reserve/reserve_img/seat_false.jpg' }">
														<img src="${img_src }" id="${i+64 }:${j}" name="seatImg"/>
													</c:when>
													<c:otherwise>
														<img src="${img_src }" id="${i+64 }:${j}" name="seatImg"
																	onclick="countSeatClick(this);"
																   style="cursor:pointer;" onmouseover="seatOver(this);" onmouseout="seatOut(this);"/>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<br/>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			
			<div id="entrance"></div>
			
			<div id="reserve-info-icon">
				<div id="ri_icon1">
					<span></span><b>선택</b>
				</div>
				
				<div id="ri_icon2">
					<span></span><b>예매완료</b>
				</div>
			</div>
		</div>
		
	</div>
	
	
	<!-- 하단 시커먼 바~ -->
	<div id="tnb-container">
		<div id="tnb-area">
			<a href="#" id="btn-left"></a>
			
			<div id="tnb-movie-step">
				<img alt="movie poster" src="/resources/images/movie/poster/${movieInfo.m_poster }" width="74px" height="104px">
			</div>
			
			<div id="tnb-movie-step2">
				<div>${movieInfo.m_title1 }</div>				
				<div>${movieInfo.m_grade }</div>
			</div>
			
			<div id="tnb-theater-step">
				<div id="tnb-theaterInfo"><span>극장</span>${theaterInfo.t_name }</div>
				<div id="tnb-dateInfo"><span>일시</span>${dateInfo } ${timeInfo }</div>
				<div id="tnb-screenInfo"><span>상영관</span>${screenInfo.s_title }</div>
				<div id="tnb-numberInfo"><span>인원</span></div>
			</div>
			
			<div id="tnb-placeholder">
				<div id="lineBlock"></div>
			</div>
			
			<div id="paymentInfo"></div>
			
			<a href="#" id="btn_right"></a>
		</div>
	</div>
	
	
	<!-- 예매정보를 담을 폼 -->
	<form action="/reserve/selectPay" id="reserveInfoForm" method="post">
		<input type="hidden" id="rv_theater" name="rv_theater" value="${theaterInfo.t_name }">
		<input type="hidden" id="rv_screen" name="rv_screen" value="${screenInfo.s_title }">
		<input type="hidden" id="rv_date" name="rv_date" value="${dateInfo }">
		<input type="hidden" id="rv_time" name="rv_time" value="${timeInfo }">
		<input type="hidden" id="rv_endtime" name="rv_endtime" value="${movieEndTime }">
		<input type="hidden" id="rv_people" name="rv_people">
		<input type="hidden" id="rv_pay" name="rv_pay">
		<input type="hidden" id="rv_seat" name="rv_seat">
		<input type="hidden" id="m_num" name="m_num" value="${movieInfo.m_num }">
		<input type="hidden" id="t_num" name="t_num" value="${theaterInfo.t_num }">
		<input type="hidden" id="s_num" name="s_num" value="${screenInfo.s_num }">
	</form>
	
</body>
</html>