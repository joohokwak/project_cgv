<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.js"></script>
	<link rel="stylesheet" href="/resources/css/event/eventPage.css?ver=1">
	<style type="text/css">
		#boardListWrap { position:relative; margin: 0 auto; width: 100%; margin-top: 70px;  }
		table,td { width:980px; margin:0 auto; text-align: center; }
		.search { width:500px; position:absolute; left:50%; margin-left:170px; top:0; }
		.blist { padding-top:40px; }
		#loginDiv {
 			display: none;
			position: absolute;
			width: 462px;
			height: 324px;
			border: 5px solid #333;
			top: 200px;
			left: 35%;
			z-index: 20000;
		}
		
		#login_hd {
			width: 462px;
			height: 51px;
			background: #333;
			border-bottom: 5px solid #333;
		}
		
		#login_title {
			width: 440px;
			height: 35px;
			color: #f2f0e5;
		    padding-top: 14px;
		    padding-left: 20px;
			font-family: Nanum Gothic, 나눔고딕, Apple SD Gothic Neo, AppleGothic, 돋움, dotum, Sans-serif;
		    font-size: 22px;
		    font-weight: bold;
		    line-height: 22px;
		    letter-spacing: -1px;
			border: 1px solid gray;
		}
		
		#btn_close_x {
		    display: block;
		    position: relative;
		    float: right;
		    top: -34px;
		    right: 20px;
		    width: 18px;
		    height: 18px;
		    background: url(/resources/images/reserve/btn_close_x.png) no-repeat;
		    overflow: hidden;
		    cursor: pointer;
		    text-indent: -1000px;
		}
		
		#login_bd {
			width: 312px;
			height: 228px;
		    padding-bottom: 40px;
		    padding-left: 75px;
		    padding-right: 75px;
		    background: #f6f6f4;
		}
		
		#login_bd_form {
			width: 266px;
			height: 133px;
			margin: 0 auto;
			position: relative;
			padding-top: 50px;
		}
		
		#login_wrap_id {
		    width: 212px;
		    border: 2px solid #b5b5b5;
		    margin-bottom: 5px;
		    padding: 8px 10px 8px 40px;
		    background: url("/resources/images/reserve/login_icon_id.png") no-repeat left center;
		}
		
		#login_wrap_id input[type='text'] {
			width: 212px;
			height: 21px;
			border: none;
			background: #f6f6f4;
		}
		
		#login_wrap_pw {
			width: 212px;
		    border: 2px solid #b5b5b5 !important;
		    padding-bottom: 7px;
		    margin-bottom: 5px;
		    padding: 8px 10px 8px 40px;
		    background: url("/resources/images/reserve/login_icon_pw.png") no-repeat left center;
		}
		
		#login_wrap_pw input[type='password'] {
			width: 212px;
			height: 21px;
			border: none;
			background: #f6f6f4;
		}
		
		#login_wrap_btn {
			width: 262px;
			height: 42px;
		    background: #e71a0f;
		    padding: 2px;
		}
		
		#login_bd_btn {
			width: 262px;
		    background: #e71a0f;
		    color: #f2f0e5;
		    height: 42px;
		    line-height: 37px;
		    font-size: 15px;
		    font-weight: bold;
		    font-family: 'NanumBarunGothicBold', 'Nanum Gothic', 'Dotum';
		    border: 1px solid white;
		    cursor: pointer;
		}
	</style>
	
	<script type="text/javascript">
		$(function() {
			$("#writeBtn").click(function(e) {
				$.ajax({
					url: "/member/loginCheck",
					type: "post",
					dataType: "text",
					success: function(data) {
						if(data == "login") {
							location.href='/board/boardwrite';
						}else if(data == "unlogin") {
							$("html, body").stop().animate({scrollTop : '0px'});
							$("#loginDiv").css({display: "block"});
							$("#boardListWrap").prop('disabled', true).css({"pointer-events": "none", opacity: "0.5"});
							$("#eventPageWrap").prop('disabled', true).css({"pointer-events": "none", opacity: "0.5"});
						}
					}
				});
			});
			
			
			// 로그인창 닫기 버튼
			$("#btn_close_x").click(function(e) {
				$("#loginDiv").css({display: "none"});
				$("#boardListWrap").prop('disabled', false).css({"pointer-events": "auto", opacity: "1"});
				$("#eventPageWrap").prop('disabled', false).css({"pointer-events": "auto", opacity: "1"});
			});
			
			// 비밀번호창에서 엔터키 적용
			$("#loginDivPw").keyup(function(e) {
				if(e.keyCode == 13) {
					$("#login_bd_btn").click();
				}
			});
			
			// 로그인 버튼 클릭
			$("#login_bd_btn").click(function(e) {
				var divId = $.trim($("#loginDivId").val());
				var divPw = $.trim($("#loginDivPw").val());
				
				if(divId.length > 0 && divPw.length >0) {
					$.ajax({
						url : "/member/reserveLogin",
						type : "post",
						data : {"id": divId, "pass":divPw},
						dataType : "json",
						success: function(data) {
							if(data.result == 'success') {
								location.href='/board/boardwrite';
							}else {
								$.alert({
									title: '',
								    content: '<font color="#333"><b>아이디 또는 비밀번호를 확인하세요</b></font>',
								    boxWidth: '300px',
								    useBootstrap: false,
								    type: 'red'
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
	<!-- boardListWrap 시작 -->
	<div id="boardListWrap">
		<!-- blist 시작 -->
		<table class="blist">
			<!-- search 시작 -->
			<div class="search">
				<form action="boardlist">
					<select name="type">
					<option value="1">제목</option>
					<option value="2">내용</option>
					<option value="3">제목+내용</option>
					<option value="4">작성자</option>
					</select>
					<input type="text" name="keyword">
					<input type="submit" value="검색">
				</form>	
			</div>
			<!-- search 끝 -->	
			<tr>
				<td colspan="5"></td>
			</tr>
			<tr>
				<th width="5%">번호</th>
				<th width="60%">제목</th>
				<th width="20%">작성자</th>
				<th width="10%">작성일</th>
				<th width="5%">조회수</th>
			</tr>
			
			<c:forEach var="list" items="${viewData.board}">
				<tr>
					<td>${list.b_num}</td>
					<td><a href="/board/boardview?num=${list.b_num}">${list.b_title}</a></td>
					<td>${list.b_writer}</td>
					<td><fmt:formatDate value="${list.b_regdate}" type="date" /></td>
					<td>${list.b_hit}</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="5" align="center">	
					<c:if test="${viewData.current != 1}">
						<!-- 첫페이지 -->
						<a href="/board/boardlist?page=1
							<c:if test="${type != null}">&type=${type}</c:if>
							<c:if test="${keyword != null}">&keyword=${keyword}</c:if>
							">[처음]
						</a>
						<!-- 이전페이지 -->
						<a href="/board/boardlist?page=${viewData.current-1}
							<c:if test="${type != null}">&type=${type}</c:if>
							<c:if test="${keyword != null}">&keyword=${keyword}</c:if>
							">[이전]
						</a>
					</c:if>
					<!-- page numbering 링크x-->
					<c:forEach var="i" begin="${viewData.start}" end="${viewData.end < viewData.last ? viewData.end : viewData.last}">
						<c:choose>
							<c:when test="${i == viewData.current}">
								<b>[${i}]</b>
							</c:when>
							<c:otherwise>
								<a href="/board/boardlist?page=${i}
									<c:if test = "${type != null}">&type=${type}</c:if>
									<c:if test = "${keyword != null}">&keyword=${keyword}</c:if>
								">[${i}]
								</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${viewData.current != viewData.last}">
						<a href="/board/boardlist?page=${viewData.current+1}
							<c:if test = "${type != null}">&type=${type}</c:if>
							<c:if test = "${keyword != null}">&keyword=${keyword}</c:if>						
						">[다음]</a>
						<a href="/board/boardlist?page=${viewData.last}
							<c:if test = "${type != null}">&type=${type}</c:if>
							<c:if test = "${keyword != null}">&keyword=${keyword}</c:if>						
						">[마지막]</a>					
					</c:if>
				</td>
			</tr>
			
			<input type="button" id="writeBtn" value="글쓰기" >
		</table>
		<!-- table 끝 -->
	</div>
	<!-- boardListWrap 끝 -->
	
	
	<!-- 이벤트 -->
	<div id="eventPageWrap">
		<div class="sect-event">
			<div class="box-event">
				<div class="evt-item-lst" style="min-height: 856px;">
					<div style="position: absolute; top: 45px; left: 557px;">
						<a id="tile_2" href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16432&menu=0" target="">
							<img src="http://img.cgv.co.kr/Event/Event/2017/0711/149_list_2.jpg" alt="NH농협 SolSol++카드만의 쏠쏠한 혜택!" style="height: 200px;">
						</a>
					</div>
					
					<div style="position: absolute; top: 140px; left: 289px;">
						<a id="tile_1" href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16433&menu=0" target="">
							<img src="http://img.cgv.co.kr/Event/Event/2017/0711/14997498145680.jpg" alt="제49회 라이브톡" style="height: 200px;">
						</a>
					</div>
					
					<div style="position: absolute; top: 180px; left: 17px;">
						<a id="tile_0" href="http://section.cgv.co.kr/event/running/EventZone.aspx?idx=793" target="">
							<img src="http://img.cgv.co.kr/Event/Event/2017/0711/(240X200)CGV_web_banner.jpg" alt="스타★ 라이브톡" style="height: 200px;">
						</a>
					</div>
					
					<div style="position: absolute; top: 265px; left: 557px;">
						<a id="tile_5" href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16427&menu=0" target="">
							<img src="http://img.cgv.co.kr/Event/Event/2017/0711/240x200.jpg" alt="CJ ONE 회원만을 위한 특별 시사회" style="height: 200px;">
						</a>
					</div>
					
					<div style="position: absolute; top: 360px; left: 289px;">
						<a id="tile_4" href="http://section.cgv.co.kr/event/running/EventZone.aspx?idx=791" target="">
							<img src="http://img.cgv.co.kr/Event/Event/2017/0711/dkrk_240X200.jpg" alt="IMAX  한정판 포스터 증정 이벤트" style="height: 200px;">
						</a>
					</div>
					
					<div style="position: absolute; top: 400px; left: 17px;">
						<a id="tile_3" href="http://section.cgv.co.kr/event/running/EventZone.aspx?idx=792" target="">
							<img src="http://img.cgv.co.kr/Event/Event/2017/0711/ml_240x200.jpg" alt="배경화면 인증 콘테스트" style="height: 200px;">
						</a>
					</div>
					
					<div style="position: absolute; top: 485px; left: 557px;">
						<a id="tile_8" href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16423&menu=0" target="">
							<img src="http://img.cgv.co.kr/Event/Event/2017/0710/car3_240x200.jpg" alt="예매 경품 이벤트" style="height: 200px;">
						</a>
					</div>
					
					<div style="position: absolute; top: 580px; left: 289px;">
						<a id="tile_7" href="http://section.cgv.co.kr/event/running/EventZone.aspx?idx=790" target="">
							<img src="http://img.cgv.co.kr/Event/Event/2017/0711/1318preview_wlist.jpg" alt="1318클럽 시사회" style="height: 200px;">
						</a>
					</div>
					
					<div style="position: absolute; top: 620px; left: 17px;">
						<a id="tile_6" href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16426&menu=0" target="">
							<img src="http://img.cgv.co.kr/Event/Event/2017/0711/last_wlist.jpg" alt="라스트 찬스 기획전" style="height: 200px;">
						</a>
					</div>
				</div>
			</div>
		</div>
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