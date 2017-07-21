<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<link rel="stylesheet" href="/resources/css/member/favoriteTheaterPop.css?ver=1">
<script type="text/javascript">
	$(function() {
		var selectbtn = $(".selectLoc_btn");
		selectbtn.click(function() {
			if($(".selectCGV").val()=="CGV선택"){
				alert("CGV를 선택하세요.");			
			}else {
				var check = false;
				for(var i=1;i<6;i++){
					if($("#spanf"+i).text()==$(".selectCGV").val()){
						check = true;
					}
				}
				
				if(check){
					alert("이미 등록된 CGV입니다.")
				} else if(!$("#spanf1").text()){
					$("#spanf1").text($(".selectCGV").val());
					$("#f1").val($(".selectCGV").val());
				} else if(!$("#spanf2").text()){
					$("#spanf2").text($(".selectCGV").val());
					$("#f2").val($(".selectCGV").val());
				} else if(!$("#spanf3").text()){
					$("#spanf3").text($(".selectCGV").val());
					$("#f3").val($(".selectCGV").val());
				} else if(!$("#spanf4").text()){
					$("#spanf4").text($(".selectCGV").val());
					$("#f4").val($(".selectCGV").val());
				} else if(!$("#spanf5").text()){
					$("#spanf5").text($(".selectCGV").val());
					$("#f5").val($(".selectCGV").val());
				}
				
				for(var i = 1; i < 6; i++) {
					if($("#spanf"+i).text()) {
						$("#spanf"+i).parent().parent().parent().css("border", "2px solid #333");
					}
				}
			}
		});
		
		
		var deleltebtn1 = $(".theater_delete_btn1");
		deleltebtn1.click(function() {
			if(!$("#spanf1").text()){
				
			}else{
				$("#spanf1").text($("#spanf2").text());
				$("#f1").val($("#spanf1").text());
				
				$("#spanf2").text($("#spanf3").text());
				$("#f2").val($("#spanf2").text());
				
				$("#spanf3").text($("#spanf4").text());
				$("#f3").val($("#spanf3").text());
				
				$("#spanf4").text($("#spanf5").text());
				$("#f4").val($("#spanf4").text());
				
				$("#spanf5").text("");
				$("#f5").val($("#spanf5").text());
				
				for(var i = 1; i < 6; i++) {
					if(!$("#spanf"+i).text()) {
						$("#spanf"+i).parent().parent().parent().css("border", "2px dashed #333");
					}
				}
			}
		});
		
		var deleltebtn2 = $(".theater_delete_btn2");
		deleltebtn2.click(function() {
			if(!$("#spanf2").text()){
				
			}else{
				$("#spanf2").text($("#spanf3").text());
				$("#f2").val($("#spanf2").text());
				
				$("#spanf3").text($("#spanf4").text());
				$("#f3").val($("#spanf3").text());
				
				$("#spanf4").text($("#spanf5").text());
				$("#f4").val($("#spanf4").text());
				
				$("#spanf5").text("");
				$("#f5").val($("#spanf5").text());
				
				for(var i = 1; i < 6; i++) {
					if(!$("#spanf"+i).text()) {
						$("#spanf"+i).parent().parent().parent().css("border", "2px dashed #333");
					}
				}
			}
		});
		
		
		
		var deleltebtn3 = $(".theater_delete_btn3");
		deleltebtn3.click(function() {
			if(!$("#spanf2").text()){
				
			}else{
				$("#spanf3").text($("#spanf4").text());
				$("#f3").val($("#spanf3").text());
				
				$("#spanf4").text($("#spanf5").text());
				$("#f4").val($("#spanf4").text());
				
				$("#spanf5").text("");
				$("#f5").val($("#spanf5").text());
				
				for(var i = 1; i < 6; i++) {
					if(!$("#spanf"+i).text()) {
						$("#spanf"+i).parent().parent().parent().css("border", "2px dashed #333");
					}
				}
			}
		});
		
		var deleltebtn4 = $(".theater_delete_btn4");
		deleltebtn4.click(function() {
			if(!$("#spanf2").text()){
				
			}else{
				$("#spanf4").text($("#spanf5").text());
				$("#f4").val($("#spanf4").text());
				
				$("#spanf5").text("");
				$("#f5").val($("#spanf5").text());
				
				for(var i = 1; i < 6; i++) {
					if(!$("#spanf"+i).text()) {
						$("#spanf"+i).parent().parent().parent().css("border", "2px dashed #333");
					}
				}
			}
		});
		
		var deleltebtn5 = $(".theater_delete_btn5");
		deleltebtn5.click(function() {
			if(!$("#spanf2").text()){
				
			}else{
				$("#spanf5").text("");
				$("#f5").val($("#spanf5").text());
				
				for(var i = 1; i < 6; i++) {
					if(!$("#spanf"+i).text()) {
						$("#spanf"+i).parent().parent().parent().css("border", "2px dashed #333");
					}
				}
			}
		});
		
		
		
		// submit
		$(".submit_btn").click(function(e) {
			
			$.ajax({
				url : "/member/memberFupdate",
				type : "post",
				data : 	$("#Fform").serialize(),
				dataType : "text",
				success : function(data) {
					if(data == "success") {
						opener.location.reload();
						self.close();
					}
				}
			});
			
			//$("#Fform").submit();
		});
		
		
		$(".c_btn").click(function() {
			self.close();
		})
	});
	
	

	
