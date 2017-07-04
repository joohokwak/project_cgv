<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<script type="text/javascript">
	$(function() {
			var toDay = new Date();
			var year  = toDay.getFullYear();
			var month = (toDay.getMonth()+1);
			var day   = toDay.getDate();
			var str = "";
			for(var i=year;i>(year-100);i--){
				str+="<option value="+i+">"+i+"</option>";	
			}
			$(".birthdayYear").append(str);
			str="";
			for(var i=1;i<13;i++){
				if(i<10){
					str+="<option value="+i+">0"+i+"</option>";
				}else{
					str+="<option value="+i+">"+i+"</option>";
				}
			}
			$(".birthdayMonth").append(str);
			str="";
			
			for(var i=1;i<((new Date( year, month, 0)).getDate())+1;i++){
					if(i<10){
						str+="<option value="+i+">0"+i+"</option>";
					}else{
						str+="<option value="+i+">"+i+"</option>";
					}
				}
			
			$(".birthdayDay").append(str);
			str="";
			$(".birthdayMonth").click(function () {
				$(".birthdayDay").empty();
				str="";
				var selectYear = $(".birthdayYear").val();
				var selectMonth =$(".birthdayMonth").val();
				
				var lastDay = ( new Date( selectYear, selectMonth, 0) ).getDate();
				
				for(var i=1;i<lastDay+1;i++){
					if(i<10){
						str+="<option value="+i+">0"+i+"</option>";
					}else{
						str+="<option value="+i+">"+i+"</option>";
					}
				}
				$(".birthdayDay").append(str);
			});
			
			
			
			var domain = ["naver.com","nate.com","gmail.com","yahoo.com","daum.net","직접 입력"];
			
			str="";
			for(var count=0; count < domain.length; count++){
				str+="<option value='"+domain[count]+"'>"+domain[count]+"</option>";
			};
			
			$(".email_domain").append(str);
			
			$(".email_domain").change(function(e) {
				$(".domain_text").val($(this).val());
			});
	});
	</script>



	<style type="text/css">
		.joinFormWrap {
			margin: 0 auto; width: 980px; margin-top: 70px;
			text-align: center;
			background-color: white;
		}
		.join_header > div{
			display: inline-block;
			margin: 0 auto;
		}
		.join_header > div > h1{
			font-size: 40px;
		}
		.join_body_area{
			width: 100%;
			margin: 0 auto;
			text-align: center;
		}
		.step_join {
			display: inline-block;
			text-align: center;
			width: 100%;
			margin: 0 auto;
		}
		.step_join > div{
			display: inline-block;
			height: 100%;
			margin: 0 auto;
			text-align: center;
		}
		.step_join > div > .step1{
			
			float: left;
			margin: 0;
		}
		.step_join > div > .step2{
			
			float: left;
			margin: 0;
		}
		.step_join > div > .step1 > div >a{
			display: inline-block;
			background: url(/resources/images/join/bg_member.png) no-repeat;
		    width: 70px;
		    height: 70px;
		    overflow: hidden;
 		    background-position: -300px -70px; 
 		  
		}
		.step_join > div > .step2> div > a{
			display: inline-block;
			background: url(/resources/images/join/bg_member.png) no-repeat;
		    width: 70px;
		    height: 70px;
		    overflow: hidden;
 		    background-position: -400px 0px;
		}
		.step_join > div > .step1> div > span {
			color: rgb(238,105,0);
		}
		.step_join > div > a {
		    display: table-cell;
		    font-weight: bold;
 		    vertical-align: bottom;
 		    transition: opacity .4s;
		}
		.step_line{
			float: left;
			width: 50px;
			height: 50px;
			text-align: center;
			margin: 10px;
		}
		
		.step_line hr{
			position: relative;
			width: 100%;
			top: 33%;
		}
		.member_data > form > table{
			width: 100%;
			border-spacing: 0;
			font-size: 20px;
			border-top: 1px solid #222;
		}
		.member_data_td1{
			width: 30%;
			background-color: rgb(248,248,248);
			text-align: left;
		}
		.member_data > form > table td{
			border-bottom: 1px solid #ddd;
			padding: 10px;
			padding-left: 20px;
		}
		
		.check_img{
			display: inline-block;
			position: relative;
			top: 5px;
			width: 20px;
		    height: 20px;
			background: url(/resources/images/join/ico_mandatory.png) no-repeat;
		}
		
		.member_data_header{
			display: inline-block;
			width: 100%;
			margin: 0 auto;
			text-align: center;
		}
		.member_data_header > div.left{
			float: left;
			font-size: 30px;
			font-weight: lighter;
		}
		.member_data_header > div.right{
			float: right;
			font-size: 15px;
		}
		.birthday select{
 			margin-right: 10px;
			padding: .5em;
 		}
 		.member_data_phon input{
 			width: 100px;
 			padding: 5px;
 			padding-left: 10px;
 		}
 		.member_data_email input{
 			width: 100px;
 			padding: 6px;
 			padding-left: 10px;
 		}
 		.member_data_email select{
 			margin-right: 10px;
			padding: .5em;
 		}
 		.id_check_btn{
 			background-color: #333;
		    border: none;
		    border-radius: 3px;
		    color: white;
		    padding: 5px 10px;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    font-size: 15px;
 		}
 		.submit_btn{
 			background-color: #333;
		    border: none;
		    border-radius: 3px;
		    color: white;
		    padding: 10px 40px;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    font-size: 15px;
 		}
 		.c_btn{
 			background-color: #fff;
		    border: 1px solid black;
		    border-radius: 3px;
		    color: black;
		    padding: 10px 40px;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    font-size: 15px;
 		}
 		.submit_wrap{
 			margin: 10px;
 			padding: 20px;
 			padding-bottom: 50px;
 		}
 		.member_join_notice{
 			font-size: 15px;
 			text-align: left;
 			padding: 20px;
 			background-color: rgb(248,248,248);
 		}
 		.member_join_notice p{
 			margin: 10px;
 		}
		
	</style>
