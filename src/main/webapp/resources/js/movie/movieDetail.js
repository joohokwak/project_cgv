
$(function() {
	
	var cnt = 0;
	
	$("#like").click(function(e) {
		if(cnt == 0) {
			$(this).attr("src", "/resources/images/movie/heart_red.png");
			cnt++;
			$.ajax({
				url: "/movie/likeUp?m_num=" + $("#like_num").val(),
				dataType : "json",
				success: function(data) {
					$("#like_point").text(data);
				}
			});
		}else {
			$(this).attr("src", "/resources/images/movie/heart_black.png");
			cnt = 0;
			$.ajax({
				url: "/movie/likeDown?m_num=" + $("#like_num").val(),
				dataType : "json",
				success: function(data) {
					$("#like_point").text(data);
				}
			});
		}
	});
});