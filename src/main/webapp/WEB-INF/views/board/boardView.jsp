<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>

	<style type="text/css">
		#boardListWrap { position:relative; margin: 0 auto; width: 100%; margin-top: 70px;  }
		#boardWrite {  width:980px; margin:0 auto; }
		table,td { width:980px; margin:0 auto; }
		.blist { padding-top:40px; }
		textarea { width:100%; }	

	</style>

</head>
<body>
	<div id="boardListWrap">
		<!-- boardWrite 시작 -->
		<div id="boardWrite">
		<table class="boardView">
			<!-- Form 시작 -->
			<form method="post" action="boardview" enctype="multipart/form-data">
				<table>
					<tr>
						<th style="width:100px;">작성자</th>
						<td>${viewBoard.b_writer}</td>
					</tr>
					<tr>
						<th style="width:100px;">조회수</th>
						<td>${viewBoard.b_hit}</td>
					</tr>					
					<tr>
						<th style="width:100px;">제목</th>
						<td>${viewBoard.b_title}</td>
					</tr>			
					<tr>
						<th style="width:100px;">내용</th>
						<td>${viewBoard.b_content}</td>
					</tr>				
				
				</table>
				<c:if test="${mine eq true}">
					<input type="button" value="수정하기" onclick="location.href='boardupdate?num=${viewBoard.b_num}'">
					<input type="button" value="삭제하기" onclick="location.href='delete?num=${viewBoard.b_num}'">
				</c:if>
				<input type="button" value="목록으로" onclick="location.href='boardlist'">				
			</form>		
			<!-- Form 끝 -->	
		</table>
<!-- 		<div id="mreply">
			<div class="mreply_title"></div>
			<div>
				<input type="text" class="mreply_text">
			</div>
			<div>
				<button type="button" id="btn_rUpdate">수정</button>
				<button type="button" id="btn_rDelete">삭제</button>
				<button type="button" id="btn_rClose">닫기</button>
			</div>			
		</div> -->
		<form name="replyForm" id="replyForm">댓글달기
			<br><br>
			<table>
				<tr>
					<th style="width:100px;">작성자</th>
					<td>${viewBoard.b_writer}</td>			
				</tr>
				<tr>
					<th style="width:100px;">글쓰기</th>
					<td><input type="text" name="replytext" id="replytext"/></td>	
				</tr>
				<tr>
					
				</tr>
			</table>
		</form>
		<!-- replies에다가 댓글 목록을 출력 -->
		<ul id="replies">
		</ul>
		<br><br> 
		</div>
		<!-- boardWrite 끝 -->
	</div>
</body>
</html>