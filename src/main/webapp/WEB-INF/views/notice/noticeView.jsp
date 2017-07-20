<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
	
	.notice-navi{
		margin-top: 30px;
		min-height: 50px;
	}
	
	.notice-navi span, a{
		padding: 7px 0px; 
	}
	
	.notice-navi .notice-prev{
		margin: 10px 0px;
		padding: 7px 0px;
		border-top: 1px solid #e1dfd5;
		border-bottom: 1px solid #e1dfd5;
	}
	
	.notice-navi .prev-text{
		display: inline-block;
		margin-right: 15px;
	}
	
	.notice-navi .prev-title{
		display: inline-block;
	}
	
	.notice-navi .prev-date{
		display: inline-block;
		float: right;
	}
	
	.notice-navi .notice-next{
		margin: 10px 0px;
		padding: 3px 0px 7px 0px;
		border-bottom: 1px solid #e1dfd5;
	}
	
	.notice-navi .next-text{
		display: inline-block;
		margin-right: 15px;
	}
	
	.notice-navi .next-title{
		display: inline-block;
	}
	
	.notice-navi .next-date{
		display: inline-block;
		float: right;
	}

	.notice-footer{
		margin-top: 10px;
	}

</style>
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
		
		<div class="notice-navi">
			<div class="notice-prev">
				<span class="prev-text">
					<i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
					이전글
				</span>
				<c:choose>
					<c:when test="${prevInfo eq null }">
						<span class="prev-title">이전 글이 없습니다.</span>
					</c:when>
					<c:otherwise>
						<a class="prev-title" href="/admin/notice/view?num=${prevInfo.n_num}">${prevInfo.n_title}</a>
						<span class="prev-date">등록일&nbsp;&nbsp; <fmt:formatDate value="${prevInfo.n_regdate}"/></span>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="notice-next">
				<span class="next-text">
					<i class="fa fa-arrow-circle-down" aria-hidden="true"></i>
					다음글
				</span>
				<c:choose>
					<c:when test="${nextInfo eq null }">
						<span class="prev-title">다음 글이 없습니다.</span>
					</c:when>
					<c:otherwise>
						<a class="next-title" href="/admin/notice/view?num=${nextInfo.n_num}">${nextInfo.n_title}</a>
						<span class="next-date">등록일&nbsp;&nbsp; <fmt:formatDate value="${nextInfo.n_regdate}"/></span>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<div class="notice-footer" align="right">
			<button class="my-btn" type="button" onclick="location.href='/notice/list'"><span>목록</span></button>
		</div>
	</div>
