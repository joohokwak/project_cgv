<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link rel="stylesheet" href="/resources/css/reserve/choice.css">
</head>
<body>
	<div id="reserve_Choice_wrap">
		
	</div>
	
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
				<div id="tnb-screenInfo"><span>상영관</span>${screenInfo }</div>
				<div id="tnb-numberInfo"><span>인원</span></div>
			</div>
			
			<div id="tnb-placeholder">
				<div id="lineBlock"></div>
			</div>
			
			<div id="paymentInfo"></div>
			
			<a href="#" id="btn_right"></a>
		</div>
	</div>
</body>
</html>