<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>

	<style type="text/css">
		#boardListWrap { position:relative; margin: 0 auto; width: 100%; margin-top: 70px; }
		table,td { width:980px; margin:0 auto; }
		.blist { padding-top:40px; }
		textarea { width:100%; }	

	</style>
	
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
	
<body>
	<div id="boardListWrap">
		<form method="post" id="boardForm" action="update" enctype="multipart/form-data">
			<input type= "hidden" name = "b_num" value = "${viewBoard.b_num}">
		 	<input type= "hidden" name = "b_writer" value = "${viewBoard.b_writer}">
		 	<input type= "hidden" name = "b_regdate" value = "${viewBoard.b_regdate}">
		 	<input type= "hidden" name = "b_hit" value = "${viewBoard.b_hit}">
			<table>
				<tr>
					<th style="width:100px;">작성자</th>
					<td>${viewBoard.b_writer}</td>
				</tr>
				<tr>
					<th style="width:100px;">제목</th>
					<td><input type="text" name="b_title" value="${viewBoard.b_title}"></td>
				</tr>			
				<tr>
					<th style="width:100px;">내용</th>
					<td><textarea rows="15" cols="70" id="b_content" name="b_content">${viewBoard.b_content}</textarea></td>
				</tr>				
			</table>
			<input type="reset" value="취소" >
			<input type="submit" id="boardSubmit" value="등록하기" >				
		</form>
	</div>
</body>
</html>