</head>
<body>
	<div class="joinFormWrap">
		<div class="join_header">
			<div>
				<h1>회원가입</h1>
				<p>라이프스타일 멤버십 CJ ONE! 외식, 쇼핑, 엔터테인먼트 서비스를 한 장의 카드로 즐기세요~</p>
			</div>
		</div>
		<div class="join_body_area">
			<div class="member_join">
				<div class="step_join">
					<div>
						<div class="step1">
							<div>
								<a></a>
							</div>
							<div>
								<span>회원정보 입력</span>
							</div>
						</div>
						<div class="step_line">
							<hr>
						</div>
						<div class="step2">
							<div>
								<a></a>
							</div>
							<div>
								<span>가입 완료</span>
							</div>
						</div>
					</div>
				</div>
				
				<div class="member_data">
					<div class="member_data_header">
						<div class="left">
							<span>기본정보</span>
						</div>
						<div class="right">
							<a class="check_img"></a>표시는 필수 입력 사항 입니다
						</div>
					</div>
					<form action="">
						<table>
							<tr>
								<td class="member_data_td1">
									<a class="check_img"></a>이름
								</td>
								<td>
								</td>
							</tr>
							<tr>
								<td class="member_data_td1">
									<a class="check_img"></a>아이디
								</td>
								<td align="left">
									<input type="text" placeholder="아이디를 입력해주세요." style="width: 200px; height: 25px; padding-left: 10px;">
									<button type="button" class="id_check_btn" >중복확인</button>
									<br>
									<span style="font-size: 13px;">CGV,CJmall, Mnet등 기존의 CJ ONE 제휴 브랜드 회원님의 경우는 사용하고 계신 아이디가 새롭게 생성하신<br>
									통합 아이디로 변경됩니다.</span>
								</td>
							</tr>
							<tr>
								<td class="member_data_td1">
									<a class="check_img"></a>비밀번호
								</td>
								<td align="left">
									<input type="password" placeholder="비밀번호를 입력해주세요."  style="width: 200px; height: 25px; padding-left: 10px;"><br>
									<span style="font-size: 13px;">영문자,숫자,특수문자 조합하여 8~12자리, 아이디와 4자리이상 동일,반복 문자 숫자 불가<br>
									사용가능 특수 문자 : !"#$%&'()*+,-./:;<=>?@[]^_'{|}~</span>
								</td>
							</tr>
							<tr>
								<td class="member_data_td1">
									<a class="check_img"></a>비밀번호 확인
								</td>
								<td align="left">
									<input type="password" placeholder="비밀번호를 재입력해주세요."  style="width: 200px; height: 25px; padding-left: 10px;">
								</td>
							</tr>
							<tr>
								<td class="member_data_td1">
									<a class="check_img"></a>생년월일
								</td>
								<td class="birthday" align="left">
									<select class="birthdayYear" style="width: 100px;">
									</select>년
									<select class="birthdayMonth" style="width: 70px;">
									</select>월
									<select class="birthdayDay" style="width: 70px;">
									</select>일
									<br>
									<span style="font-size: 13px;">설정하신 생일을 기준으로 15일 전 생일쿠폰이 발행됩니다.</span>
								</td>
							</tr>
							<tr>
								<td class="member_data_td1">
									<a class="check_img"></a>휴대전화
								</td>
								<td class="member_data_phon" align="left">
									<input type="text" value="010"> - <input type="text"> - <input type="text"><br>
									<span style="font-size: 13px;">주문 및 배송, 쿠폰, 이벤트 정보 등을 제공 받으실 수 있습니다.</span>
								</td>
							</tr>
							<tr>
								<td class="member_data_td1">
									<a class="check_img"></a>이메일
								</td>
								<td class="member_data_email" align="left">
									<input type="text" placeholder="이메일 아이디"> @ 
									<input class="domain_text" type="text" placeholder="이메일 도메인">
									<select class="email_domain">
									</select>
									<br>
									<span style="font-size: 13px;">이메일 주소 입력 시 사용 가능 특수 문자 : - . _</span>
								</td>
							</tr>						
						</table>
							<div class="submit_wrap">
								<input class="c_btn" type="button" value="취소">
								<input class="submit_btn" type="submit" value="등록">
							</div>
							<div class="member_join_notice" >
								<p style="font-size:20px;">이용안내</p>
								
								<p>  CJ ONE 회원가입 후에도 각 제휴 브랜드 웹사이트에서 통합 아이디를 사용하여 로그인 하시려면, 각 브랜드 웹사이트의 이용약관에 대한 동의를 거친 후에 이용 가능합니다.</p>
								
								<p>  개인정보 수집 및 활용 동의 (선택)에 거부한 회원님은 마케팅 정보 수신을 받으실 수 없습니다.</p>
							</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>