<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
var classCnt = 1;

$(function() {
	
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
	}else if($("#genre_select").val() == "none"){
		alert("장르를 선택하세요!");
		$("#genre_select").focus();
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
</head>
<body>
<!-- 
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| m_num      | int(11)      | NO   | PRI | NULL    | auto_increment |
| m_title1   | varchar(200) | YES  |     | NULL    |                |
| m_title2   | varchar(200) | YES  |     | NULL    |                |
| m_producer | varchar(100) | YES  |     | NULL    |                |
| m_grade    | varchar(30)  | YES  |     | NULL    |                |
| m_time     | int(11)      | YES  |     | NULL    |                |
| m_made     | varchar(50)  | YES  |     | NULL    |                |
| m_company  | varchar(100) | YES  |     | NULL    |                |
| m_start    | date         | YES  |     | NULL    |                |
| m_end      | date         | YES  |     | NULL    |                |
| m_site     | varchar(300) | YES  |     | NULL    |                |
| m_like     | int(11)      | YES  |     | NULL    |                |
| m_content  | text         | YES  |     | NULL    |                |
| m_poster   | varchar(300) | YES  |     | NULL    |                |
| m_genre    | varchar(300) | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
 -->
<div class="movie-wrap">
	<div class="movie-header">
		<h1>영화등록</h1>
	</div>
	
	<div class="movie-body">
		<form action="/admin/movie/insert" id="movieForm" method="post">
			<div class="movie-table-wrap">
				<table>
					<tr>
						<td>
							<label for="title_kor">제목(한글)</label>
							<input type="text" id="title_kor" name="title_kor">
						</td>
					</tr>
					<tr>
						<td>
							<label for="title_eng">제목(영문)</label>
							<input type="text" id="title_eng" name="title_eng">
						</td>
					</tr>
					<tr>
						<td>
							<label for="producer">감독</label>
							<input type="text" id="producer" name="producer">
						</td>
					</tr>
					<tr>
						<td>
							<label for="genre_check">장르</label>
							<select id="genre_select" name="genre">
								<option value="none">선택하세요</option>
								<c:forEach items="${gList}" var="g">
									<input type="checkbox" name="genre">${g.g_name}
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<label for="grade_select">관람 등급</label>
							<select id="grade_select" name="grade">
								<option value="none">선택하세요</option>
								<option value="all">전체</option>
								<option value="12-rating">12세 이상</option>
								<option value="15-rating">15세 이상</option>
								<option value="x-rated">청소년 관람불가</option>							
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<label for="time">상영시간</label>
							<input type="text" id="time" name="time">
						</td>
					</tr>
					<tr>
						<td>
							<label for="made">제작 국가</label>
							<input type="text" id="made" name="made">
						</td>
					</tr>
					<tr>
						<td>
							<label for=company>배급사</label>
							<input type="text" id="company" name="company">
						</td>
					</tr>
					<tr>
						<td>
							<label for=site>사이트</label>
							<input type="text" id="site" name="site">&nbsp;
							<input type="checkbox" id="site_check">사이트 없음
						</td>
					</tr>
					<tr>
						<td>
							<label for="start">상영 시작일</label>
							<input type="date" id="start" name="start">
							<span> ~ </span>
							<label for="end">상영 종료일</label>
							<input type="date" id="end" name="end">
						</td>
					</tr>
					<tr>
						<td>
							<label for="content">줄거리</label>
							<textarea rows="30" cols="100" id="content" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="등록" id="movieSubmit">
							<input type="button" value="test" id="test">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</div>
</body>
</html>