<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link rel="stylesheet" style="text/css" href="resources/css/movie/movieList.css">
</head>
<body>
	
	<div id="movieListWrap">
		
<%-- 		<c:forEach var="movie" items="${movieList }"> --%>
			<table id="movieListTable1">
				<tr>
					<td>
						<div class="boxImg">
							<strong class="rankUp">No.1</strong>
							<a href="#">
								<span class="thumb-image">
									<img alt="" src="resources/images/movie/poster/trans.jpg">
								</span>
							</a>
						</div>
						
						<div class="boxContents">
							<a href="#">
								<strong class="boxTitle">movie title</strong>
							</a>
							
							<span class="boxDate">
								<strong>movie date</strong>
							</span>
							
							<span class="boxLike">
								
							</span>
						</div>
					</td>
					
					<td>
						<div class="boxImg">
							<strong class="rankUp">No.2</strong>
							<a href="#">
								<span class="thumb-image">
									<img alt="" src="resources/images/no_image.png">
								</span>
							</a>
						</div>
						
						<div class="boxContents">
							<a href="#">
								<strong class="boxTitle">movie title</strong>
							</a>
							
							<span class="boxDate">
								<strong>movie date</strong>
							</span>
							
							<span class="boxLike">
								
							</span>
						</div>
					</td>
					
					<td>
						<div class="boxImg">
							<strong class="rankUp">No.3</strong>
							<a href="#">
								<span class="thumb-image">
									<img alt="" src="resources/images/no_image.png">
								</span>
							</a>
						</div>
						
						<div class="boxContents">
							<a href="#">
								<strong class="boxTitle">movie title</strong>
							</a>
							
							<span class="boxDate">
								<strong>movie date</strong>
							</span>
							
							<span class="boxLike">
								
							</span>
						</div>
					</td>
					
					<td>
						<div id="chart_ad">
							<div id="boxChart">
								<img alt="chart-ad" src="resources/images/movie/poster/chart_ad.jpg">
							</div>
							
							<div id="chart_ad_desc">
								<img alt="chart_ad_img" src="resources/images/movie/poster/ico_ad1.png">
								<span id="span1">씨티카드 이벤트</span>
								<hr>
								<span id="span2">영화예매권5매증정</span>
								<hr>							
							</div>
						</div>
					</td>
				</tr>
				
				<tr>
					<td colspan="4">
						<hr style="width: 935px; background-color: black; height: 3px;">
					</td>
				</tr>
				
				<tr>
					<td>
						<div class="boxImg">
							<strong class="rankDown">No.4</strong>
							<a href="#">
								<span class="thumb-image">
									<img alt="" src="resources/images/no_image.png">
								</span>
							</a>
						</div>
						
						<div class="boxContents">
							<a href="#">
								<strong class="boxTitle">movie title</strong>
							</a>
							
							<span class="boxDate">
								<strong>movie date</strong>
							</span>
							
							<span class="boxLike">
								
							</span>
						</div>
					</td>
					
					<td>
						<div class="boxImg">
							<strong class="rankDown">No.5</strong>
							<a href="#">
								<span class="thumb-image">
									<img alt="" src="resources/images/no_image.png">
								</span>
							</a>
						</div>
						
						<div class="boxContents">
							<a href="#">
								<strong class="boxTitle">movie title</strong>
							</a>
							
							<span class="boxDate">
								<strong>movie date</strong>
							</span>
							
							<span class="boxLike">
								
							</span>
						</div>
					</td>
					
					<td>
						<div class="boxImg">
							<strong class="rankDown">No.6</strong>
							<a href="#">
								<span class="thumb-image">
									<img alt="" src="resources/images/no_image.png">
								</span>
							</a>
						</div>
						
						<div class="boxContents">
							<a href="#">
								<strong class="boxTitle">movie title</strong>
							</a>
							
							<span class="boxDate">
								<strong>movie date</strong>
							</span>
							
							<span class="boxLike">
								
							</span>
						</div>
					</td>
					
					<td>
						<div class="boxImg">
							<strong class="rankDown">No.7</strong>
							<a href="#">
								<span class="thumb-image">
									<img alt="" src="resources/images/no_image.png">
								</span>
							</a>
						</div>
						
						<div class="boxContents">
							<a href="#">
								<strong class="boxTitle">movie title</strong>
							</a>
							
							<span class="boxDate">
								<strong>movie date</strong>
							</span>
							
							<span class="boxLike">
								
							</span>
						</div>
					</td>
				</tr>
				
				<tr>
					<td colspan="4">
						<hr style="width: 935px; background-color: black; height: 3px;">
					</td>
				</tr>
			</table>
<%-- 		</c:forEach> --%>
	</div>
</body>
</html>