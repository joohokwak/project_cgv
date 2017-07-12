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
						<a href="http://section.cgv.co.kr/event/running/EventZone.aspx?idx=784"><img alt="" src="/resources/images/body/14993927745800.jpg"></a>
						<a href="http://section.cgv.co.kr/event/running/EventZone.aspx?idx=781"><img alt="" src="/resources/images/body/14988022357050.jpg"></a>
						<a href="http://section.cgv.co.kr/event/running/eventzone.aspx?idx=771"><img alt="" src="/resources/images/body/14979411603010.png"></a>
						<a href="http://section.cgv.co.kr/event/running/eventzone.aspx?idx=776"><img alt="" src="/resources/images/body/14984576436440.jpg"></a>
						<a href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16395&menu=0"><img alt="" src="/resources/images/body/14990741670080.jpg"></a>
						<a href="http://section.cgv.co.kr/Event/2016/0419_PaconiLetter/Default.aspx"><img alt="" src="/resources/images/body/mainbig_new_2.jpg"></a>
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
				<div class="selection">
					<img alt="selection" src="/resources/images/body/h3_movie_selection.gif">
				</div>
				
				<table style="width: 980px; height: 388px; margin-top: 20px;">
					<tr>
						<td width="733">
							<iframe width="733" height="388" src="https://www.youtube.com/embed/w2EwkleWbl4" frameborder="0" allowfullscreen></iframe>
						</td>
						<td width="240">
							<img alt="poster" src="/resources/images/movie/poster/79826_1000.jpg" width="240" height="388">
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
				<div class="selection">
					<img alt="selection" src="resources/images/body/h3_event.gif">
				</div>
				
				<div class="sect-event">
					<ul>
						<li><a href="http://section.cgv.co.kr/event/running/EventZone.aspx?idx=781"><img alt="eventImage" src="/resources/images/event/14969966204330.jpg" width="240px" height="200px"></a></li>
						<li><a href="http://section.cgv.co.kr/event/running/eventzone.aspx?idx=776"><img alt="eventImage" src="/resources/images/event/14984396716630.jpg" width="240px" height="200px"></a></li>
						<li><a href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=16124&menu=0"><img alt="eventImage" src="/resources/images/event/14984445219590.jpg" width="240px" height="200px"></a></li>
						<li><a href="http://section.cgv.co.kr/event/running/eventzone.aspx?idx=771"><img alt="eventImage" src="/resources/images/event/14991573972560.jpg" width="240px" height="200px"></a></li>
					</ul>
				</div>
				
				<div class="cols-banner">
					<div class="col-ad">
						<div class="box-com">
						    <div class="box-inner">
				                <a href="http://section.cgv.co.kr/discount/Special/discount/EventDetail.aspx?Idx=15974&amp;pb=Y"><img src="http://img.cgv.co.kr/Front/Main/2017/0515/14948153432980.jpg" alt="위비"></a>
				            </div>
						</div>
					</div>
					<div class="col-hd">
						<a href="http://www.cgv.co.kr/arthouse/"><img src="http://img.cgv.co.kr/R2014/images/main/main_moviecollage.jpg" alt="CGV ARTHOUSE, A Good Movie, A Better Life"></a>
					</div>
					<div class="col-collage">
						<div class="box-com">
						    <div id="Branding_R" class="box-inner">
				                <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@Branding" width="226" height="259" title="기업광고-페이코" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="Branding" id="Branding"></iframe>    
				            </div>
						</div>
					</div>
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
									<a href="/notice/list">${n.n_cate} ${n.n_title}</a> 
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
