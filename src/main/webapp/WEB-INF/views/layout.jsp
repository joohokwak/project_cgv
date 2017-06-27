<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>영화 그 이상의 감동 CGV</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<style type="text/css">
		* {
			margin: 0 auto; background: #fefcef;
		}
	</style>
</head>
<body>
	<div style="width: 100%; margin: 0 auto;">
		<table style="width: 100%; border-spacing: 0;">
			<tr>
				<td>
					<tiles:insertAttribute name="header"/>
				</td>
			</tr>
			
			<tr>
				<td>
					<div style="min-height: 700px;">
						<tiles:insertAttribute name="body"/>
					</div>
				</td>
			</tr>
			
			<tr>
				<td>
					<tiles:insertAttribute name="footer"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>