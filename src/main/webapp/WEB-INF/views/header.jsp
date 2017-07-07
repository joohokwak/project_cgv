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
					<c:choose>
						<c:when test="${not empty member }">
							<a href="/member/logout">
								<img src="/resources/images/header/img_logout.jpg">
							</a>
						</c:when>
					
						<c:otherwise>
							<a href="/member/login">
								<img src="/resources/images/header/img_login.jpg">
							</a>
						</c:otherwise>
					</c:choose>
				</li>
				
				<c:choose>
					<c:when test="${empty member }">
						<li class="topmenu02">
							<a href="/member/memberJoin">
								<img src="/resources/images/header/img_join.jpg">
							</a>
						</li>
					</c:when>
					
					<c:otherwise>
						<li class="topmenu03">
							<c:choose>
								<c:when test="${member.id == 'admin' }">
									<a href="/admin/main">
										<img src="/resources/images/header/img_mycgv.jpg">
									</a>
								</c:when>
								<c:otherwise>
									<a href="/member/mycgv">
										<img src="/resources/images/header/img_mycgv.jpg">
									</a>
								</c:otherwise>
							</c:choose>
						
						</li>
					</c:otherwise>
				</c:choose>
				
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
					<a href="/reserve/reserveHome">
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
