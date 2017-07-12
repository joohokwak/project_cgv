<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link rel="stylesheet" href="/resources/css/event/eventPage.css?ver=1">
	<style type="text/css">
		#boardListWrap { position:relative; margin: 0 auto; width: 100%; margin-top: 70px;  }
		table,td { width:980px; margin:0 auto; text-align: center; }
		.search { width:500px; position:absolute; left:50%; margin-left:170px; top:0; }
		.blist { padding-top:40px; }
	</style>
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
			<a href="/board/boardwrite"><input type="button" value="글쓰기"></a>
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
</body>
</html>