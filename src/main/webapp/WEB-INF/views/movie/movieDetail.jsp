<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/css/movie/movieDetail.css">
	<link href="/resources/css/movie/fotorama.css" rel="stylesheet">
	<script src="/resources/js/fotorama.js"></script>
	<script src="/resources/js/jquery.rateyo.js"></script>
	<link rel="stylesheet" href="/resources/css/jquery.rateyo.css">
	<script type="text/javascript" src="/resources/js/movie/movieDetail.js"></script>
	<script type="text/javascript">
		$(function() {
			var reCheck = "${reCheck}";
			
			if(Number(reCheck) == 1) {
				pageScroll();
			}
		});
	</script>
</head>
<body>
	<div id="movieDetailWrap">
		<hr style="width: 930px; background-color: black; height: 3px; margin-left: 0px; margin-bottom: 30px;">
	
		<div id="detailPoster">
			<img alt="" src="/resources/images/movie/poster/${m_poster }" width="185px" height="260px">
		</div>
		
		<div id="detailContents">
			<div id="detailTitle">
				<strong>${m_title1 }</strong>
				<img alt="playingImg" src="/resources/images/movie/playing.png">
				<div>${m_title2 }</div>
			</div>
			
			<div id="detailSpec">
				감독: ${m_producer }<br>
				배우: <br>
				장르: ${m_genre }<br>
				개봉: ${m_start }<br>
				공식사이트: <a href="http://${m_site }" target="_blank">${m_site }</a>
			</div>
			
			<div id="detailLike">
				<img id="like" alt="" src="/resources/images/movie/heart_black.png">
				<input type="hidden" id="like_num" value="${m_num }">
				<a href="/reserve/reserveHome?m_num=${m_num }">
					<img id="reserve_btn" alt="reserve_btn" src="/resources/images/movie/reserve_btn.png">
				</a>
				<div id="like_point">${m_like }</div>
			</div>
		</div>
		
		<div id="detail_select">
			<img alt="detail_select" src="/resources/images/movie/detail_select.png">
		</div>
		
		<div id="movieStroy">
			${m_content }
		</div>
		
		<div id="trailer">
			<div class="heading">
				<h4>트레일러</h4>
			</div>
			
			<table>
				<tr>
					<c:forEach var="trailer" items="${trailerList }">
						<td><iframe width="260" height="160" src="${trailer.v_addr }" frameborder="0" allowfullscreen></iframe></td>
					</c:forEach>
				</tr>
			</table>
		</div>
		
		<div id="stealCut">
			<div class="heading">
				<h4>스틸컷</h4>
			</div>
			
			<table>
				<tr>
					<td align="center">
						<div class="fotorama" data-allowfullscreen="true" data-nav="thumbs">
							<c:forEach var="steal" items="${stealList }">
								<img alt="" src="/resources/images/movie/stealcut/${steal.sc_img }">
							</c:forEach>
						</div>
					</td>
				</tr>
			</table>
		</div>
		
		<hr style="width: 930px; background-color: black; height: 3px; margin: 50px 0px 30px 0px;">
			
		<!-- 한줄평 -->
		<div id="movie-reply">
			<div id="movie-reply-title">한줄평</div>
			<div id="movie-reply-byte">0/150</div>
			<div id="movie-reply-body">
				<div id="movie-reply-iamge">
					<img alt="myImage" src="/resources/images/join/no_pic.png" width="75px" height="75px">
				</div>
				<div id="movie-reply-content">
					<div id="reply-content-star">
						<div id="rateYo"></div>
						<div id="rateNumer">0점</div>
						<div id="rateContent">평점을 입력해주세요</div>
					</div>
					<div id="reply-content-content">
						<form action="/movie/mrInsert" method="post" id="mrInsert">
							<textarea name="mr_content" placeholder="로그인 후 이용 가능한 서비스 입니다." style="width: 464px; height: 74px;"></textarea>
							<input type="hidden" name="mr_img" value="${member.pic }">
							<input type="hidden" name="id" value="${member.id }">
							<input type="hidden" name="mr_score" id="mr_score">
							<input type="hidden" name="m_num" value="${m_num }">
						</form>
					</div>
					<div id="reply-content-btn">등록</div>
				</div>
			</div>
		</div>
		
		<!-- 목록 -->
		<div id="movie-reply-mrList">
			<c:forEach var="mr" items="${mrList }" varStatus="st">
				<div class="mr-box">
					<img class="mr-img" alt="userImage" src="/resources/images/join/${mr.mr_img }">
					
					<div class="mr_userInfo">
						<span>${mr.id }</span>
						<span><fmt:formatDate value="${mr.mr_regdate }" pattern="yy.MM.dd"/></span>
						
						<span class="rateYo${st.count }"></span>
						<script src="/resources/js/jquery.rateyo.js"></script>
						<script type="text/javascript">
							$(function() {
								var cc = $(".rateYo${st.count}");
								cc.rateYo({"rating" : "${mr.mr_score}"/2});
								//cc.rateYo("option", "starWidth", "20px");
								cc.rateYo("option", "readOnly", true);
								cc.rateYo("option", "spacing", "-0px");
								
							});
						</script>
					</div>
					
					<div class="mr_contentInfo">
						${mr.mr_content }
					</div>
					
					<c:choose>
						<c:when test="${member.id == mr.id }">
							<div class="mr_btn1">
								삭제
							</div>
						</c:when>
						<c:otherwise>
							<div class="mr_btn2">
								삭제
							</div>
						</c:otherwise>
					</c:choose>
					
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>