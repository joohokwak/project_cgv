<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/resources/css/admin/mybtn.css">
<style type="text/css">
	.movie-wrap{
		position: relative;
		width: 900px;
		margin: 0 auto;
		color: #666666;
	}
	
	.movie-header{
		position: relative;
		text-align: left; 
	}
	
	.movie-header h1{
		font-weight: bold;
		font-size: 25px;
		color: black;
	}
	
	.movie-header p{
		margin: 2px 0px;
	}
	
	.movie-body{
		position: relative;
		top: 20px;
		width: 850px;
	}
	
	.movie-table{
		position: relative;
		width: 830px;
		border-collapse: collapse;
		margin-bottom: 20px;
	}
	
	.movie-input{
		width: 144px;
		padding: 6px;
		border: 1px solid #a9a9a9;
		border-radius:4px;
	}
	
	#grade_select{
		padding: 5px;
		border-radius: 4px;
		vertical-align: middle;
	}
	
	.movie-table td{
		height: 35px;
	}
</style>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
var classCnt = 1;

$(function() {
	
	$("#movie_menu").css({
		background : "#343132",
		color: "#fff"		
	});
	
	$("#site_check").change(function(){
		if($("#site_check").is(":checked") == true){
			$("#site").val("").attr("disabled",true);
			
		}else{
			$("#site").val("").attr("disabled",false);
		}
	});
	
	$("#video_check1").change(function(){
		if($("#video_check1").is(":checked") == true){
			$("#video1").val("").attr("disabled",true);
			
		}else{
			$("#video1").val("").attr("disabled",false);
		}
	});
	
	$("#video_check2").change(function(){
		if($("#video_check2").is(":checked") == true){
			$("#video2").val("").attr("disabled",true);
			
		}else{
			$("#video2").val("").attr("disabled",false);
		}
	});
	
	$("#video_check3").change(function(){
		if($("#video_check3").is(":checked") == true){
			$("#video3").val("").attr("disabled",true);
			
		}else{
			$("#video3").val("").attr("disabled",false);
		}
	});
	
	// 에디터
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		//SmartEditor2Skin.html 파일이 존재하는 경로
		sSkinURI: "/resources/se2/SmartEditor2Skin.html",	
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			
			fOnBeforeUnload : function(){
				
			}
		}, 
		fCreator: "createSEditor2"
	});
	
	// submit 체크
	$("#movieSubmit").click(function(e) {
		var check = movieCheck();
		if(check != false){
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			
			var ir1 = $("#content").val();

		    if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>')  {
		         alert("내용을 입력하세요.");
		         oEditors.getById["content"].exec("FOCUS"); //포커싱
		         return false;
		    }
			
			$("#movieForm").submit();
		}
	});
	

	$("#grade_select").change(function(){
		$("#grade_select option").each(function(){
			if($(this).is(":selected") == true){
				//alert($(this).text());
				$("#grade").val($(this).text());
			}
		});
	});
	
	$(".genreGroup").change(function(){
		var arr = [];
		var genre_count = 0;
		$(".genreGroup").each(function(){
			if($(this).is(":checked") == true){
				arr.push($(this).val());
				genre_count++;
			}
		});
		
		if(genre_count != 0){
			$("#genre").val(arr);
		}
	});
});

function movieCheck(){
	
	if($.trim($("#title_kor").val()) == ""){
		alert("한글 이름을 입력하세요!");
		$("#title_kor").focus();
		return false;
	}else if($.trim($("#title_eng").val()) == ""){
		alert("영문 이름을 입력하세요!");
		$("#title_eng").focus();
		return false;
	}else if($.trim($("#producer").val()) == ""){
		alert("감독명을 입력하세요!");
		$("#producer").focus();
		return false;
	}else if($("#genre").val() == ""){
		alert("하나 이상의 장르를 선택하세요!");
		$(".genreGroup").focus();
		return false;
	}else if($("#grade_select").val() == "none"){
		alert("관람 등급을 선택하세요!");
		$("#grade_select").focus();
		return false;
	}else if($("#time").val() == ""){
		alert("상영시간을 입력하세요!");
		$("#time").focus();
		return false;
	}else if(isNaN($("#time").val()) == true){
		alert("상영시간을 제대로 입력하세요!");
		$("#time").focus();
		return false;
	}else if($("#made").val() == ""){
		alert("제작국가를 입력하세요!");
		$("#made").focus();
		return false;
	}else if($("#company").val() == ""){
		alert("배급사 명을 입력하세요!");
		$("#company").focus();
		return false;
	}else if($("#site_check").is(":checked") == false && $.trim($("#site").val()) == ""){
		alert("사이트를 입력하세요!");
		$("#site").focus();
		return false;
	}else if($("#video_check1").is(":checked") == false && $.trim($("#video1").val()) == ""){
		alert("사이트를 입력하세요!");
		$("#video1").focus();
		return false;
	}else if($("#video_check2").is(":checked") == false && $.trim($("#video_check2").val()) == ""){
		alert("사이트를 입력하세요!");
		$("#video2").focus();
		return false;
	}else if($("#video_check3").is(":checked") == false && $.trim($("#video3").val()) == ""){
		alert("사이트를 입력하세요!");
		$("#video3").focus();
		return false;
	}else if($("#start").val() == ""){
		alert("상영 시작일을 입력하세요!");
		$("#start").focus();
		return false;
	}else if($("#end").val() == ""){
		alert("상영 종료일을 입력하세요!");
		$("#end").focus();
		return false;
	}
	return true;
}

