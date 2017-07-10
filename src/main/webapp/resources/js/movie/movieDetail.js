
$(function() {
	
	var cnt = 0;
	var rating = 0;
	
	var $rateYo = $("#rateYo").rateYo();
	
	$("#rateYo").click(function() {
		var rating = $rateYo.rateYo("rating");
		
	});
	
	$("#rateYo").rateYo().on("rateyo.change", function (e, data) {
         rating = data.rating;
         $("#rateNumer").text(rating*2+"점").css({color: "#333"});
         // 점수 세팅하기
         $("#mr_score").val(rating*2);
         
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
		var mr_content = $.trim($("textarea[name='mr_content']").val());
		if(rating > 0 && mr_content.length > 0) {
			$.ajax({
				url: "/member/loginCheck",
				type: "post",
				dataType: "text",
				success: function(data) {
					if(data == "login") {
						$("#mrInsert").submit();
					}else if(data == "unlogin") {
						$("html, body").stop().animate({scrollTop : '1200px'});
						$("#loginDiv").css({display: "block"});
						$("#movieDetailWrap").prop('disabled', true).css({"pointer-events": "none", opacity: "0.5"});
					}
				}
			});
		}else {
			$.alert({
				title: '',
			    content: '<font color="#333"><b>평점과 내용을 모두 입력 해주세요</b></font>',
			    boxWidth: '400px',
			    useBootstrap: false,
			    type: 'red'
			});
		}
		
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
	
	// 로그인창 닫기 버튼
	$("#btn_close_x").click(function(e) {
		$("#loginDiv").css({display: "none"});
		$("#movieDetailWrap").prop('disabled', false).css({"pointer-events": "auto", opacity: "1"});
	});
	
	// 비밀번호창에서 엔터키 적용
	$("#loginDivPw").keyup(function(e) {
		if(e.keyCode == 13) {
			$("#login_bd_btn").click();
		}
	});
	
	// 로그인 버튼 클릭
	$("#login_bd_btn").click(function(e) {
		var divId = $.trim($("#loginDivId").val());
		var divPw = $.trim($("#loginDivPw").val());
		
		if(divId.length > 0 && divPw.length >0) {
			$.ajax({
				url : "/member/reserveLogin",
				type : "post",
				data : {"id": divId, "pass":divPw},
				dataType : "json",
				success: function(data) {
					if(data.result == 'success') {
						$("#mrInsert").submit();
					}else {
						$.alert({
							title: '',
						    content: '<font color="#333"><b>아이디 또는 비밀번호를 확인하세요</b></font>',
						    boxWidth: '300px',
						    useBootstrap: false,
						    type: 'red'
						});
					}
				}
			});
		}
	});
	
	// 삭제 버튼
	$(".mr_btn1").click(function(e) {
		var m_num = $(this).attr("data-mnum");
		var mr_num = $(this).find("#mr_num").val();
		
		$.confirm({
		    title: '한줄평 삭제!',
		    content: '해당 평을 삭제 하시겠습니까?',
		    boxWidth: '300px',
		    useBootstrap: false,
		    type: 'red',
		    icon: 'icon-remove',
		    buttons: {
		        삭제: function () {
		            location.href="/movie/mrDelete?m_num="+m_num+"&mr_num="+mr_num;
		        },
		        취소: function () {
		            
		        }
		    }
		});
		
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


