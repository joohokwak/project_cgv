<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link rel="stylesheet" href="/resources/css/login.css">
</head>
<body>
	<div id="loginFormWarp">
		<div id="loginWrap">
			<img alt="loginImg" src="/resources/images/login/loginImg.jpg">
		
			<div id="tab-menu">
				<div id="tab-on">로그인</div>
			</div>
			
			<div id="tab-login">
				<div id="loginIcon">
					<img alt="loginIcon" src="/resources/images/login/login_icon4_03.png">
					
					<p>
						귀하의 정보보호를 위해 실제 사용자가<br>
						요청을 보내고 있는지 <br>
						확인하는 절차를 거치고 있습니다.
					</p>
				</div>
				
				<div id="loginCheckForm">
					<form action="#" method="post">
						<div id="idForm">
							<input type="text" name="id">
						</div>
						<div id="pwForm">
							<input type="password" name="pass">
						</div>
						
						<div id="loginButton">
							<input type="submit" value="로그인">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>