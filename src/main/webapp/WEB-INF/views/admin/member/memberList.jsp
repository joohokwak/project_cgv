<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="v" value="${viewData}"></c:set>
<link rel="stylesheet" href="/resources/css/admin/mybtn.css">
<style type="text/css">

	.member-wrap{
		position: relative;
		width: 900px;
		margin: 0 auto;
		color: #666666;
		cursor: default;
	}
	
	.member-header{
		position: relative;
	}
	
	.member-header h1{
		font-weight: bold;
		font-size: 25px;
		color: black;
	}
	
	.member-header p{
		margin: 2px 0px;
	}
	
	.member-body{
		position: relative;
		width: 800px;
	}
	
	.member-table{
		position: relative;
		top: 20px;
		width: 500px;
		border-collapse: collapse;
	}
	
	.member-table th{
		border-top: 1px solid #e1dfd5;
		border-bottom: 1px solid #e1dfd5;
		background-color: #edebe1;
		height: 37px;
		cursor: default;
		text-align: center;
	}
	
	.member-row:HOVER{
		background-color: #eae8e1;
	}
	
	.member-row td{
		height: 46px;
		text-align: center;
		cursor: default;
	}
	
	.member-row td a{
		width: 100%;
		padding: 10px 0px;
		display: inline-block;
		text-decoration: none;
		cursor: pointer;
	}
	
	.member-pagenation{
		display: inline-block;
	}
	
	.member-pagenation a, b{
	    float: left;
	    padding: 8px 13px;
	    text-decoration: none;
	    border-radius: 50px;
	}
	
	.member-pagenation b{
		cursor: default;
	}
	
	.member-pagenation a:HOVER{
		background-color: #ea1400;
		transition: background-color .7s;
		color: white;
	}
	
	.member-pagenation b{
		background-color: #ea1400;
		color: white;
	}
</style>
<script type="text/javascript">
$(function(){
	$("#member_menu").css({
		background : "#343132",
		color: "#fff"		
	});
	
	$(".update_btn").click(function() {
		var m_id = $(this).attr("data-id");
		window.open("/admin/member/memberUpdatePop?id="+m_id, "새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=no" );  
	});
	
});
</script>
<div class="member-wrap">
	<div class="member-header">
		<h1>회원 관리</h1>
		<p>회원의 정보를 관리하는 페이지 입니다.</p>
	</div>
	<div class="member-body">
		<table class="member-table">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="list" items="${v.mList}">
				<c:if test="${list.id != 'admin' }">
					<tr class="member-row">
						<td>${list.id}</td>
						<td><a href="/admin/member/mycgv?id=${list.id}">${list.name}</a></td>
						<td>
							<button type="button" class="update_btn" data-id="${list.id }">수정</button>
						</td>
						<td>
							<button type="button" onclick="location.href='/admin/member/delete?id=${list.id}'">삭제</button>
						</td>	
					</tr>
				</c:if>
			</c:forEach>
			<tr>
				<td colspan="4" align="right">
					<button class="my-btn" onclick="location.href='/admin/member/memberJoin'"><span>회원가입</span></button>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center" >
				<div class="member-pagenation">
					<c:if test="${v.start != 1 }">
						<a href="list?page=1">처음</a>
						<a href="list?page=${viewData.start-1 }">이전</a>
					</c:if>
					
					<c:forEach begin="${v.start}" end="${v.end<v.last ? v.end:v.last }" var="i">
						<c:choose>
							<c:when test="${i==v.current }">
								<b>${i}</b>
							</c:when>
							<c:otherwise>
								<a href="list?page=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach> 
					
					<c:if test="${v.end < v.last }">
						<a href="list?page=${v.end+1}">다음</a>	
						<a href="list?page=${v.last}">마지막</a>					
					</c:if>
				</div>
				</td>
			</tr>
		</table>
	</div>
</div>

