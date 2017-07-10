<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style type="text/css">

	#viewWrap{
		margin: 0 auto; width: 100%; min-height: 600px;	
		color: #666666;
	}
	
	.notice-table{
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
		<table class=".notice-table">
		<tr id="title">
			<td style="width: 34px">${notice.n_num}</td>
			<td style="width: 76px">${notice.n_cate}</td>
			<td style="width: 530px">${notice.n_title}</td>
			<td style="width: 104px">등록일 <fmt:formatDate value="${notice.n_regdate}"/></td>
			<td style="width: 56px">조회수 ${notice.n_hit}</td>
		</tr>
		<tr id="content">
			<td colspan="5">
				${notice.n_content }
			</td>
		</tr>
	</table>
</div>























