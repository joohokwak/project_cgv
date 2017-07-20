<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<link href="/resources/css/admin/admin_side.css" rel="stylesheet" type="text/css"/>

<div id="sidemenu">
<ul>
	<li><a href="/admin/main" id="home_menu">관리자 홈으로</a></li>	
	<li><a href="#" id="member_menu">회원 관리</a></li>
	<li><a href="#" id="board">게시판 관리</a></li>
	<li><a href="/admin/notice/list" id="notice_menu">공지사항 관리</a></li>
	<li><a href="/admin/movie/list" id="movie_menu">영화 관리</a></li>
	<li><a href="/admin/actor/list" id="actor_menu">배우 관리</a></li>
	<li><a href="/admin/photo/uploadForm" id="photo_menu">사진 업로드</a></li>
	<li><a href="/admin/movie/time" id="time_menu">상영시간 관리</a></li>
	<li><a href="/admin/salesManagement" id="sales_menu">매출 관리</a></li>
</ul>
</div>
