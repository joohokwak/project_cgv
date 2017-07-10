
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
	
	// 글자수 바이트로 체크
	$("textarea[name='mr_content']").keyup(function(e) {
		var mr_content =  $(this).val();
		var byteLength = calByte.getByteLength(mr_content);
		
		$(this).val(calByte.cutByteLength(mr_content, 150));		
		
		$("#movie-reply-byte").text(byteLength + "/150");
		
	});
	
	// 리플 등록 버튼 클릭
	$("#reply-content-btn").click(function(e) {
		$("#mrInsert").submit();
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


var calByte = {
	getByteLength : function(s) {

		if (s == null || s.length == 0) {
			return 0;
		}
		var size = 0;

		for ( var i = 0; i < s.length; i++) {
			size += this.charByteSize(s.charAt(i));
		}

		return size;
	},
		
	cutByteLength : function(s, len) {

		if (s == null || s.length == 0) {
			return "";
		}
		var size = 0;
		var rIndex = s.length;

		for ( var i = 0; i < s.length; i++) {
			size += this.charByteSize(s.charAt(i));
			if( size == len ) {
				rIndex = i + 1;
				break;
			} else if( size > len ) {
				rIndex = i;
				break;
			}
		}

		return s.substring(0, rIndex);
	},

	charByteSize : function(ch) {

		if (ch == null || ch.length == 0) {
			return 0;
		}

		var charCode = ch.charCodeAt(0);

		if (charCode <= 0x00007F) {
			return 1;
		} else if (charCode <= 0x0007FF) {
			return 2;
		} else if (charCode <= 0x00FFFF) {
			return 3;
		} else {
			return 4;
		}
	}
};
