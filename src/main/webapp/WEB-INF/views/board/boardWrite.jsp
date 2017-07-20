<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/event/eventPage.css">
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

	
	<script type="text/javascript">
	var oEditors = [];
	var classCnt = 1;

	$(function() {
		// 에디터
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "b_content",
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
		$("#boardSubmit").click(function(e) {
			oEditors.getById["b_content"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#boardForm").submit();
		});
		
			
		
		
		
		
	});
	</script>
</head>
<body>
	<div id="boardWriteWrap">
		<div class="list_title">
			<h2 class="sub_title">이벤트&컬쳐</h2>
			<p>CGV의 이벤트와 각종 문화소식을 확인할 수 있는 게시판입니다.</p>			
		</div>		
		<div class="write_table">
			<p class="table_info">체크(<em><img src="/resources/images/event/img_icon_redstar.jpg"></em>)된 항목은 필수 입력 사항입니다.</p>
			<form method="post" id="boardForm" action="write" enctype="multipart/form-data">
				<input type= "hidden" name = "id" value = "${member.id}">
				<table>
					<colgroup>
						<col style="width:140px;">
						<col style="width:400px;">
					</colgroup>
					<tr>
						<th scope="row">작성자<em><img src="/resources/images/event/img_icon_redstar2.gif"></em></th>
						<td colspan="3"><input type="hidden" name="b_writer" value="${member.name}">${member.name}</td>
					</tr>
					<tr>
						<th scope="row">제목<em><img src="/resources/images/event/img_icon_redstar2.gif"></em></th>
						<td colspan="3"><input type="text" name="b_title" class="btitle" style="width:810px;"></td>
					</tr>			
					<tr>
						<th scope="row">내용<em><img src="/resources/images/event/img_icon_redstar2.gif"></em></th>
						<td colspan="3"><textarea rows="15" cols="70" id="b_content" name="b_content" class="bcontent" style="width:820px;"></textarea></td>
					</tr>				
				
				</table>
				<input type="reset" value="취소" class="btn_cancel">
				<input type="submit" id="boardSubmit" value="등록하기" class="btn_write">				
			</form>
		</div>
	</div>
</body>
</html>