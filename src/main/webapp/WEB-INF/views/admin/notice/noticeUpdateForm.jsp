<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		alert('${notice.n_cate}');
		$("#cate option").each(function(){
			if($(this).text() == '${notice.n_cate}'){
				$(this).attr("selected","selected");
			}
		});
	});
</script>
</head>
<body>
<div class="section" style="min-height: 800px">
	<div class="container">
		<form class="form-horizontal" method="post" action="/admin/notice/update">
			<div class="form-group">
				<div class="col-sm-2">
					<label for="title" class="control-label">제목</label>
				</div>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="title" name="title" value="${notice.n_title}">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-2">
					<label for="category" class="control-label">카테고리</label>
				</div>
				<div class="col-sm-2" >
					<select id="cate" name="cate">
						<option value="0">선택하세요</option>
						<option value="1">[시스템점검]</option>
						<option value="2">[극장]</option>
						<option value="3">[행사/이벤트]</option>
						<option value="4">[기타]</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-2">
					<label for="content" class="control-label">내용</label>
				</div>
				<div class="col-sm-10">
					<!-- 에디터 적용 부분 -->
					<textarea rows="30" cols="100" id="content" name="content">${notice.n_content}</textarea>				
				</div>
			</div>
			<div class="form-group text-right">
				<div class="col-sm-12">
					<input type="submit" class="btn btn-default" value="등록">
				</div>
			</div>
		</form>
		</div><!-- container -->
</div><!-- section -->
</body>
</html>