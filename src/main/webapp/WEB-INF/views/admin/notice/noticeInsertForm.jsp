<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/resources/css/admin/mybtn.css" />
    
<style type="text/css">
	.notice-wrap{
		position: relative;
		width: 900px;
		color: #666666;
	}
	
	.notice-header{
		position: relative;
		left: 30px;
		text-align: left; 
	}
	
	.notice-header h1{
		font-weight: bold;
		font-size: 25px;
		color: black;
	}
	
	.notice-header p{
		margin: 2px 0px;
	}
	
	.notice-body{
		position: relative;
		top: 20px;
		left: 30px; 
		width: 850px;
	}
	
	.notice-table{
		position: relative;
		width: 830px;
		border-collapse: collapse;
		margin-bottom: 20px;
	}
	
	.notice-table td{
		height: 40px;
		padding-bottom: 5px;
	}
	
	.notice-input{
		width: 144px;
		padding: 6px;
		border: 1px solid #a9a9a9;
		border-radius:4px;
	}
	
	#cate{
		padding: 5px 10px 5px 5px; 
		border-radius: 4px;
	}
</style>

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
		$("#noticeSubmit").click(function(e) {
			var check = noticeCheck();
			if(check != false){
				oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
				
				var ir1 = $("#content").val();

			    if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>')  {
			         alert("내용을 입력하세요.");
			         oEditors.getById["content"].exec("FOCUS"); //포커싱
			         return false;
			    }
				
				$("#noticeForm").submit();
			}
		});
	});
	
	function noticeCheck(){
		
		if($("#cate").val() == 0){
			alert("카테고리를 선택하세요!");
			return false;
		}
		
		if($.trim($("#title").val()) == ""){
			alert("제목을 입력하세요!");
			return false;
		}
		
		return;
	}
</script>

<div class="notice-wrap">
	<div class="notice-header">
		<h1>공지사항 등록</h1>
		<p>공지사항을 등록하는 페이지 입니다.</p>
	</div>
	<div class="notice-body">
		<form action="/admin/notice/insert" id="noticeForm" method="post">
			<table class="notice-table">
				<tr>
					<td width="90px">
						<label for="title">제목</label>
					</td>
					<td>
						<select id="cate" name="cate">
							<option value="0">카테고리</option>
							<option value="1">[시스템점검]</option>
							<option value="2">[극장]</option>
							<option value="3">[행사/이벤트]</option>
							<option value="4">[기타]</option>
						</select>
						<input type="text" id="title" name="title" class="notice-input" style="width: 590px">
					</td>
				</tr>
				<tr>
					<td style="vertical-align: text-top;">
						<label for="content">내용</label>
					</td>
					<td>
						<textarea rows="30" cols="100" id="content" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="button" id="noticeSubmit" class="my-btn" value="등록" style="margin-right: 9px;">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

