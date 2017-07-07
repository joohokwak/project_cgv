<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link rel="stylesheet" style="text/css" href="/resources/css/movie/movieList.css">
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
	
	<div id="movieListWrap">
		
		<table id="movieListTable1">
			<tr>
				<td>
				<c:forEach var="movie" items="${mvList }" varStatus="status">
					<c:if test="${status.index == 0 }">
					<div class="boxImg">
						<strong class="rankUp">No.1</strong>
						<a href="/movie/movieDetail?m_num=${movie.m_num }">
							<span class="thumb-image">
								<img alt="" src="/resources/images/movie/poster/${movie.m_poster }">
							</span>
						</a>
						<strong id="no1"></strong>
					</div>
					
					<div class="boxContents">
						<a href="/movie/movieDetail?m_num=${movie.m_num }">
							<strong class="boxTitle">${movie.m_title1 }</strong>
						</a>
						
						<span class="boxDate">
							<strong>${movie.m_start } 개봉</strong>
						</span>
						
						<div class="boxLike">
							<a href="#" class="heart-box" data-flag="0"></a>
							<input type="hidden" id="m_num" value="${movie.m_num }">
							<span class="like_count">
								<fmt:formatNumber value="${movie.m_like }" type="number"/>
							</span>
							<a href="/reserve/reserveHome" class="reserve_btn"></a>
						</div>
					</div>
					</c:if>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="movie" items="${mvList }" varStatus="status">
					<c:if test="${status.index == 1 }">
					<div class="boxImg">
						<strong class="rankUp">No.2</strong>
						<a href="/movie/movieDetail?m_num=${movie.m_num }">
							<span class="thumb-image">
								<img alt="" src="/resources/images/movie/poster/${movie.m_poster }">
							</span>
						</a>
					</div>
					
					<div class="boxContents">
						<a href="/movie/movieDetail?m_num=${movie.m_num }">
							<strong class="boxTitle">${movie.m_title1 }</strong>
						</a>
						
						<span class="boxDate">
							<strong>${movie.m_start } 개봉</strong>
						</span>
						
						<div class="boxLike">
							<a href="#" class="heart-box" data-flag="0"></a>
							<input type="hidden" id="m_num" value="${movie.m_num }">
							<span class="like_count">
								<fmt:formatNumber value="${movie.m_like }" type="number"/>
							</span>
							<a href="/reserve/reserveHome" class="reserve_btn"></a>
						</div>
					</div>
					</c:if>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="movie" items="${mvList }" varStatus="status">
					<c:if test="${status.index == 2 }">
					<div class="boxImg">
						<strong class="rankUp">No.3</strong>
						<a href="/movie/movieDetail?m_num=${movie.m_num }">
							<span class="thumb-image">
								<img alt="" src="/resources/images/movie/poster/${movie.m_poster }">
							</span>
						</a>
					</div>
					
					<div class="boxContents">
						<a href="/movie/movieDetail?m_num=${movie.m_num }">
							<strong class="boxTitle">${movie.m_title1 }</strong>
						</a>
						
						<span class="boxDate">
							<strong>${movie.m_start } 개봉</strong>
						</span>
						
						<div class="boxLike">
							<a href="#" class="heart-box" data-flag="0"></a>
							<input type="hidden" id="m_num" value="${movie.m_num }">
							<span class="like_count">
								<fmt:formatNumber value="${movie.m_like }" type="number"/>
							</span>
							<a href="/reserve/reserveHome" class="reserve_btn"></a>
						</div>
					</div>
					</c:if>
					</c:forEach>
				</td>
				
				<td>
					<div id="chart_ad">
						<div id="boxChart">
							<img alt="chart-ad" src="/resources/images/movie/poster/chart_ad.jpg">
						</div>
						
						<div id="chart_ad_desc">
							<img alt="chart_ad_img" src="/resources/images/movie/poster/ico_ad1.png">
							<span id="span1">씨티카드 이벤트</span>
							<hr>
							<span id="span2">영화예매권5매증정</span>
							<hr>							
						</div>
					</div>
				</td>
			</tr>
			
			<tr>
				<td align="left" colspan="4">
					<hr style="width: 930px; background-color: black; height: 3px; margin-left: 0px;">
				</td>
			</tr>
			
			<tr>
				<td>
					<c:forEach var="movie" items="${mvList }" varStatus="status">
					<c:if test="${status.index == 3 }">
					<div class="boxImg">
						<strong class="rankDown">No.4</strong>
						<a href="/movie/movieDetail?m_num=${movie.m_num }">
							<span class="thumb-image">
								<img alt="" src="/resources/images/movie/poster/${movie.m_poster }">
							</span>
						</a>
					</div>
					
					<div class="boxContents">
						<a href="/movie/movieDetail?m_num=${movie.m_num }">
							<strong class="boxTitle">${movie.m_title1 }</strong>
						</a>
						
						<span class="boxDate">
							<strong>${movie.m_start } 개봉</strong>
						</span>
						
						<div class="boxLike">
							<a href="#" class="heart-box" data-flag="0"></a>
							<input type="hidden" id="m_num" value="${movie.m_num }">
							<span class="like_count">
								<fmt:formatNumber value="${movie.m_like }" type="number"/>
							</span>
							<a href="/reserve/reserveHome" class="reserve_btn"></a>
						</div>
					</div>
					</c:if>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="movie" items="${mvList }" varStatus="status">
					<c:if test="${status.index == 4 }">
					<div class="boxImg">
						<strong class="rankDown">No.5</strong>
						<a href="/movie/movieDetail?m_num=${movie.m_num }">
							<span class="thumb-image">
								<img alt="" src="/resources/images/movie/poster/${movie.m_poster }">
							</span>
						</a>
					</div>
					
					<div class="boxContents">
						<a href="/movie/movieDetail?m_num=${movie.m_num }">
							<strong class="boxTitle">${movie.m_title1 }</strong>
						</a>
						
						<span class="boxDate">
							<strong>${movie.m_start } 개봉</strong>
						</span>
						
						<div class="boxLike">
							<a href="#" class="heart-box" data-flag="0"></a>
							<input type="hidden" id="m_num" value="${movie.m_num }">
							<span class="like_count">
								<fmt:formatNumber value="${movie.m_like }" type="number"/>
							</span>
							<a href="/reserve/reserveHome" class="reserve_btn"></a>
						</div>
					</div>
					</c:if>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="movie" items="${mvList }" varStatus="status">
					<c:if test="${status.index == 5 }">
					<div class="boxImg">
						<strong class="rankDown">No.6</strong>
						<a href="/movie/movieDetail?m_num=${movie.m_num }">
							<span class="thumb-image">
								<img alt="" src="/resources/images/movie/poster/${movie.m_poster }">
							</span>
						</a>
					</div>
					
					<div class="boxContents">
						<a href="/movie/movieDetail?m_num=${movie.m_num }">
							<strong class="boxTitle">${movie.m_title1 }</strong>
						</a>
						
						<span class="boxDate">
							<strong>${movie.m_start } 개봉</strong>
						</span>
						
						<div class="boxLike">
							<a href="#" class="heart-box" data-flag="0"></a>
							<input type="hidden" id="m_num" value="${movie.m_num }">
							<span class="like_count">
								<fmt:formatNumber value="${movie.m_like }" type="number"/>
							</span>
							<a href="/reserve/reserveHome" class="reserve_btn"></a>
						</div>
					</div>
					</c:if>
					</c:forEach>
				</td>
				
				<td>
					<c:forEach var="movie" items="${mvList }" varStatus="status">
					<c:if test="${status.index == 6 }">
					<div class="boxImg">
						<strong class="rankDown">No.7</strong>
						<a href="/movie/movieDetail?m_num=${movie.m_num }">
							<span class="thumb-image">
								<img alt="" src="/resources/images/movie/poster/${movie.m_poster }">
							</span>
						</a>
					</div>
					
					<div class="boxContents">
						<a href="/movie/movieDetail?m_num=${movie.m_num }">
							<strong class="boxTitle">${movie.m_title1 }</strong>
						</a>
						
						<span class="boxDate">
							<strong>${movie.m_start } 개봉</strong>
						</span>
						
						<div class="boxLike">
							<a href="#" class="heart-box" data-flag="0"></a>
							<input type="hidden" id="m_num" value="${movie.m_num }">
							<span class="like_count">
								<fmt:formatNumber value="${movie.m_like }" type="number"/>
							</span>
							<a href="/reserve/reserveHome" class="reserve_btn"></a>
						</div>
					</div>
					</c:if>
					</c:forEach>
				</td>
			</tr>
			
			<tr>
				<td align="left" colspan="4">
					<hr style="width: 930px; background-color: black; height: 3px; margin-left: 0px;">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>