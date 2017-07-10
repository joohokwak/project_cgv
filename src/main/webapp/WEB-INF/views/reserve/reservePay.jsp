<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link rel="stylesheet" href="/resources/css/reserve/pay.css?ver=1">
	<script type="text/javascript">
		$(function() {
			$("#pay-footer-btn").click(function(e) {
				$("#reserveSign").submit();
			});
			
			
			$("#pointBtn").click(function(e) {
				var rv_pay = parseInt("${rv_pay}");
				var mypoint = parseInt($("#myPoint").find("#memberPoint").val());
				
				var result_pay9 = 0;
				var mypoint2 = 0;
				
				if(mypoint > 0) {
					
					if(mypoint > rv_pay) {
						mypoint2 = mypoint - rv_pay;
						$("#myPoint").text(mypoint2.format());
					}else {
						mypoint2 = rv_pay - rv_pay;
						$("#myPoint").text(mypoint2.format());
						result_pay9 = rv_pay - mypoint;
					}
				}
				
				$("#resultPay").text(result_pay9.format());
				$("#rv_pay").val(result_pay9);
			});
			
			
			// 숫자에 콤마 찍기 위한 프로타입 변경
			Number.prototype.format = function(){
			    if(this==0) return 0;
			 
			    var reg = /(^[+-]?\d+)(\d{3})/;
			    var n = (this + '');
			 
			    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
			 
			    return n;
			};
			 
			// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
			String.prototype.format = function(){
			    var num = parseFloat(this);
			    if( isNaN(num) ) return "0";
			 
			    return num.format();
			};
			
		});
	</script>
</head>
<body>
	
	<div id="reservePayWrap">
		<div id="pay-header">
			<div id="pay-title">예매내역 확인</div>
		</div>
		
		<div id="pay-movieInfo">
			<div id="pay-reserveInfo">
				<font size="3">●예매정보</font>&nbsp;&nbsp;<font size="2">결제하시기 전 예매내역을 다시 한번 확인해 주세요.</font>
			</div>
			
			<div id="pay-payInfo">
				<font size="3">●결제정보</font>&nbsp;&nbsp;<font size="2">결제하기 버튼을 클릭하시면 결제가 완료됩니다.</font>
			</div>
			
			<div id="pay-img">
				<img alt="" src="/resources/images/movie/poster/${movie.m_poster }" width="114px" height="165px">
				
				<div id="pay-detailInfo">
					<table>
						<tr>
							<td width="60px">영화명</td>
							<td class="pay-detailInfo2">${movie.m_title1 }</td>
						</tr>
						<tr>
							<td>극장</td>
							<td class="pay-detailInfo2">${rv_theater }</td>
						</tr>
						<tr>
							<td>상영관</td>
							<td class="pay-detailInfo2">${rv_screen }</td>
						</tr>
						<tr>
							<td>일시</td>
							<td class="pay-detailInfo2">${rv_date } ${rv_time } ~ ${rv_endtime }</td>
						</tr>
						<tr>
							<td>인원</td>
							<td class="pay-detailInfo2">${rv_people }</td>
						</tr>
						<tr>
							<td>좌석</td>
							<td class="pay-detailInfo2">${rv_seat }</td>
						</tr>
					</table>
				</div>
			</div>
			
			<div id="pay-content">
				<div id="pay-point">
					<span>내 포인트 : </span>
					<span id="myPoint">
						<fmt:formatNumber value="${point }" type="number"/>
						<input type="hidden" id="memberPoint" value="${point }">
					</span>
					
					<div id="pointBtn">
						<div>
							포인트 사용
						</div>
					</div>
				</div>
				
				<div id="pay-payResult">
					<span>결재금액 : </span>
					<span>
						<fmt:formatNumber var="resultPay" value="${rv_pay }" type="number"/>
						<input type="hidden" id="rv_pay" value="${rv_pay }"> 
						<span id="resultPay">${resultPay }</span>
					</span>원
				</div>
			</div>
		</div>
		
		<div id="pay-body">
			<ul>
				<li>인터넷 예매는 온라인상으로 영화상영 시간 20분 전 까지 취소 가능하며 20분 이후에는 현장에서 취소를 하셔야 합니다.</li>
				<li>취소는 상영시간 전 까지 하실 수 있으며, 전화로 취소 요청을 하실 경우 취소가 되지 않습니다.</li>
				<li>입장지연에 따른 관람 불편을 최소화하고자 본 영화는 약 10분 후에 시작됩니다. (일부 극장 제외)</li>
			</ul>
		</div>
		
		<div id="pay-footer">
			<div id="pay-footer-wrap">
				<div id="pay-footer-btn">결제하기</div>
			</div>
		</div>
		
	</div>
	
	
	
	<!-- 예매정보를 담을 폼 -->
	<form action="/reserve/reserveSign" id="reserveSign" method="post">
		<input type="hidden" name="rv_theater" value="${rv_theater }">
		<input type="hidden" name="rv_screen" value="${rv_screen }">
		<input type="hidden" name="rv_date" value="${rv_date }">
		<input type="hidden" name="rv_time" value="${rv_time } ~ ${rv_endtime }">
		<input type="hidden" name="rv_people" value="${rv_people }">
		<input type="hidden" name="rv_pay" id="rv_pay" value="${rv_pay }">
		<input type="hidden" name="rv_seat" value="${rv_seat }">
		<input type="hidden" name="id" value="${member.id }">
		<input type="hidden" name="m_num" value="${m_num }">
		<input type="hidden" name="t_num" value="${t_num }">
		<input type="hidden" name="s_num" value="${s_num }">
	</form>
	
</body>
</html>