</script>
<div class="movie-wrap">
	<div class="movie-header">
		<h1>영화 등록</h1>
		<p>영화의 정보를 등록하는 페이지 입니다.</p>
	</div>
	
	<div class="movie-body">
		<form action="/admin/movie/insert" id="movieForm" method="post">
			<table class="movie-table">
				<tr>
					<td width="90px">
						<label for="title_kor">제목(한글)</label>
					</td>
					<td>
						<input type="text" id="title_kor" name="title_kor" class="movie-input" style="width: 200px">
					</td>
				</tr>
				<tr>
					<td>
						<label for="title_eng">제목(영문)</label>
					</td>
					<td>
						<input type="text" id="title_eng" name="title_eng" class="movie-input" style="width: 200px">
					</td>
				</tr>
				<tr>
					<td>
						<label for="producer">감독</label>
					</td>
					<td>
						<input type="text" id="producer" name="producer" class="movie-input" style="width: 200px">
					</td>
				</tr>
				<tr>
					<td style="vertical-align: text-top;">
						<label>장르</label>
					</td>
					<td>
						<div id="genreWrap">
							<c:forEach items="${gList}" var="g" varStatus="status">
								<label style="display: inline-block; padding-right: 10px; width: 120px;">
									<input type="checkbox" class="genreGroup" value='${g.g_name}'>${g.g_name}
								</label>
<%-- 								<c:if test="${status.count%10 == 0}"><br></c:if> --%>
							</c:forEach>
							<input type="hidden" id="genre" name="genre">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<label for="grade_select">관람 등급</label>
					</td>
					<td>
						<select id="grade_select">
							<option value="none">선택하세요</option>
							<option value="all">전체</option>
							<option value="12-rating">12세 이상</option>
							<option value="15-rating">15세 이상</option>
							<option value="x-rated">청소년 관람불가</option>							
						</select>
						<input type="hidden" id="grade" name="grade">
					</td>
				</tr>
				<tr>
					<td>
						<label for="time">상영시간</label>
					</td>
					<td>
						<input type="number" id="time" name="time" class="movie-input" width="132px">
					</td>
				</tr>
				<tr>
					<td>
						<label for="made">제작 국가</label>
					</td>
					<td>
						<input type="text" id="made" name="made" class="movie-input" style="width: 200px">
					</td>
				</tr>
				<tr>
					<td>
						<label for="company">배급사</label>
					</td>
					<td>
						<input type="text" id="company" name="company" class="movie-input" style="width: 200px">
					</td>
				</tr>
				<tr>
					<td>
						<label for="site">사이트</label>
					</td>
					<td>
						<input type="text" id="site" name="site" class="movie-input" style="width: 327px">&nbsp;
						<label><input type="checkbox" id="site_check">사이트 없음</label>
					</td>
				</tr>
				<tr>
					<td>
						<label for="video1">트레일러</label>
					</td>
					<td>
						<input type="text" id="video1" name="video1" class="movie-input" style="width: 327px; margin-bottom: 3px">
						&nbsp;<label><input type="checkbox" id="video_check1">트레일러 없음</label><br>
						<input type="text" id="video2" name="video2" class="movie-input" style="width: 327px; margin-bottom: 3px">
						&nbsp;<input type="checkbox" id="video_check2"><br>
						<input type="text" id="video3" name="video3" class="movie-input" style="width: 327px; margin-bottom: 1px">
						&nbsp;<input type="checkbox" id="video_check3">
					</td>
				</tr>
				<tr>
					<td><label>상영일</label></td>
					<td>
						<input type="date" id="start" name="start" class="movie-input">
						<span style="padding: 0px 5px">~</span>
						<input type="date" id="end" name="end" class="movie-input">
					</td>
				</tr>
				<tr>
					<td style="vertical-align: text-top;">
						<label for="content">줄거리</label>
					</td>
					<td style="background: #fff;">
						<textarea rows="30" cols="100" id="content" name="content" style="width: 100%"></textarea>
					</td>
				</tr>
				
				<tr>
					<td align="right" colspan="2">
						<button class="my-btn" type="button" onclick="location.href='/admin/movie/list'"><span>목록</span></button>
						<input type="button" value="등록" id="movieSubmit" class="my-btn" style="margin-right: 10px">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
