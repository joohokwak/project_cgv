<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.joinComWrap {
	margin: 0 auto;
	width: 980px;
	margin-top: 50px;
	text-align: center;
	background-color: white;
}

.com_header {
	background: url(/resources/images/join/joincomplate.png) no-repeat;
	width: 100%;
	height: 184px;
	border-top: 1px solid black;
	line-height: 350px;
}
.com_header span{
	font-size: 18px;
	font-weight: bold;
	
}
.com_data{
	display: inline-block;
	margin-top: 50px;
	background-color: white;
}

.member_pic {
	width: 120px;
	height: 100px;
	float: left;
}

.join_header>div {
	display: inline-block;
	margin: 0 auto;
}

.join_header>div>h1 {
	font-size: 40px;
}

.com_body {
	width: 100%;
	background-color: rgb(248, 248, 248);
	padding-bottom: 50px;
}

.member_data {
	display: inline-block;
	background-color: white;
	border: 1px solid white;
	width: 250px;
	height: 100px;
	line-height: 100px;
}
.member_data > span{
	font-size: 15px;
}

.step_join {
	display: inline-block;
	text-align: center;
	width: 100%;
	margin: 0 auto;
	margin-bottom: 50px;
}

.step_join>div {
	display: inline-block;
	height: 100%;
	margin: 0 auto;
	text-align: center;
}

.step_join>div>.step1 {
	float: left;
	margin: 0;
}

.step_join>div>.step2 {
	float: left;
	margin: 0;
}

.step_join>div>.step1>div>a {
	display: inline-block;
	background: url(/resources/images/join/bg_member.png) no-repeat;
	width: 70px;
	height: 70px;
	overflow: hidden;
	background-position: -300px 0px;
}

.step_join>div>.step2>div>a {
	display: inline-block;
	background: url(/resources/images/join/bg_member.png) no-repeat;
	width: 70px;
	height: 70px;
	overflow: hidden;
	background-position: -400px -70px;
}

.step_join>div>.step2>div>span {
	color: rgb(238, 105, 0);
}

.step_join>div>a {
	display: table-cell;
	font-weight: bold;
	vertical-align: bottom;
	transition: opacity .4s;
}

.step_line {
	float: left;
	width: 50px;
	height: 50px;
	text-align: center;
	margin: 10px;
}

.step_line hr {
	position: relative;
	width: 100%;
	top: 33%;
}
</style>
</head>
<body>
	<div class="joinComWrap">
		<div class="join_header">
			<div>
				<h1>회원가입</h1>
				<p>라이프스타일 멤버십 CJ ONE! 외식, 쇼핑, 엔터테인먼트 서비스를 한 장의 카드로 즐기세요~</p>
			</div>
		</div>
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
		<div class="com_body">
			<div class="com_header">
				<span style="color: #ee6900">CGV</span><span>회원가입을 축하합니다.</span>
			</div>
			<div class="com_data">
				<div class="member_pic">
					<img alt="" src="/resources/images/join/no_pic.png" width="100px">
				</div>
				<div class="member_data">
							<span>CJ ONE 아이디 </span>
							<span style="color: #ee6900">${param.id }</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>