<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.js"></script>
	<link rel="stylesheet" href="/resources/css/member/joinform.css">
	<script type="text/javascript" src="/resources/js/member/joinform.js"></script>
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
					<form action="/member/memberJoinsubmit" method="post">
						<table>
							<tr>
								<td class="member_data_td1">
									<a class="check_img"></a>이름
								</td>
								<td align="left">
									<input name="name" type="text" class="member_data_name" required style="width: 200px; height: 25px; padding-left: 10px;">
									<span class="member_data_name_span" style="display: none; font-size: 13px; color: #ee6900;">이름을 확인해 주세요.</span>
								</td>
							</tr>
							<tr>
								<td class="member_data_td1">
									<a class="check_img"></a>아이디
								</td>
								<td align="left">
									<input name="id" class="member_data_id" type="text" required placeholder="아이디를 입력해주세요." style="width: 200px; height: 25px; padding-left: 10px;">
									<button type="button" class="id_check_btn">중복확인</button>
									<span class="member_data_id_span" style="display: none; color: #ee6900; font-size: 13px;">아이디를 확인해주세요(영문자, 숫자 조합하여 8~12자리)</span>
									<span class="member_data_idcheck_span" style="display: none; color: #ee6900; font-size: 13px;">중복 여부를 확인해 주세요.</span>
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
									<input name="pass" class="member_data_password" required type="password" placeholder="비밀번호를 입력해주세요."  style="width: 200px; height: 25px; padding-left: 10px;"><br>
									<span class="member_data_password_span" style="font-size: 13px;">영문자,숫자,특수문자 조합하여 8~12자리, 아이디와 4자리이상 동일,반복 문자 숫자 불가<br>
									사용가능 특수 문자 : !"#$%&'()*+,-./:;<=>?@[]^_'{|}~</span>
								</td>
							</tr>
							<tr>
								<td class="member_data_td1">
									<a class="check_img"></a>비밀번호 확인
								</td>
								<td align="left">
									<input class="member_data_repassword" required type="password" placeholder="비밀번호를 재입력해주세요."  style="width: 200px; height: 25px; padding-left: 10px;">
									<span class="member_data_repassword_span" style="color: #ee6900; display: none; font-size: 13px;">비밀번호가 동일하지 않습니다.</span>
								</td>
							</tr>
							<tr>
								<td class="member_data_td1">
									<a class="check_img"></a>생년월일
								</td>
								<td  class="birthday" align="left">
									<select name="birthYear" class="birthdayYear" style="width: 100px;">
									</select>년
									<select name="birthMonth" class="birthdayMonth" style="width: 70px;">
									</select>월
									<select name="birthDay" class="birthdayDay" style="width: 70px;">
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
									<input name="phone1" class="member_data_phon_num1" type="text" required > - <input name="phone2" type="text" class="member_data_phon_num2" required> - <input name="phone3" required type="text" maxlength="4" class="member_data_phon_num3">
									<span class="member_data_phon_span"  style="color: #ee6900; display: none; font-size: 13px;">휴대전화 번호를 확인해주세요.</span>
									<br>
									<span style="font-size: 13px;">주문 및 배송, 쿠폰, 이벤트 정보 등을 제공 받으실 수 있습니다.</span>
								</td>
							</tr>
							<tr>
								<td class="member_data_td1">
									<a class="check_img"></a>이메일
								</td>
								<td class="member_data_email" align="left">
									<input name="email_id" required class="email_id" type="text" placeholder="이메일 아이디"> @ 
									<input name="email_domain" required class="domain_text" type="text" placeholder="이메일 도메인">
									<select class="email_domain">
									</select>
									<span class="member_data_email_span" style="color: #ee6900; display: none; font-size: 13px;">이메일을 확인해주세.요</span>
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
								
								<p>  CGV 회원가입 후에도 각 제휴 브랜드 웹사이트에서 통합 아이디를 사용하여 로그인 하시려면, 각 브랜드 웹사이트의 이용약관에 대한 동의를 거친 후에 이용 가능합니다.</p>
								
								<p>  개인정보 수집 및 활용 동의 (선택)에 거부한 회원님은 마케팅 정보 수신을 받으실 수 없습니다.</p>
							</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>