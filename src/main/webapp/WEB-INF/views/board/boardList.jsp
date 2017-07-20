<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/event/eventPage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.css">
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">

<script type="text/javascript">

	if("${msg}" != ""){
		
		//alert("${msg}");	
		$.alert({
			title: '수행결과',
		    content: '<font color="#333"><b>${msg}</b></font>',
		    boxWidth: '400px',
		    useBootstrap: false,
		    icon: 'icon-check',
		    type: 'red'
		});
	}
	
	$(function() {
		$("#writeBtn").click(function(e) {
			$.ajax({
				url : "/member/loginCheck",
				type : "post",
				dataType : "text",
				success : function(data) {
					if (data == "login") {
						location.href = '/board/boardwrite';
					} else if (data == "unlogin") {
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
													location.href = '/board/boardwrite';
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
	<!-- boardListWrap 시작 -->
	<div id="boardListWrap">
		<div class="list_title">
			<h2 class="sub_title">이벤트&컬쳐</h2>
			<p>CGV의 이벤트와 각종 문화소식을 확인할 수 있는 게시판입니다.</p>			
		</div>	
		<!-- blist 시작 -->
		<table class="blist">
			<!-- search 시작 -->
			<div class="search">
				<form action="boardlist" class="select_form">
					<select name="type" class="s_select" style="width:100px;">
						<option value="1">제목</option>
						<option value="2">내용</option>
						<option value="3">제목+내용</option>
						<option value="4">작성자</option>
					</select>
					<input type="text" name="keyword" class="s_input" style="width:185px;">
					<input type="submit" value="검색하기" class="btn_search">
				</form>	
			</div>
			<!-- search 끝 -->	
			<colgroup>
				<col style="width: 70px;"/>
				<col style="width: 100px;"/>
				<col style="width: 620px;"/>
				<col style="width: 100px;"/>
				<col style="width: 80px;"/>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th scope="col">작성자</th>
					<th scope="col" class="txt" >제목</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${viewData.board}">
					<tr>
						<td>${list.b_num}</td>
						<td>[&nbsp;${list.b_writer}&nbsp;]</td>					
						<td class="txt"><a href="/board/boardview?num=${list.b_num}">${list.b_title}</a></td>
						<td><fmt:formatDate value="${list.b_regdate}" type="date" /></td>
						<td>${list.b_hit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- table 끝 -->
		<!-- paging 시작 -->
		<div class="paging">
			<ul>
			<c:if test="${viewData.current != 1}">
				<!-- 첫페이지 -->
				<div class="btn_frist">
					<a href="/board/boardlist?page=1
								<c:if test="${param.type != null}">&type=${param.type}</c:if>
								<c:if test="${param.keyword != null}">&keyword=${param.keyword}</c:if>
								">
						<img src="/resources/images/event/btn_paging_first.jpg" alt="첫페이지">
					</a>
				</div>
				<!-- 이전페이지 -->
				<div class="btn_prev">
					<a href="/board/boardlist?page=${viewData.current-1}
								<c:if test="${param.type != null}">&type=${param.type}</c:if>
								<c:if test="${param.keyword != null}">&keyword=${param.keyword}</c:if>
								"><img
						src="/resources/images/event/btn_paging_prev.jpg" alt="이전페이지">
					</a>
				</div>
			</c:if>
			<!-- page numbering 시작 -->
			
				<c:forEach var="i" begin="${viewData.start}"
					end="${viewData.end < viewData.last ? viewData.end : viewData.last}">
					<c:choose>
						<c:when test="${i == viewData.current}">
							<li><b>${i}</b></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="/board/boardlist?page=${i}
										<c:if test = "${param.type != null}">&type=${param.type}</c:if>
										<c:if test = "${param.keyword != null}">&keyword=${param.keyword}</c:if>
									">${i}</a></li>

						</c:otherwise>
					</c:choose>
				</c:forEach>
			
			<!-- page numbering 끝 -->
			<c:if test="${viewData.current != viewData.last}">
				<div class="btn_next">
					<a href="/board/boardlist?page=${viewData.current+1}
								<c:if test = "${param.type != null}">&type=${param.type}</c:if>
								<c:if test = "${param.keyword != null}">&keyword=${param.keyword}</c:if>						
					"><img src="/resources/images/event/btn_paging_next.jpg" alt="다음페이지"></a>
				</div>
				<div class="btn_end">
					<a href="/board/boardlist?page=${viewData.last}
								<c:if test = "${param.type != null}">&type=${param.type}</c:if>
								<c:if test = "${param.keyword != null}">&keyword=${param.keyword}</c:if>						
					"><img src="/resources/images/event/btn_paging_end.jpg" alt="마지막페이지"></a>
				</div>
			</c:if>
			</ul>
		</div>			
		<!-- paging 끝 -->
		<!-- 글쓰기버튼 -->
		<input type="button" id="writeBtn" value="글쓰기" class="btn_write">
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