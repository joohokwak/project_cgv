<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.2.3/jquery-confirm.min.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$.confirm({
		    title: '수행결과',
		    content: '<font color="#333"><b>${msg}</b></font>',
		    boxWidth: '400px',
		    useBootstrap: false,
		    type: 'red',
		    icon: 'icon-ok',
		    buttons: {
		        yes: function () {
					location.href='${loc}';
		        }
		    }
		});
		
	});
</script>
