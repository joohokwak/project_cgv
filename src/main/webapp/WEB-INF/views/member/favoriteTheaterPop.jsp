<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<link rel="stylesheet" href="/resources/css/member/favoriteTheaterPop.css?ver=1">
<script type="text/javascript">
</script>
</head>
<body>
	<div class="popWrap">
		<div class="header">
			<span>자주 가는 CGV 설정</span>
		</div>
		<div class="bodyWrap">
			<div class="body">
				<p>
					"영화관을 선택하여 등록해주세요."<strong>최대 5개까지</strong>
					"등록하실 수 있습니다."
				</p>
				<span>
					<select class="selectLoc">
						<option selected="selected">지역선택</option>
					</select>
					<select class="selectCGV">
						<option selected="selected">CGV선택</option>
					</select>
					<button class="selectLoc_btn">
						<span>
							자주가는 CGV 추가
						</span>
					</button>
				</span>
			</div>
			<div class=select_choice>
				<div class="choice_theater">
				<span>${member.name }( ${id } ) 님이 자주가는 CGV</span>
					<ul>
						<li class="none">
							<div class="box-polaroid">
								<div class="box-inner">
									<div class="theater">
										
									</div>
									<button class="theater_delete_btn">
									</button>
								</div>
							</div>
						</li>
						<li class="none">
							<div class="box-polaroid">
								<div class="box-inner">
									<div class="theater">
										가나다
									</div>
									<button class="theater_delete_btn">
									</button>
								</div>
							</div>
						</li>
						<li class="none">
							<div class="box-polaroid">
								<div class="box-inner">
									<div class="theater">
										가나다
									</div>
									<button class="theater_delete_btn">
									</button>
								</div>
							</div>
						</li>
						<li class="none">
							<div class="box-polaroid">
								<div class="box-inner">
									<div class="theater">
										가나다
									</div>
									<button class="theater_delete_btn">
									</button>
								</div>
							</div>
						</li>
						<li class="none">
							<div class="box-polaroid">
								<div class="box-inner">
									<div class="theater">
										가나다
									</div>
									<button class="theater_delete_btn">
									</button>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="choice_table">
					<table class="choice_inner">
						<colgroup>
							<col width="25%">
							<col width="45%">
							<col width="30%">
						</colgroup>
						<thead>
							<tr>
								<td><strong>항목</strong></td>
								<td><strong>이용목적</strong></td>
								<td><strong>보유기간</strong></td>
							</tr>
							<tr>
								<td>자주가는CGV (최대 5개)</td>
								<td>상품 결제시(영화 예매시) 편의 제공 <br>선호극장의 상영작 및 상영시간 우선 제공</td>
								<td>별도 동의 철회시까지 또는 약관 철회 후 1주일까지</td>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>