<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">

	*{
		color: #666666;
	}

	#viewWrap{
		margin: 0 auto; width: 100%; min-height: 600px;	
	}
	
	table{
		width: 800px;
		margin: 20px;
		border-collapse: collapse;
	}
	
	#title{
		border-top: 1px solid #b8b6aa;
		border-bottom: 1px solid #b8b6aa;
		background-color: #edebe1;
		height: 37px;
	}
	
	#content{
		margin: 20px;
	}
</style>

<div id="viewWrap" align="center">
		<table>
		<tr id="title">
			<td style="width: 34px">${notice.n_num}</td>
			<td style="width: 76px">${notice.n_cate}</td>
			<td style="width: 530px">${notice.n_title}</td>
			<td style="width: 104px">등록일 <fmt:formatDate value="${notice.n_regdate}"/></td>
			<td style="width: 56px">조회수 ${notice.n_hit}</td>
		</tr>
		<tr id="content">
			<td colspan="5">
				${notice.n_content}
			</td>
		</tr>
	</table>
	
	<button type="button" onclick="location.href='updateForm?num=${notice.n_num}'">수정</button>
	<button type="button" onclick="location.href='delete?num=${notice.n_num}'">삭제</button>
</div>























