<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/css/movie/movieDetail.css">
	<script type="text/javascript">
		var cnt = 0;
		$(function() {
			$("#like").click(function(e) {
				if(cnt % 2 == 0) {
					$(this).attr("src", "/resources/images/movie/heart_red.png");
					cnt++;
				}else {
					$(this).attr("src", "/resources/images/movie/heart_black.png");
					cnt = 0;
				}
			});
		});
	</script>
</head>
<body>
	<div id="movieDetailWrap">
		<div id="detailPoster">
			<img alt="" src="/resources/images/movie/poster/trans.jpg">
		</div>
		
		<div id="detailContents">
			<div id="detailTitle">
				<strong>트랜스 포머 : 최후의 기사</strong>
				<img alt="playingImg" src="/resources/images/movie/playing.png">
				<div>Transformers: The Last Knight</div>
			</div>
			
			<div id="detailSpec">
				감독:<br>
				배우:<br>
				장르:<br>
				개봉:<br>
				공식사이트:
			</div>
			
			<div id="detailLike">
				<img id="like" alt="" src="/resources/images/movie/heart_black.png">
				<a href="#">
					<img id="reserve_btn" alt="reserve_btn" src="/resources/images/movie/reserve_btn.png">
				</a>
				<div id="like_point">11010</div>
			</div>
		</div>
		
		<div id="detail_select">
			<img alt="detail_select" src="/resources/images/movie/detail_select.png">
		</div>
		
		<div id="movieStroy">
			두 세상의 충돌, 하나만 살아남는다!           
 
			옵티머스 프라임은 더 이상 인간의 편이 아니다.
			트랜스포머의 고향 사이버트론의 재건을 위해 지구에 있는 고대 유물을 찾아나선 옵티머스 프라임은
			인류와 피할 수 없는 갈등을 빚고, 오랜 동료 범블비와도 치명적인 대결을 해야만 하는데…
			 
			영원한 영웅은 없다!
			하나의 세상이 존재하기 위해선 다른 세상이 멸망해야 한다!
		</div>
		
		<div id="trailer">
			<div class="heading">
				<h4>트레일러</h4>
			</div>
			
			<table border="1">
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		
		<div id="stealCut">
			<div class="heading">
				<h4>스틸컷</h4>
			</div>
			
			<table border="1">
				<tr>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>