<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="/resources/css/themes/default/default.css" type="text/css"/>
<link rel="stylesheet" href="/resources/css/themes/light/light.css" type="text/css"/>
<link rel="stylesheet" href="/resources/css/themes/dark/dark.css" type="text/css"/>
<link rel="stylesheet" href="/resources/css/themes/bar/bar.css" type="text/css"/>
<link rel="stylesheet" href="/resources/css/nivo-slider.css" type="text/css"/>
<link rel="stylesheet" href="/resources/css/style.css" type="text/css"/>
<link rel="stylesheet" href="/resources/css/body.css" type="text/css"/>

<script type="text/javascript">
	$(function() {
		rolling();
		
		// 게시판 뉴스 액션
		var height = $("#rollingDiv").height();
		var licnt = $(".ticker li").length;
		
		var max = height * licnt;
		var movecnt = 0;
		
		var handler = setInterval(rolling, 3000);
		
		function rolling() {
			movecnt += height;
			
			$(".ticker").animate({"top":-movecnt}, 600, function() {
				if(movecnt >= max) {
					$(this).css("top", 0);
					movecnt = 0;
				}
			});
		}
		
		$(".ticker").append($(".ticker li").first().clone());
		
		$("#autoRollingDiv").hover(function(e) {
			clearInterval(handler);
		}, function(e) {
			handler = setInterval(rolling, 3000);
		});
	});
</script>

<div id="bodyWrap">
	<table style="width: 100%; border-spacing: 0;">
		<tr>
			<td align="center">
				<img alt="ticket" src="/resources/images/body/14890258372960.jpg">
			</td>
		</tr>
	
		<tr>
			<td align="center" style="background: url('/resources/images/body/block.png') repeat-x; background-size: 100% 450px;">
				<div class="slider-wrapper theme-default" style="width: 980px; background: #fdfcf0; border: none; margin-top: 0;">
		            <div id="slider" class="nivoSlider" style="height: 450px;">
						<a href="#"><img alt="" src="/resources/images/body/14955234602430.jpg"></a>
						<a href="#"><img alt="" src="/resources/images/body/14968216653960.jpg"></a>
						<a href="#"><img alt="" src="/resources/images/body/14979411603010.png"></a>
						<a href="#"><img alt="" src="/resources/images/body/14984576436440.jpg"></a>
						<a href="#"><img alt="" src="/resources/images/body/14984476495450.jpg"></a>
						<a href="#"><img alt="" src="/resources/images/body/mainbig_new_2.jpg"></a>
		            </div>
        		</div>
        		
        		<script type="text/javascript" src="/resources/js/jquery.nivo.slider.js"></script>
			    <script type="text/javascript">
				    $(function() {
				        $('#slider').nivoSlider();
				    });
			    </script>
			</td>
		</tr>
		
		<!-- 동영상&포스터 -->
		<tr>
			<td align="center">
				<img alt="selection" src="/resources/images/body/h3_movie_selection.gif">
				<table style="width: 980px; height: 388px; margin-top: 20px;">
					<tr>
						<td width="733">
							<iframe width="733" height="388" src="https://www.youtube.com/embed/wzdaYNLeGqQ" frameborder="0" allowfullscreen></iframe>
						</td>
						<td width="240">
							<img alt="poster" src="/resources/images/movie/poster/Real.jpg" width="240" height="388">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr height="50px">
			<td></td>
		</tr>
		
		<!-- 이벤트 -->
		<tr>
			<td align="center">
				<div style="width: 980px; height: 50px;">
					<img alt="selection" src="resources/images/body/h3_event.gif">
				</div>
			</td>
		</tr>
		
		<tr height="50px">
			<td></td>
		</tr>
		
		<!-- 공지사항 -->
		<tr>
			<td align="center">
				<div id="noticeWrap">
					<h3 id="noticeIcon">공지사항</h3>
					<div id="rollingDiv">
						<ul class="ticker">
							<c:forEach items="${nList}" var="n">
								<li>
									<a href="/notice/view?num=${n.n_num}">${n.n_cate} ${n.n_title}</a> 
									<span style="float: right;"><fmt:formatDate value="${n.n_regdate}"/></span>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>
