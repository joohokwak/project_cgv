<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="a" value="${actor}"/>
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
		$("#actorSubmit").click(function(e) {
			
			var result = actorCheck();
			
			if(result != false){
				
				oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
				$("#actorForm").submit();
			}
			
		});
		
		loadCheck();
		clickCheckBox();
		
		
		$("#test").click(function(){
				

		});
		
		
	});
	
	
	function clickCheckBox(){
		$("#kor_name_check").change(function(){
			if($("#kor_name_check").is(":checked") == true){
				$("#kor_name").val("").attr("disabled",true);
				
			}else{
				$("#kor_name").attr("disabled",false);
			}
		});
		
		$("#eng_name_check").change(function(){
			if($("#eng_name_check").is(":checked") == true){
				$("#eng_name").val("").attr("disabled",true);
				
			}else{
				$("#eng_name").attr("disabled",false);
			}
		});
		
		$("#birth_check").change(function(){
			if($("#birth_check").is(":checked") == true){
				$("#birth").val("").attr("disabled",true);
				
			}else{
				$("#birth").attr("disabled",false);
			}
		});
		
		$("#nation_check").change(function(){
			if($("#nation_check").is(":checked") == true){
				$("#nation").val("").attr("disabled",true);
				
			}else{
				$("#nation").attr("disabled",false);
			}
		});
		
		$("#job_check").change(function(){
			if($("#job_check").is(":checked") == true){
				$("#job").val("").attr("disabled",true);
				
			}else{
				$("#job").attr("disabled",false);
			}
		});
		
		$("#edulev_check").change(function(){
			if($("#edulev_check").is(":checked") == true){
				$("#edulev").val("").attr("disabled",true);
				
			}else{
				$("#edulev").attr("disabled",false);
			}
		});
		
		$("#site_check").change(function(){
			if($("#site_check").is(":checked") == true){
				$("#site").val("").attr("disabled",true);
				
			}else{
				$("#site").attr("disabled",false);
			}
		});
		
		$("#biography_check").change(function(){
			if($("#site_check").is(":checked") == true){
				$("#content").val("").attr("disabled",true);
				
			}else{
				$("#content").attr("disabled",false);
			}
		});
	}
	
	function actorCheck(){
		if($("#kor_name_check").is(":checked") == false && $.trim($("#kor_name").val()) == ""){
			alert("이름(한글)을 입력하세요!");
			$("#kor_name").focus();
			return false;
		}
		
		if($("#eng_name_check").is(":checked") == false && $.trim($("#eng_name").val()) == ""){
			alert("이름(영문)을 입력하세요!");
			$("#eng_name").focus();
			return false;
		}
		
		if($("#birth_check").is(":checked") == false && $.trim($("#birth").val()) == ""){
			alert("출생일을 입력하세요!");
			$("#birth").focus();
			return false;
		}
		
		if($("#nation_check").is(":checked") == false && $.trim($("#nation").val()) == ""){
			alert("국적 입력하세요!");
			$("#nation").focus();
			return false;
		}
		
		if($("#job_check").is(":checked") == false && $.trim($("#job").val()) == ""){
			alert("국적 입력하세요!");
			$("#job").focus();
			return false;
		}
		
		if($("#edulev_check").is(":checked") == false && $.trim($("#edulev").val()) == ""){
			alert("국적 입력하세요!");
			$("#edulev").focus();
			return false;
		}
		
		if($("#site_check").is(":checked") == false && $.trim($("#site").val()) == ""){
			alert("사이트를 입력하세요!");
			$("#site").focus();
			return false;
		}
		return true;
	}
	
	
	function loadCheck(){
		if($("#kor_name_check").is(":checked") == false && $.trim($("#kor_name").val()) == ""){
			$("#kor_name_check").attr("checked",true);
			$("#kor_name").attr("disabled",true);
		}
		
		if($("#eng_name_check").is(":checked") == false && $.trim($("#eng_name").val()) == ""){
			$("#eng_name_check").attr("checked",true);
			$("#eng_name").attr("disabled",true);
		}
		
		if($("#birth_check").is(":checked") == false && $.trim($("#birth").val()) == ""){
			$("#birth_check").attr("checked",true);
			$("#birth").attr("disabled",true);
		}
		
		if($("#nation_check").is(":checked") == false && $.trim($("#nation").val()) == ""){
			$("#nation_check").attr("checked",true);
			$("#nation").attr("disabled",true);
		}
		
		if($("#job_check").is(":checked") == false && $.trim($("#job").val()) == ""){
			$("#job_check").attr("checked",true);
			$("#job").attr("disabled",true);
		}
		
		if($("#edulev_check").is(":checked") == false && $.trim($("#edulev").val()) == ""){
			$("#edulev_check").attr("checked",true);
			$("#edulev").attr("disabled",true);
		}
		
		if($("#site_check").is(":checked") == false && $.trim($("#site").val()) == ""){
			$("#site_check").attr("checked",true);
			$("#site").attr("disabled",true);
		}
		return true;
	}
	
	
</script>
</head>
<body>
<div id="wrap">
	<div class="admin-header">
		<h1>배우 등록</h1>
		<p>배우 등록하는 페이지</p>		
	</div>
	<form action="/admin/actor/update" method="post" id="actorForm">
		<input type="hidden" name="num" value="${a.a_num }">
		<div class="admin-body">
			<table>
				<tr>
					<td></td>
					<td>내용없음</td>
				</tr>
				<tr>
					<td>
						<label for="kor_name">이름(한글)</label>
						<input type="text" id="kor_name" name="kor_name" value="${a.a_kor_name}">
					</td>
					<td>
						<input type="checkbox" id="kor_name_check">
					</td>
				</tr>
				<tr>
					<td>
						<label for="eng_name">이름(영문)</label>
						<input type="text" id="eng_name" name="eng_name" value="${a.a_eng_name}">
					</td>
					<td>
						<input type="checkbox" id="eng_name_check">
					</td>
				</tr>
				<tr>
					<td>
						<label for="birth">출생</label>
						<input type="date" id="birth" name="birth" placeholder="생년월일 8글자를 입력하세요('-'제외)" value="${a.a_birth}">
					</td>
					<td>
						<input type="checkbox" id="birth_check">
					</td>
				</tr>
				<tr>
					<td>
						<label for="nation">국적</label>
						<input type="text" id="nation" name="nation" value="${a.a_nation}">
					</td>
					<td>
						<input type="checkbox" id="nation_check">
					</td>
				</tr>
				<tr>
					<td>
						<label for="job">직업</label>
						<input type="text" id="job" name="job" value="${a.a_job}">
					</td>
					<td>
						<input type="checkbox" id="job_check">
					</td>
				</tr>
				<tr>
					<td>
						<label for="edulev">학력</label>
						<input type="text" id="edulev" name="edulev" value="${a.a_edulev}">
					</td>
					<td>
						<input type="checkbox" id="edulev_check">
					</td>
				</tr>
				<tr>
					<td>
						<label for="site">사이트</label>
						<input type="text" id="site" name="site" value="${a.a_site}">
					</td>
					<td>
						<input type="checkbox" id="site_check">
					</td>
				</tr>
				<tr>
					<td>
						<label for="content">바이오그래피</label>
						<textarea rows="30" cols="100" id="content" name="content">${a.a_biography}</textarea>
					</td>
					<td>
						<input type="checkbox" id="biography_check">
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="등록" id="actorSubmit">
						<input type="button" value="test" id="test">
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
