
$(function() {
	
	var cnt = 0;
	
	var $rateYo = $("#rateYo").rateYo();
	
	$("#rateYo").click(function() {
		var rating = $rateYo.rateYo("rating");
		
	});
	
	$("#rateYo").rateYo().on("rateyo.change", function (e, data) {
         var rating = data.rating;
         $("#rateNumer").text(rating*2+"점").css({color: "#333"});
         // 점수 세팅하기
         $("#mr_score").val(rating);
         
         var rateText = "평점을 입력해주세요";
 		
		if(parseInt(rating * 2) != 0) {
			if(parseInt(rating * 2) < 2) {
				rateText = "괜히 봤어요";
			}
			if(parseInt(rating * 2) >= 2) {
				rateText = "기대하진 말아요";
			}
			if(parseInt(rating * 2) >= 4) {
				rateText = "무난했어요";
			}
			if(parseInt(rating * 2) >= 6) {
				rateText = "기대해도 좋아요";
			}
			if(parseInt(rating * 2) >= 8) {
				rateText = "멋진 영화였어요";
			}
		}
		
		$("#rateContent").text(rateText);
    });
	
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