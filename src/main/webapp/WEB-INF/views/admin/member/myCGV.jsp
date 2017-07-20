<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<link rel="stylesheet" href="/resources/css/member/myCGV.css?ver=1">
<link rel="stylesheet" href="/resources/css/jquery.mCustomScrollbar.css" />
<script src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".scroll").mCustomScrollbar({theme:"rounded-dark"});
	$(".member_data_update_btn").click(function() {
		window.open("/admin/member/memberUpdatePop?id=${member.id}", "새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=no" );  
	});
	
	$(".favoriteTheaters_update").click(function() {
		window.open("/admin/member/favoriteTheaterPop?id=${member.id}", "새창", "width=700, height=580, toolbar=no, menubar=no, scrollbars=no, resizable=no" );  
	});
	$(".theaters_in").click(function() {
		if(!$(this).children("span").text()){
			window.open("admin/member/favoriteTheaterPop?id=${member.id}", "새창", "width=700, height=580, toolbar=no, menubar=no, scrollbars=no, resizable=no" );  
		}else{
			
			$.ajax({
				url : "/member/findTheater",
				type : "post",
				data : 	{"t_name" : $(this).children("span").text()},
				dataType : "json",
				success : function(data) {
					location.replace("/movie/theaterHome?t_num="+data.t_num);
				}
			});
		}
	});
	
	var pre;
	$(".theaters").hover(function(i) {
		pre = $(this).css("border");
		$(this).css("border", "2px solid white");
	}, function(o) {
		$(this).css("border", pre);
	});
	
	
	if("${member.pic}"!="no_pic.png"){
		$(".member_img").css({background: "url(/resources/upload/${member.pic})",backgroundSize: "cover",backgroundRepeat: "no-repeat" , borderRadius: "50%"});
	}
});

</script>
</head>
<body>
	<div class="myCGVFormWrap" style="min-height: 700px;">
		<div style="width: 100%; background: url(/resources/images/body/block.png)">
		<div class="myCGVheard">
			<span class="member_img" ></span>
				<div class="member_context_wrap" >
					<div class="name_text">
						<span class="name_span">${member.name } 님</span>
						<span class="id_span">&nbsp;&nbsp;&nbsp;${member.id }</span>
						<button class="member_data_update_btn"></button>
					</div>
					<div class="point_text">
						<span class="point_span">고객님의 사용가능 포인트는  <strong class="member_point">${point } point</strong> 입니다</span>
					</div>
				</div>
				<div class="favoriteTheaters">
				<ul>
					<li class="theaters">
						<div class="theaters_in">
							<span>${member.f1 }</span>
						</div>					
					</li>
					<li class="theaters">
						<div class="theaters_in">
							<span>${member.f2 }</span>
						</div>		
					</li>
					<li class="theaters">
						<div class="theaters_in">
							<span>${member.f3 }</span>
						</div>		
					</li>
					<li class="theaters">
						<div class="theaters_in">
							<span>${member.f4 }</span>
						</div>		
					</li>
					<li class="theaters">
						<div class="theaters_in">
							<span>${member.f5 }</span>
						</div>		
					</li>
					<li>
						<button class="favoriteTheaters_update">
							<span>자주가는 CGV<br>설정하기</span>
						</button>
					</li>		
				</ul>
				</div>
				
		</div>
		</div>
		<div class="myCGVbody">
			<div class="myCGVbody_type2">
			나의 예매내역
			</div>
			
			<div class="scroll" style="height: 750px;">
			<c:forEach var="i" items="${reserve }">
			
				<div class="myCGVbody_type2_block">
					<div class="img_box">
						<a href="/movie/movieDetail?m_num=${i.m_num }">
							<img alt="" src="/resources/images/movie/poster/${i.m_poster }" height="180px;">
						</a>
					</div>
					<div class="contents_box">
						<div class="contents_box_detail">
							<dl>
								<dd class="contents_box_detail_title">
									<a href="/movie/movieDetail?m_num=${i.m_num }">${i.m_title1 } (${i.m_title2 })</a>
								</dd>
								<dd>
									<em>관람극장</em>
									<a><strong>${i.rv_theater }</strong></a><br>
								</dd>
								<dd>
									<em>관람일시</em>
									<strong style="color: red;">${i.rv_time }</strong>
								</dd>
								<dd>
									<em>상영관</em>
									<strong>${i.rv_screen }</strong>
								</dd>
								<dd>
									<em>관람인원</em>
									<strong>${i.rv_people }</strong>
								</dd>
								<dd>
									<em>관람좌석</em>
									<strong>${i.rv_seat }</strong>
								</dd>
							</dl>
						</div>
					</div>
					<div class="detail_box">
						<div class="detail_box_div">
							<table style="border-spacing: 0;">
								<tr>
									<th style="border-bottom: 1px solid gray;">티켓 가격</th>
									<td style="border-bottom: 1px solid gray;"><strong>${i.rv_pay } 원</strong></td>
								</tr>
								<tr>
									<th>총 결제금액</th>
									<td><strong style="color: blue;">${i.rv_pay } 원</strong></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>