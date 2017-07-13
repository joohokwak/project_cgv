<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link rel="stylesheet" href="/resources/css/movie/movieAll.css?ver=1">
	<script type="text/javascript">
		$(function() {
			$(".heart-box").click(function(e) {
				var m_num = $(this).next().val();
				var hBox = $(this);
				
				var flag = Number($(this).attr("data-flag"));
				
				if(flag == 0) {
					$(this).css("background", "url(/resources/images/login/sprite_icon.png) -83px -65px no-repeat");
					flag++;
					$.ajax({
						url: "/movie/likeUp?m_num="+m_num,
						dataType : "json",
						success: function(data) {
							hBox.parent().find(".like_count").text(data);
						}
					});
				}else {
					$(this).css("background", "url(/resources/images/login/sprite_icon.png) -60px -65px no-repeat");
					flag=0;
					$.ajax({
						url: "/movie/likeDown?m_num="+m_num,
						dataType : "json",
						success: function(data) {
							hBox.parent().find(".like_count").text(data);
						}
					});
				}
				
				$(this).attr("data-flag", flag);
				return false;
			});
		});
	</script>
</head>
<body>
	<div id="movieAllWrap">
		
		<ul>
			<c:forEach var="ma" items="${mAll }" varStatus="st">
				<li class="box-li">
					<div class="box-image">
						<a href="/movie/movieDetail?m_num=${ma.m_num }">
							<img alt="moviePoster" src="/resources/images/movie/poster/${ma.m_poster }" width="185px" height="260px">
						</a>
					</div>
					
					<div class="box-contents">
						<a href="/movie/movieDetail?m_num=${ma.m_num }">
							<strong class="title">${ma.m_title1 }</strong>
			            </a>
			            
						<span class="txt-info">
							<strong>
								<fmt:formatDate value="${ma.m_start }" pattern="yyyy.MM.dd"/>
								<span>개봉</span>
							</strong>
						</span>
						
						<div class="boxLike">
							<a href="#" class="heart-box" data-flag="0"></a>
							<input type="hidden" id="m_num" value="${ma.m_num }">
							<span class="like_count">
								<fmt:formatNumber value="${ma.m_like }" type="number"/>
							</span>
							<a class="link-reservation" href="/reserve/reserveHome?m_num=${ma.m_num }"></a>
						</div>
					</div>
				</li>
				
				<c:if test="${st.index == 4 }">
					<li class="box-div"></li>
				</c:if>
			</c:forEach>
		</ul>
		
		<div class="box-div2"></div>
		
		<div class="paging">
			<c:forEach var="i" begin="${p.startPage }" end="${p.endPage < p.pageTotalCount ? p.endPage : p.pageTotalCount }">
				<c:choose>
					<c:when test="${i eq p.currentPageNumber }">
						<span class="paging-span1">
							${i }
						</span>
					</c:when>
					
					<c:otherwise>
						<span class="paging-span2">
							<a href="/movie/movieAll?pageNum=${i }">${i }</a>
						</span>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
</body>
</html>