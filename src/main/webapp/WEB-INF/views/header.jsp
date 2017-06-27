<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

html, body, ul, ol, dl, li, h1, h3, h4, dl, dt, dd, fieldset, a, a:hover
	{
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 12px;
	text-decoration: none;
	list-style: none;
	color: #666;
}

input, select, img {
	vertical-align: middle;
}

body {
	background-color: #fdfcf0;
	margin: 0;
	padding: 0;
}

#headerWrap {
	width: 100%;
	height: 153px;
	background: url('resources/images/header/header.png') repeat-x 0 30px;
	z-index: 0;
}

#headerWrap #header {
	width: 980px;
	position: relative;
	overflow: hidden;
	margin: 0 auto;
}

#topmenu {
	width: 210px;
	height: 30px; hidden;
	float: right;
	text-align: right;
	z-index: 100;
}

#topmenu ul {
	overflow: hidden;
	margin: 0;
	padding: 0;
}

#topmenu ul li {
	float: left;
}
/* #topmenu ul li a { text-decoration: none; }  */
#topmenu ul .topmenu01 {
	width: 49px;
	height: 30px;
}

#topmenu ul .topmenu02 {
	width: 59px;
	height: 30px;
}

#topmenu ul .topmenu03 {
	width: 59px;
	height: 30px;
}

#head {
	width: 980px;
	margin: 0 auto;
}

#head h1 {
	width: 223px;
	height: 85px;
	padding: 43px 0 0 22px;
	top: 40px;
	left: 0;
}

#head h2 {
	position: absolute;
	top: 42px;
	left: 50%;
	margin-left: -234px;
	width: 428px;
	text-align: center;
}

#head h2 img {
	vertical-align: middle;
}

#head .gnb {
	position: absolute;
	top: 86px;
	width: 376px;
	overflow: hidden;
	left: 50%;
	margin-left: -234px;
}

#head .gnb li {
	float: left;
}

#head .gnb li a {
	margin: 0 13px;
}
</style>


<div id="headerWrap">
	<!-- header 시작 -->
	<div id="header">
		<!-- topmenu 시작 -->
		<div id="topmenu">
			<ul>
				<li class="topmenu01">
					<a href="#">
						<img src="resources/images/header/img_login.jpg">
					</a>
				</li>
				
				<li class="topmenu02">
					<a href="#">
						<img src="resources/images/header/img_join.jpg">
					</a>
				</li>
				
				<li class="topmenu03">
					<a href="#">
						<img src="resources/images/header/img_mycgv.jpg">
					</a>
				</li>
			</ul>
		</div>
		<!-- topmenu 끝 -->
		<div id="head">
			<!-- logo 시작 -->
			<h1>
				<a href="/cgv/"><img src="resources/images/header/cgvLogo.png"></a>
			</h1>
			<!-- logo 끝 -->
			<h2>
				<img src="resources/images/header/h2_theater.png">
			</h2>
			<!-- gnb 시작 -->
			<ul class="gnb">
				<li>
					<a href="#">
						<img src="resources/images/header/img_menu_01.jpg">
					</a>
				</li>
				
				<li>
					<a href="#">
						<img src="resources/images/header/img_menu_02.jpg">
					</a>
				</li>
				
				<li>
					<a href="#">
						<img src="resources/images/header/img_menu_03.jpg">
					</a>
				</li>
				
				<li>
					<a href="#">
						<img src="resources/images/header/img_menu_04.jpg">
					</a>
				</li>
			</ul>
			<!-- gnb 끝 -->
		</div>
	</div>
	<!-- headerWrap 끝 -->
</div>
