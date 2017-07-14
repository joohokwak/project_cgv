<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="v" value="${viewData}"></c:set>
<style type="text/css">

	.actor-wrap{
		position: relative;
		width: 900px;
		color: #666666;
	}
	
	.actor-header{
		position: relative;
		left: 30px; 
	}
	
	.actor-header h1{
		font-weight: bold;
		font-size: 25px;
		color: black;
	}
	
	.actor-body{
		position: relative;
		left: 30px; 
		width: 800px;
	}
	
	.actor-table{
		position: relative;
		top: 50px;
		width: 500px;
		border-collapse: collapse;
	}
	
	.actor-table th{
		border-top: 1px solid #e1dfd5;
		border-bottom: 1px solid #e1dfd5;
		background-color: #edebe1;
		height: 37px;
		cursor: default;
		text-align: center;
	}
	
	.actor-row:HOVER{
		background-color: #eae8e1;
	}
	
	.actor-row td{
		height: 46px;
		text-align: center;
		cursor: default;
	}
	
	.actor-row td a{
		width: 100%;
		padding: 10px 0px;
		display: inline-block;
		text-decoration: none;
	}
	
	.actor-pagenation{
		display: inline-block;
	}
	
	.actor-pagenation a, b{
	    float: left;
	    padding: 8px 16px;
	    text-decoration: none;
	}
	
	.actor-pagenation b{
		cursor: default;
	}
	
	.actor-pagenation a:HOVER{
		background-color: #ea1400;
		transition: background-color .7s;
		color: white;
	}
	
	.actor-pagenation b{
		background-color: #ea1400;
		color: white;
	}
	
	.my-btn{
      width: 73px;
      height: 26px;
      background: url("/resources/images/btn_bg.gif") no-repeat;
      color:#fff;
      border: 0;
      cursor: pointer;
   }
   
   .my-btn span{
      text-align: center;
      line-height: 8px;
      font-size: 12px; 
      font-weight: bold;
         
   }
   
   .my-btn:HOVER{
   	opacity: 0.9;
   }

</style>
<div class="actor-wrap">
	<div class="actor-header">
		<h1>배우 관리</h1>
		<p>배우의 정보를 관리하는 페이지 입니다.</p>
	</div>
	<div class="actor-body">
		<table class="actor-table">
			<tr>
				<th>번호</th>
				<th>이름</th>
			</tr>
			<c:forEach var="list" items="${v.aList}">
				<tr class="actor-row">
					<td>${list.a_num}</td>
					<td style="text-align: left">${list.a_kor_name}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="2" style="text-align: center">
				<div class="actor-pagenation">
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

