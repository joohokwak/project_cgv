<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css" href="/resources/css/header.css" />
<script type="text/javascript">
	$(function() {
		if("${imgInfo}".length > 0) {
			$("#head h2 img").attr("src", "/resources/images/header/${imgInfo}");
		}
	});
</script>

<div id="headerWrap">
	<!-- header 시작 -->
	<div id="header">
		<!-- topmenu 시작 -->
		<div id="topmenu">
			<ul>
				<li class="topmenu01">
					<a href="/member/login">
						<img src="/resources/images/header/img_login.jpg">
					</a>
				</li>
				
				<li class="topmenu02">
					<a href="/member/memberJoin">
						<img src="/resources/images/header/img_join.jpg">
					</a>
				</li>
				
				<li class="topmenu03">
					<a href="#">
						<img src="/resources/images/header/img_mycgv.jpg">
					</a>
				</li>
			</ul>
		</div>
		<!-- topmenu 끝 -->
		<div id="head">
			<!-- logo 시작 -->
			<h1>
				<a href="/"><img src="/resources/images/header/cgvLogo.png"></a>
			</h1>
			<!-- logo 끝 -->
			<h2>
				<img src="/resources/images/header/h2_cultureplex.png">
			</h2>
			<!-- gnb 시작 -->
			<ul class="gnb">
				<li>
					<a href="/movie/movieList">
						<img src="/resources/images/header/img_menu_01.jpg">
					</a>
				</li>
				
				<li>
					<a href="/reserve/ticketSelect">
						<img src="/resources/images/header/img_menu_02.jpg">
					</a>
				</li>
				
				<li>
					<a href="#">
						<img src="/resources/images/header/img_menu_03.jpg">
					</a>
				</li>
				
				<li>
					<a href="/board/boardlist">
						<img src="/resources/images/header/img_menu_04.jpg">
					</a>
				</li>
			</ul>
			<!-- gnb 끝 -->
		</div>
	</div>
	<!-- headerWrap 끝 -->
</div>