</script>
</head>
<body>
	<div class="popWrap">
		<div class="header">
			<span>자주 가는 CGV 설정</span>
		</div>
		<div class="bodyWrap">
			<div class="body">
				<p>
					"영화관을 선택하여 등록해주세요."<strong>최대 5개까지</strong>
					"등록하실 수 있습니다."
				</p>
				<span>
					<select class="selectLoc">
						<option>서울 전체</option>
						
					</select>
					<select class="selectCGV">
						<option selected="selected">CGV선택</option>
						<c:forEach var="i" items="${tList }">
						<option>${i.t_name }</option>	
						</c:forEach>
					</select>
					<button class="selectLoc_btn">
						<span>
							자주가는 CGV 추가
						</span>
					</button>
				</span>
			</div>
			<div class=select_choice>
				<div class="choice_theater">
				<span>${member.name }( ${member.id } ) 님이 자주가는 CGV</span>
					<ul>
						<li class="none">
							<div class="box-polaroid">
								<div class="box-inner">
									<div class="theater">
										<span id="spanf1">${member.f1 }</span>
									</div>
									<button class="theater_delete_btn1">
									</button>
								</div>
							</div>
						</li>
						<li class="none">
							<div class="box-polaroid">
								<div class="box-inner">
									<div class="theater">
										<span id="spanf2">${member.f2 }</span>
									</div>
									<button class="theater_delete_btn2">
									</button>
								</div>
							</div>
						</li>
						<li class="none">
							<div class="box-polaroid">
								<div class="box-inner">
									<div class="theater">
										<span id="spanf3">${member.f3 }</span>
									</div>
									<button class="theater_delete_btn3">
									</button>
								</div>
							</div>
						</li>
						<li class="none">
							<div class="box-polaroid">
								<div class="box-inner">
									<div class="theater">
										<span id="spanf4">${member.f4 }</span>
									</div>
									<button class="theater_delete_btn4">
									</button>
								</div>
							</div>
						</li>
						<li class="none">
							<div class="box-polaroid">
								<div class="box-inner">
									<div class="theater">
										<span id="spanf5">${member.f5 }</span>
									</div>
									<button class="theater_delete_btn5">
									</button>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="choice_table">
					<table class="choice_inner">
						<colgroup>
							<col width="25%">
							<col width="45%">
							<col width="30%">
						</colgroup>
						<thead>
							<tr>
								<td><strong>항목</strong></td>
								<td><strong>이용목적</strong></td>
								<td><strong>보유기간</strong></td>
							</tr>
							<tr>
								<td>자주가는CGV (최대 5개)</td>
								<td>상품 결제시(영화 예매시) 편의 제공 <br>선호극장의 상영작 및 상영시간 우선 제공</td>
								<td>별도 동의 철회시까지 또는 약관 철회 후 1주일까지</td>
							</tr>
							<tr>
								<td colspan="3" align="center" style="padding-top: 50px;">
									<form id="Fform" action="/member/memberFupdate">
										<input type="hidden" id="f1" name="f1" value="${member.f1 }">
										<input type="hidden" id="f2" name="f2" value="${member.f2 }">
										<input type="hidden" id="f3" name="f3" value="${member.f3 }">
										<input type="hidden" id="f4" name="f4" value="${member.f4 }">
										<input type="hidden" id="f5" name="f5" value="${member.f5 }">
										<input type="submit" class="submit_btn" value="등록">
										<button type="button" class="c_btn">취소</button>
									</form>
								</td>
							</tr>
							
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>