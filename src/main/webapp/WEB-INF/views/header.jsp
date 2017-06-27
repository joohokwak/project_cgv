<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	#headerWrap {
		margin: 0 auto; width: 100%; height: 149px;
	}
	
	a {
		text-decoration: none; color: black; font-weight: bold; font-size: 13px;
	}
	
	li {
		float: left; margin-right: 45px;
	}
	
	li a {
		background-color: rgb(254, 248, 220); font-family: "Noto Sans KR"; font-size: 20px; font-weight: 700; 
	}
	
	#title_img {
		margin: 0 auto; position: relative; top: -139px; left: 33%; background: rgba(255,255,255,0.1);
	}
</style>


<div id="headerWrap">
	<table style="width: 100%; border-spacing: 0;">
		<tr height="30">
			<td align="center">
				<div style="width: 978px;">
					<table style="width: 100%; border-spacing: 0;">
						<tr>
							<td></td>
							<td align="center" width="100px">
								<c:choose>
									<c:when test="${not empty member }">
										<a href="#">로그아웃</a>
									</c:when>
									<c:otherwise>
										<a href="#">로그인</a>
									</c:otherwise>
								</c:choose>
							</td>
							<td width="10px" style="color: gray;">|</td>
							<td align="center" width="100px">
								<a href="memberJoin">회원가입</a>
							</td>
							<td width="10px" style="color: gray;">|</td>
							<td align="center" width="100px">
								<a href="#">My CGV</a>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	
		<tr>
			<td>
				<img alt="headerImg" src="resources/images/header/header.png"style="width: 100%; height: 100%;">
				<a href="/cgv/"><img alt="logo" src="resources/images/header/cgvLogo.png" style="position: relative; top: -100px; left: 20%"></a>
				
				<img id="title_img" alt="title" src="resources/images/header/h2_cultureplex.png">
				
				<div id="gnb" style="width: 350px; position: relative; top: -142px; background: rgba(255,255,255,0.1);">
					<ul style="list-style: none;">
						<li><a href="#">영화</a></li>
						<li><a href="#">예매</a></li>
						<li><a href="#">극장</a></li>
						<li style="margin-right: 0px;"><a href="boardlist">컬쳐</a></li>
					</ul>
				</div>
			</td>
		</tr>
	</table>
</div>
