<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<link rel="stylesheet" href="/resources/css/member/memberUpdatePop.css?ver=1">
<script type="text/javascript">
	$(document).ready(function(){
		var re_pw = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,12}$/;
		$(".member_data_password").focusout(function(e) {
			var pwStr = $(this).val();
			if($(".member_data_repassword").focus){
				$(".member_data_repassword").focus();
			}else{
				$(".member_data_password").focus();
			}
			if(!re_pw.test(pwStr)){
				$(this).focus;
			}
		});
		$(".member_data_password").keyup(function() {
			$(".member_data_password_span").css("display", "none");
			var pwStr = $(this).val();
			if(!re_pw.test(pwStr)){
				$(".member_data_password_span").css("display", "inline");
			}
		});
		
		var pwRStr;
		$(".member_data_repassword").keyup(function() {
			$(".member_data_repassword_span").css("display", "none");
			pwRStr = $(this).val();
			if($(".member_data_password").val()!=pwRStr){
				$(".member_data_repassword_span").css("display", "inline");
			}
		});
		$(".member_data_repassword").focusout(function() {
			if($(".member_data_password").val()!=pwRStr){
				if($(".member_data_password").focus){
					$(".member_data_password").focus();
				}else{
					$(".member_data_repassword").focus();
				}
			}
		});
	});
</script>
</head>
<body>
	<div class="popWrap">
		<div class="header">
			<span>나의 프로필 수정</span>
		</div>
		<div class="body">
			<div class="name">
				<span>${member.name } 님 </span><strong>( ${member.id } )</strong>
			</div>
			<div class="content">
				<form>
					<div class="profile">
						<strong> 프로필이미지 </strong> <span class="profile_img"></span>
						<input class="input_uproad" type="file">
						<span class="profile_text">JPG, GIF, BMP 파일만 등록 가능합니다.(최대 3M)</span>
					</div>
					<div class="member_data">
						<div class="member_data_text">
							<strong> ${member.name }님의 회원정보 </strong>
						</div>
						<div class="member_data_input">
							<div>
								<span>비밀번호 </span><input type="text"><br>
								<strong></strong>
							</div>
							<div>
								<span>비밀번호 재입력 </span><input type="text"><br>
								<strong></strong>
							</div>
							<div>
								<span>휴대전화 </span><input type="text">-<input type="text">-<input type="text"><br>
								<strong></strong>
							</div>
							<div>
								<span>이메일 </span><input type="text">@<input type="text"><select></select><br>
								<strong></strong>
							</div>
							<div>
								<input type="submit"><button type="button">취소</button><br>
							</div>	
						</div>
					</div>
					
				</form>
			</div>
		</div>

	</div>
</body>
</html>