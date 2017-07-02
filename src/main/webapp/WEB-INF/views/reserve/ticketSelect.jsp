<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link rel="stylesheet" href="/resources/css/reserve/ticket.css">
	<link rel="stylesheet" href="/resources/css/jquery.mCustomScrollbar.css" />
	<script src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#date-list").mCustomScrollbar({theme:"rounded-dark"});
			
		});
	</script>
</head>
<body>
	<div id="ticketSelectWrap">
		<div id="step">
			<div id="section-movie">
				<div class="col-head">영화</div>
			</div>
			
			<div id="section-theater">
				<div class="col-head">극장</div>
			</div>
			
			<div id="section-date">
				<div class="col-head">날짜</div>
				<div id="col-body">
					<div id="date-list">
						<div id="month-dimmed">
							<div>2017</div>
							<div style="font-size: 23px;">7</div>
						</div>
						
						<div id="date-dimmed">
							<c:forEach var="t" begin="1" end="31">
								<div class="select-date">
									<div>일&nbsp;${t }</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			
			<div id="section-time">
				<div class="col-head">시간</div>
				<div class="time-option">
					<span class="morning">조조</span><span class="night">심야</span>
				</div>
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
</body>
</html>