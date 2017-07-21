<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/admin/mybtn.css">
<style type="text/css">
	.actor-wrap{
		position: relative;
		width: 900px;
		margin: 0 auto;
		color: #666666;
	}
	
	.actor-header{
		position: relative;
		text-align: left; 
	}
	
	.actor-header h1{
		font-weight: bold;
		font-size: 25px;
		color: black;
	}
	
	.actor-header p{
		margin: 2px 0px;
	}
	
	.actor-body{
		position: relative;
		width: 850px;
	}
	
	.actor-table{
		position: relative;
		margin-top: 20px;
		width: 830px;
		border-collapse: collapse;
		margin-bottom: 20px;
	}
	
	
	.actor-input{
		width: 144px;
		padding: 5px;
		border-style: none;
		border: 1px solid #a9a9a9;
		border-radius:4px;
	}
	
	.actor-table td{
		height: 30px;
	}
	
	
	#edulev{
		width: 200px;
	}
	
	#site{
		width: 250px;
	}
</style>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	var oEditors = [];
	var classCnt = 1;

	$(function() {
		
		$("#actor_menu").css({
			background : "#343132",
			color: "#fff"		
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
		$("#actorSubmit").click(function(e) {
			
			var result = actorCheck();
			
			if(result != false){
				
				oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
				$("#actorForm").submit();
			}
			
		});
		
		clickCheckBox();
		
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
</script>
<div class="actor-wrap">
	<div class="actor-header">
		<h1>배우 등록</h1>
		<p>배우의 정보를 등록하는 페이지 입니다.</p>
		<p>입력할 내용이 없으면 체크(<i class="fa fa-check" aria-hidden="true"></i>)해주세요.</p>		
	</div>
	<form action="/admin/actor/insert" method="post" id="actorForm">
		<div class="actor-body">
			<div class="admin-body">
				<table class="actor-table">
					<tr>
						<td width="90px">
							<label for="kor_name">이름(한글)</label>
						</td>
						<td width="730px">
							<input type="text" id="kor_name" name="kor_name" class="actor-input">
						</td>
						<td>
							<input type="checkbox" id="kor_name_check">
						</td>
					</tr>
					<tr>
						<td>
							<label for="eng_name">이름(영문)</label>
						</td>
						<td>
							<input type="text" id="eng_name" name="eng_name" class="actor-input">
						</td>
						<td>
							<input type="checkbox" id="eng_name_check">
						</td>
					</tr>
					<tr>
						<td>
							<label for="birth">출생</label>
						</td>
						<td>
							<input type="date" id="birth" name="birth" placeholder="생년월일 8글자를 입력하세요('-'제외)" class="actor-input">
						</td>
						<td>
							<input type="checkbox" id="birth_check">
						</td>
					</tr>
					<tr>
						<td>
							<label for="nation">국적</label>
						</td>
						<td>
							<input type="text" id="nation" name="nation" class="actor-input">
						</td>
						<td>
							<input type="checkbox" id="nation_check">
						</td>
					</tr>
					<tr>
						<td>
							<label for="job">직업</label>
						</td>
						<td>
							<input type="text" id="job" name="job" class="actor-input">
						</td>
						<td>
							<input type="checkbox" id="job_check">
						</td>
					</tr>
					<tr>
						<td>
							<label for="edulev">학력</label>
						</td>
						<td>
							<input type="text" id="edulev" name="edulev" class="actor-input">
						</td>
						<td>
							<input type="checkbox" id="edulev_check">
						</td>
					</tr>
					<tr>
						<td>
							<label for="site">사이트</label>
						</td>
						<td>
							<input type="text" id="site" name="site" class="actor-input">
						</td>
						<td>
							<input type="checkbox" id="site_check">
						</td>
					</tr>
					<tr>
						<td style="vertical-align: text-top;">
							<label for="content" style="padding-bottom: 20px">바이오그래피</label>
						</td>
						<td colspan="2" style="background: #fff;">
							<textarea rows="30" cols="100" id="content" name="content" style="width: 100%"></textarea>
						</td>
					</tr>
					<tr style="margin: 20px 0px" style="padding-top: 10px">
						<td colspan="3" align="right">
							<button type="button" class="my-btn" onclick="location.href='/admin/actor/list'"><span>목록</span></button>
							<input type="button" value="등록" id="actorSubmit" class="my-btn">
						</td>
					</tr>
				</table>
			</div>
		</div><!-- body -->
	</form>
</div>
