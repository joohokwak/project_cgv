<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<link rel="stylesheet" href="/resources/css/member/myCGV.css?ver=1">
<script type="text/javascript">
$(function(){
	$(".member_data_update_btn").click(function() {
		window.open("/member/memberUpdatePop", "새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	});
	
	$(".favoriteTheaters_update").click(function() {
		window.open("/member/favoriteTheaterPop", "새창", "width=700, height=580, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	});
	$(".theaters_in").click(function() {
		if(!$(this).children("span").text()){
			window.open("/member/favoriteTheaterPop", "새창", "width=700, height=580, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
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
	})
});

</script>
</head>
<body>
	<div class="myCGVFormWrap">
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
		<div class="myCGVbody">
			<div>
				
			</div>
		</div>
	</div>
</body>
</html>