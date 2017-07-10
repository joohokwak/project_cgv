<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<div>
		<form action="/admin/actor/insert">		
			<div >
				<label for="name">이름 : </label>
				<input type="text" id="name" name="name">
			</div>
			<div>
				<label for="birth">출생 : </label>
				<!-- 생년월일 넣자 -->
			</div>
			<div>
				<!-- db table에 컬럼 없으니 추가하자 -->
				<label for="job">직업 : </label>
				<input type="text" id="job" name="job">
			</div>
			<div>
				<label for="">학력</label>
				<input type="text">
			</div>
			<div>
				<label for="site">사이트</label>
				<input type="text" id="site" name="site">
			</div>
			<div>
				<label for="movie">영화</label>
				<select id="movie">

				</select>
			</div>			
			
			<div>
				<input type="submit" value="등록">
			</div>
		</form>
	</div>
</div>


</body>
</html>