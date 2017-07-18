<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
	<link href="/resources/css/c3.css" rel="stylesheet">
	<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
	<script src="/resources/js/c3.min.js"></script>
	<script type="text/javascript">
		$(function() {
			var chart = c3.generate({
			    data: {
			        columns: [
			            ['월별매출1', ${slist}],
			            ['월별매출2', ${slist}]
			        ],
			        types: {
			        	월별매출1: 'spline',
			        	월별매출2: 'bar'
			        }
			    },
				axis: {
			        x: {
			            type: 'category',
			            categories: ['${tlist}']
			        }
		    	}
			});
		});
	
	</script>
</head>
<body>
	<div style="width: 95%; margin: 180px 0px 0px 20px;;">
		<div id="chart"></div>
	</div>
</body>
</html>