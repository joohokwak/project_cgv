<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<link rel="stylesheet" href="/resources/css/member/memberUpdatePop.css?ver=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function(){
		var phone = "${member.phone}";
		var phoneArray = phone.split('-');
		
		$(".num1").val(phoneArray[0]);
		$(".num2").val(phoneArray[1]);
		$(".num3").val(phoneArray[2]);
		
		
		var email = "${member.email}";
		var emailArray = email.split('@');
		$(".emailId").val(emailArray[0]);
		$(".emailDomain").val(emailArray[1]);
		
		
		var validationPw = true;
		var validationRePw = true;
		var validationEmail = true;
		var validationPhon = true;
	 	
		
		var re_pw = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,12}$/;
		$(".pw").keyup(function () {
			if(!re_pw.test($(this).val())){
				$(this).parent("div").find("strong").css("display", "inline");
				validationPw = false;
			}else{
				$(this).parent("div").find("strong").css("display", "none");
				validationPw = true;
			}
		});
		$(".Rpw").keyup(function() {
			if($(".pw").val()!=$(".Rpw").val()){
				$(this).parent("div").find("strong").css("display", "inline");
				validationRePw = false;
			}else{
				$(this).parent("div").find("strong").css("display", "none");
				validationRePw = true;
			}
		});
		
		var re_num = /^[0-9]+$/;
		var num1;
		$(".num1").keyup(function () {
			num1 = $(this).val();
			if((num1.charAt(0)!=0||num1.charAt(1)!=1)||(!re_num.test(num1))){
				$(this).parent("div").find("strong").css("display", "inline");
				validationPhon = false;
			}else{
				$(this).parent("div").find("strong").css("display", "none");
				validationPhon = true;
			}
			if(validationPhon&&num1.length=='3'){
				$(".num2").focus();
			}
		});
		var num2;
		$(".num2").keyup(function(){
			num2 = $(this).val();
			if(!re_num.test($(this).val())){
				$(this).parent("div").find("strong").css("display", "inline");
				validationPhon = false;
			}else{
				$(this).parent("div").find("strong").css("display", "none");
				validationPhon = true;
			}
			if(validationPhon&&num2.length=='4'){
				$(".num3").focus();
			}
		});
		var num3;
		$(".num3").keyup(function(){
			num3 = $(this).val();
			if(!re_num.test($(this).val())){
				$(this).parent("div").find("strong").css("display", "inline");
				validationPhon = false;
			}else{
				$(this).parent("div").find("strong").css("display", "none");
				validationPhon = true;
			}
		});
		
		var re_emailId = /^[a-zA-Z0-9_-]+$/;
		$(".emailId").keyup(function() {
			if(!re_emailId.test($(this).val())){
				$(this).parent("div").find("strong").css("display", "inline");
				validationEmail = false;
			}else{
				$(this).parent("div").find("strong").css("display", "none");
				validationEmail = true;
			}
		});
		
		var domain = ["직접입력 ","naver.com","nate.com","gmail.com","yahoo.com","daum.net"];
		
		str="";
		for(var count=0; count < domain.length; count++){
			str+="<option value='"+domain[count]+"'>"+domain[count]+"</option>";
		};
		
		$(".DomainSelect").append(str);
		
		$(".DomainSelect").change(function(e) {
			$(".emailDomain").val($(this).val());
		});
		
		$(".submit_btn").click(function(e) {
			
			if(((validationPw&&validationRePw)&&(validationEmail&&validationPhon))){
				var formData = new FormData($("#Uform")[0]);
				$.ajax({
	 				url : "/member/memberUpdate",
	 				type : "POST",
	 				data : formData,
	 				processData : false,
	 				contentType : false,
	 				dataType : "json",
	 				success : function(data) {
	 					if(data.result == "success") {
	 						opener.location.reload();
	 						self.close();
	 					}
	 				}
	 			});
			}else{
				if(!validationPw){
					alert("비밀번호를 확인해주세요.");
				}else if(!validationRePw){
					alert("비밀번호를 확인해주세요.");
				}else if(!validationEmail){
					alert("email을 확인해주세요.");
				}else if(!validationPhon){
					alert("휴대전화 번호를 확인해주세요.");
				}
				return false;
			}
		});
		
		if("${member.pic}"!="no_pic.png"){
			$(".profile_img").css({background: "url(/resources/upload/${member.pic})",backgroundSize: "cover",backgroundRepeat: "no-repeat" , borderRadius: "50%"});
		}
		
		$(".c_btn").click(function() {
			self.close();
		});
		
		$(".deletebtn").click(function() {
			var id = "${member.id}";
			$.confirm({
		          title: '회원 탈퇴',
		          content: 'CGV 회원정보, 포인트 내역이 삭제됩니다. ',
		          boxWidth: '400px',
		          useBootstrap: false,
		          type: 'dark',
		          icon: 'icon-spinner icon-spin icon-large',
		          buttons: {
		        	확인: {
		                  action: function(){}
		            },
		           	취소: {
		                  btnClass: 'btn-dark',
		            }
		          }
		    });
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
				<button class="deletebtn">회원탈퇴</button>
			</div>
			<div class="content">
				<form id="Uform" action="/member/memberUpdate" method="post" enctype="multipart/form-data">
					<div class="profile">
						<strong> 프로필이미지 </strong> <span class="profile_img"></span>
						<input name="file" class="input_uproad" type="file">
						<span class="profile_text">JPG, GIF, BMP 파일만 등록 가능합니다.(최대 3M)</span>
					</div>
					<div class="member_data">
					
						<div class="member_data_text">
							<strong> ${member.name } 님의 회원정보 </strong>
						</div>
						<div class="member_data_input">
							<div>
								<span>비밀번호 </span><input class="pw" type="password" value="${member.pass }" name="pass"><br>
								<strong>영문자,숫자,특수문자 조합하여 8~12자리, 아이디와 4자리이상 동일,반복 문자 숫자 불가</strong>
							</div>
							<div>
								<span>비밀번호 재입력 </span><input class="Rpw" type="password" value="${member.pass }"><br>
								<strong>비밀번호가 동일하지 않습니다.</strong>
							</div>
							<div>
								<span>휴대전화 </span><input maxlength="3" class="num1" type="text" style="width: 80px;" name="num1">-<input maxlength="4" class="num2" type="text" style="width: 80px;" name="num2">-<input maxlength="4" class="num3" type="text" style="width: 80px;" name="num3"><br>
								<strong>휴대전화 번호를 확인해주세요.</strong>
							</div>
							<div class="member_email">
								<span>이메일 </span><input class="emailId" type="text" style="width: 120px; padding: 6px;" name="emailId">@<input class="emailDomain" type="text" style="width: 120px; padding: 6px;" name="emailDomain">
								<select class="DomainSelect"></select><br>
								<strong>이메일 주소 입력 시 사용 가능 특수 문자 : - . _</strong>
							</div>
							<div style="text-align: right; padding-right: 30px;">
								<button class="submit_btn">수정</button> <button class="c_btn">취소</button>
							</div>	
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
</body>
</html>