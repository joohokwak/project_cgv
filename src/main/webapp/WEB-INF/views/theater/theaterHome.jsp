<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAzBEdZoHEd7k23D4qn57h2RGxqusMTEeI&callback=initMap" async defer></script>
	<link rel="stylesheet" href="/resources/css/movie/theaterHome.css?ver=1">
	
	<script type="text/javascript">
		$(function() {
			
			if(navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(success, fail, {timeout:6000, enableHighAccuracy:true});
				
				function success(pos) {
					myLoc = {lat:Number("${lat}"), lng:Number("${lng}")};
					initMap(myLoc);
				}
				
				function fail() {
					// 1:권한없음 , 2:위치 확인불가, 3:시간초과
					alert("현재위치 사용 불가");
				}
			}
			
			var t_num = Number("${t_num}");
			$(".sect-area ul li").each(function(i, element) {
				var tnum = Number($(this).attr("data-tnum"));
				
				if(t_num == tnum) {
					$(this).css({background: "url(/resources/images/theater/sprite_bar_on.png) no-repeat 0 -80px", color: "#fff"});
				}
			});
			
			// 자주가는 CGV 등록 팝업
			$("#btn_set_my_favorite").click(function() {
				window.open("/member/favoriteTheaterPop", "새창", "width=700, height=580, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
			});
			
			// findTheater
			$(".findTheater").click(function(e) {
				var t_name = $.trim($(this).text());
				
				if(t_name.indexOf('CGV') != -1) {
					$.ajax({
						url : "/member/findTheater",
						type : "post",
						data : 	{"t_name" : t_name},
						dataType : "json",
						success : function(data) {
							location.replace("/movie/theaterHome?t_num="+data.t_num);
						}
					});
				}
				
			});
			
			
		});
		
		function initMap(myLoc) {
		    var myLatLng = myLoc;
		    
		    var map = new google.maps.Map(document.getElementById('map'), {
		      center: myLatLng,
		      scrollwheel: false,
		      zoom: 17
		    });
		    
		    var marker = new google.maps.Marker({
		      map: map,
		      position: myLatLng,
		      title: '${theater.t_name}'
		    });
		}
	
	</script>
</head>
<body>
	<div id="theaterWrap">
		<div id="theater-hd">
			<div id="theater-selector">
				<div class="sect-favorite">
		            <h4><img src="/resources/images/theater/h4_favorite_cgv.png" alt="자주가는 CGV"></h4>
		            <ul id="favoriteTheaters">
	                    <li class="findTheater">
	                    	<a href="#">
	                    		<span>
	                    			<c:choose>
	                    				<c:when test="${not empty member.f1 }">${member.f1 }</c:when>
	                    				<c:otherwise>1순위</c:otherwise>
	                    			</c:choose>
	                    		</span>
	                    	</a>
	                    </li>
	                    <li class="findTheater">
	                    	<a href="#">
	                    		<span>
	                    			<c:choose>
	                    				<c:when test="${not empty member.f2 }">${member.f2 }</c:when>
	                    				<c:otherwise>2순위</c:otherwise>
	                    			</c:choose>
	                    		</span>
	                    	</a>
	                    </li>
	                    <li class="findTheater">
	                    	<a href="#">
	                    		<span>
	                    			<c:choose>
	                    				<c:when test="${not empty member.f3 }">${member.f3 }</c:when>
	                    				<c:otherwise>3순위</c:otherwise>
	                    			</c:choose>
	                    		</span>
	                    	</a>
	                    </li>
	                    <li class="findTheater">
	                    	<a href="#">
	                    		<span>
	                    			<c:choose>
	                    				<c:when test="${not empty member.f4 }">${member.f4 }</c:when>
	                    				<c:otherwise>4순위</c:otherwise>
	                    			</c:choose>
	                    		</span>
	                    	</a>
	                    </li>
	                    <li class="findTheater">
	                    	<a href="#">
	                    		<span>
	                    			<c:choose>
	                    				<c:when test="${not empty member.f5 }">${member.f6 }</c:when>
	                    				<c:otherwise>5순위</c:otherwise>
	                    			</c:choose>
	                    		</span>
	                    	</a>
	                    </li>
		            </ul>
		            <button id="btn_set_my_favorite" type="button" title="새창"></button>
        		</div>
        		
        		<div class="sect-city">
        			<span>서울전체</span>
        		</div>
        		
        		<div class="sect-area">
        			<ul>
        				<c:forEach var="th" items="${tList }">
       						<li data-tnum='${th.t_num }'><a href="/movie/theaterHome?t_num=${th.t_num }">${th.t_name }</a></li>
        				</c:forEach>
        			</ul>
        		</div>
			</div>
		</div>
		
		<!-- theater img -->
		<div id="theaterLogoImg">
			<div id="img-sect1">
				<img alt="theaterLogoImg" src="/resources/images/theater/h3_theater.gif">
			</div>
			
			<div class="img-sect2">
				<img alt="theaterImage" src="/resources/images/theater/${theater.t_img }" width="980px">
				
				<div class="box-contents">
					<div class="box-addr">
						${theater.t_addr1 }<br>
						${theater.t_addr2 }
					</div>
					
					<div class="box-Info">
						TEL : ${theater.t_tel }<br>
						총 <fmt:formatNumber value="${theater.t_cnt_screen }" type="number"/>석
					</div>
				</div>
			</div>
			
			<div id="map"></div>
		</div>
	</div>
</body>
</html>