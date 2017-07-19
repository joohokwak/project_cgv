<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/admin/mybtn.css" />
<style type="text/css">
	
	.notice-wrap{
		position: relative;
		width: 800px;
		margin: 0 auto;
		color: #666666;
		cursor: default;
	}
	
	.notice-header{
		position: relative;
	}
	
	.notice-header h1{
		font-weight: bold;
		font-size: 25px;
		color: black;
	}
	
	.notice-body{
		position: relative;
		width: 800px;
	}
	
	.notice-title{
		position: relative;
		margin-top: 30px;
		padding: 10px;
		background: #edebe1;
		border-top: 1px solid #e1dfd5;
	}
	
	.notice-title span{
		font-size: 13px;
	}
	
	#n_cate{
		font-weight: bold;
		color: black;
		display: inline-block;
		padding-right: 5px;
		float: left;
	}
	
	#n_title{
		font-weight: bold;
		color: black;
		display: inline-block;
		float: left;
	}
	
	#n_regdate{
		display: inline-block;
		padding-right: 30px;
		float: right;
	}
	
	#n_hit{
		display: inline-block;
		float: right;
	}
	
	.notice-content{
		position: relative;
		padding: 35px 13px;
		border-bottom: 1px solid #e1dfd5;
		min-height: 316px;
	}
	
	.notice-footer{
		margin-top: 10px;
	}
	
	
	
	
	
	
	
	

</style>
</head>
<body>
<div class="notice-wrap">
	<div class="notice-header">
		<h1>공지사항</h1>
		<p>공지사항을 관리하는 페이지 입니다.</p>
	</div>
	
	<div class="notice-body">
		<div class="notice-title">
			<span id="n_cate">[${notice.n_cate}]</span>		
			<span id="n_title">${notice.n_title}</span>
			<span id="n_hit">조회수 <span style="color: black;">${notice.n_hit}</span></span>
			<span id="n_regdate">등록일 <span style="color: black;"><fmt:formatDate value="${notice.n_regdate}"/></span></span>
			<div style="clear: both;"></div>
		</div>
		
		<div class="notice-content">
			${notice.n_content}
		</div>
		<div class="notice-footer" align="right">
			<button class="my-btn" type="button" onclick="location.href='/admin/notice/update?num=${notice.n_num}'"><span>수정/삭제</span></button>
			<button class="my-btn" type="button" onclick="location.href='/admin/notice/list'"><span>목록</span></button>
		</div>
	</div>
	
	
	
	
</div>
</body>
</html>