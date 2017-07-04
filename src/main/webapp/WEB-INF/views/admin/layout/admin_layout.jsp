<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<table style="width: 100%; border-spacing: 0;">
		<tr>
			<td width="230px">
				<tiles:insertAttribute name="side"/>
			</td>
			
			<td>
				<tiles:insertAttribute name="body"/>
			</td>
		</tr>
	</table>
	<tiles:insertAttribute name="footer"/>
</body>
</html>
