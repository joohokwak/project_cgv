$(function() {
	$(".heart-box").click(function(e) {
		var m_num = $(this).next().val();
		var hBox = $(this);
		
		var flag = Number($(this).attr("data-flag"));
		
		if(flag == 0) {
			$(this).css("background", "url(/resources/images/login/sprite_icon.png) -83px -65px no-repeat");
			flag++;
			$.ajax({
				url: "/movie/likeUp?m_num="+m_num,
				dataType : "json",
				success: function(data) {
					hBox.parent().find(".like_count").text(data);
				}
			});
		}else {
			$(this).css("background", "url(/resources/images/login/sprite_icon.png) -60px -65px no-repeat");
			flag=0;
			$.ajax({
				url: "/movie/likeDown?m_num="+m_num,
				dataType : "json",
				success: function(data) {
					hBox.parent().find(".like_count").text(data);
				}
			});
		}
		
		$(this).attr("data-flag", flag);
		return false;
	});
	
	$(".btn-more-fontbold").click(function(e) {
		location.href="/movie/movieAll";
	});
	
});