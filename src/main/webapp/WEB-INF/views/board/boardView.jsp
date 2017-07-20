<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/event/eventPage.css">
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script type="text/javascript">
function getAllList(){
	
	var member_id = "${member.id}";
	
	$.ajax({
		
		url:"/board/replies/all/"+$("#b_num").val(),
		type:"GET",
		dataType:"json",
		success : function(data){
		
			var str = "";
			$(data).each(function(i,e){
				
				if(e.br_id == member_id || member_id == 'admin') {
					str += "<li data-rno='"+e.br_num+" 'class='replyLi'>"+e.br_writer+"&nbsp;&nbsp;"+e.br_regdate+"&nbsp;&nbsp;<input type='button' class='btn_replyLi'/><br/><br/>"+e.br_content+"</li>";
				}else {
					str += "<li data-rno='"+e.br_num+" 'class='replyLi'>"+e.br_writer+"&nbsp;&nbsp;"+e.br_regdate+"&nbsp;&nbsp;<br/><br/>"+e.br_content+"</li>";
				}
			});
			
			$("#replies").html(str);
		},
		
		error:function(request,status,error){
			alert("code : "+request.status+"\n"+"error : "+error);
			
		}
	});
}


$(function(){
	getAllList(); 
	
	$("#replyForm").on("submit",function(){
		
		var num =  $("#b_num").val();
		var replyer = $("#br_writer").val();
		var replytext = $("#br_content").val();	
		var rno = $("#br_num").val();	
		
		$.ajax({
			url : "/board/replies",
			type : "POST",
			data : {
				b_num : num,
				br_writer : replyer,
				br_content : replytext
			},
			datatype : "text",
			success : function(reuslt){
				if(reuslt == 'SUCCESS'){
					alert("댓글이 등록되었습니다");
					getAllList();
				}
			},
			error : function(result,status,error){
				alert("댓글이 등록되지 않았습니다");
			}
			
		});
		return false;
	});
	
	
	
	$("#replies").on("click",".btn_replyLi",function(){
		
		$.ajax({
			type : "delete",
			url : "/board/replies/"+$(this).parent().attr("data-rno"),
			dataType : "text",
			success : function(result){
				if(result == "SUCCESS"){
					alert("삭제되었습니다");
					location.reload();
				}
			},
			error : function(){
				alert("삭제되지 않았습니다");
			}	
		});
	});
	
	
	
});
</script>
<script type="text/javascript">
	$(function() {
		
		$("#br_content").click(function(e) {
			$.ajax({
				url : "/member/loginCheck",
				type : "post",
				dataType : "text",
				success : function(data) {
					if (data == "unlogin") {
						$("html, body").stop().animate({
							scrollTop : '0px'
						});
						$("#loginDiv").css({
							display : "block"
						});
						$("#boardListWrap").prop('disabled', true).css({
							"pointer-events" : "none",
							opacity : "0.5"
						});
						$("#eventPageWrap").prop('disabled', true).css({
							"pointer-events" : "none",
							opacity : "0.5"
						});
					}
				}
			});
		});

		// 로그인창 닫기 버튼
		$("#btn_close_x").click(function(e) {
			$("#loginDiv").css({
				display : "none"
			});
			$("#boardListWrap").prop('disabled', false).css({
				"pointer-events" : "auto",
				opacity : "1"
			});
			$("#eventPageWrap").prop('disabled', false).css({
				"pointer-events" : "auto",
				opacity : "1"
			});
		});

		// 비밀번호창에서 엔터키 적용
		$("#loginDivPw").keyup(function(e) {
			if (e.keyCode == 13) {
				$("#login_bd_btn").click();
			}
		});

		// 로그인 버튼 클릭
		$("#login_bd_btn")
				.click(
						function(e) {
							var divId = $.trim($("#loginDivId").val());
							var divPw = $.trim($("#loginDivPw").val());

							if (divId.length > 0 && divPw.length > 0) {
								$
										.ajax({
											url : "/member/reserveLogin",
											type : "post",
											data : {
												"id" : divId,
												"pass" : divPw
											},
											dataType : "json",
											success : function(data) {
												if (data.result == 'success') {
													location.reload();
												} else {
													$
															.alert({
																title : '',
																content : '<font color="#333"><b>아이디 또는 비밀번호를 확인하세요</b></font>',
																boxWidth : '300px',
																useBootstrap : false,
																type : 'red'
															});
												}
											}
										});
							}
						});
	});
</script>

</head>
<body>
	<div id="boardWriteWrap">
		<div class="list_title">
			<h2 class="sub_title">이벤트&컬쳐</h2>
			<p>CGV의 이벤트와 각종 문화소식을 확인할 수 있는 게시판입니다.</p>			
		</div>		
		<div class="write_table">
			<!-- Form 시작 -->			
			<form method="post" action="boardview" enctype="multipart/form-data">
				<ul class="tableview_info">
					<li class="tableview_title">${viewBoard.b_title}</li>
					<li class="tableview_date">
						<span class="tableview_date01">등록일<em class="regist_day">
							<fmt:formatDate value="${viewBoard.b_regdate}" pattern="yyyy-MM-dd"/>
						</em></span>
						<span class="tableview_date02">조회수 <em class="title_check">${viewBoard.b_hit}</em></span>
					</li>
				</ul>
				<div class="boardview_content">${viewBoard.b_content}</div>

				<c:if test="${mine eq true}">
					<input type="button" value="수정하기" class="btn_vupdate" onclick="location.href='boardupdate?num=${viewBoard.b_num}'" >
					<input type="button" value="삭제하기" class="btn_vdelete" onclick="location.href='delete?num=${viewBoard.b_num}'" >
				</c:if>	
				
				<input type="button" value="목록으로" 	onclick="location.href='boardlist'" class="btn_vlist">				
			</form>			
			<!-- Form 끝 -->

		</div>
		<!-- boardWrite 끝 -->
			<!-- 댓글쓰기 -->
			<form name="replyForm" id="replyForm">
				<div class="icon_reply">총 ${countReply}개의 댓글이 있습니다.</div>
				<input type= "hidden" name ="b_num" id="b_num" value = "${viewBoard.b_num}"/>
				<input type= "hidden" name ="br_id" id="id" value = "${member.id}"/>
				<input type="hidden" name="br_writer" id="br_writer" value="${member.name}"/>
				<input type="text" name="br_content" id="br_content" style="width:868px; height:58px; float:left;"/>
				<input type="submit" value="등록" class="btn_reply">
			</form>
			
			<!-- replies에다가 댓글 목록을 출력 -->
			<ul id="replies">
				
			</ul>		
	</div>	
	
	<!-- login -->
	<div id="loginDiv">
		<div id="login_hd">
			<div id="login_title">CGV 회원 로그인</div>
			<a id="btn_close_x">닫기</a>
		</div>
		
		<div id="login_bd">
			<div id="login_bd_form">
				<div id="login_wrap_id">
					<input type="text" id="loginDivId" tabindex="1">
				</div>
				
				<div id="login_wrap_pw">
					<input type="password" id="loginDivPw" tabindex="2">
				</div>
				
				<div id="login_wrap_btn">
					<button id="login_bd_btn" tabindex="3">로그인</button>
				</div>
			</div>
		</div>
	</div>	
	
	
</body>
</html>