var seatCount = 0;		//좌석묶음 크기 저장할 변수
var ticketCount = 0;	//총 예매 인원수 저장할 변수
var prev_a_img = 0;		//선택한 일반인 img태그 
var prev_b_img = 0;		//선택한 청소년 img태그
var choice_seat = "";	//선택된 좌석 저장할 변수
var ready_seat = "";	//좌석에 마우스 올렸을때 좌석번호 미리 저장시켜둘 변수
var check_count = 0;	//누적선택한 좌석 수 저장할 변수
var checkSeat = 0;
var tt = ""; 			//초기화했을때 인원에 대한 정보를 담아둘 변수
var sum = 0; 			//총액을 담을 변수

$(function() {
	
	$("#seat").mCustomScrollbar({theme:"rounded-dark"});
	
	// 뒤로가기(예매)
	$("#btn-left").click(function(e) {
		history.back();
	});
	
	$(".ct").on( // 일반인 / 청소년 인원수 클릭시 이미지 변화
		{"click" : function(e) {
			var i = $(this).attr("id").split("_")[1];
			
			if($(this).attr("id").split("_")[0] == "a"){ //선택된 img가 일반인 img라면
				if(prev_a_img != i && $(this).attr("src") != "/resources/images/reserve/reserve_count/select" + prev_a_img + ".jpg"){
					$("#a_"+prev_a_img).attr("src", "/resources/images/reserve/reserve_count/p" + prev_a_img + ".jpg");
					prev_a_img = i;
					$(this).attr("src", "/resources/images/reserve/reserve_count/select" + i + ".jpg");
				}
			}else{ //선택된 img가 청소년 img라면
				if(prev_b_img != i && $(this).attr("src") != "/resources/images/reserve/reserve_count/select" + prev_b_img + ".jpg"){
					$("#c_"+prev_b_img).attr("src", "/resources/images/reserve/reserve_count/p" + prev_b_img + ".jpg");
					prev_b_img = i;
					$(this).attr("src", "/resources/images/reserve/reserve_count/select" + i + ".jpg");
				}
			}
			
			// 선택된 인원수에 따라 묶음 선택 갯수 조정하기
			$.each($("input[name=seattype]"), function(i, radio){
				if((i + 1) <= (parseInt(prev_a_img) + parseInt(prev_b_img))){
					$(radio).removeAttr("disabled");
				}else{
					seatCount = 0;
					$(radio).attr("disabled", "disabled");
					$(radio).removeAttr("checked");
					$("#"+$(radio).val()).attr("src", "/resources/images/reserve/reserve_img/seat_" + (i + 1) + ".jpg");
				}
			});
			
			//총인원수 저장
			ticketCount=parseInt(prev_a_img) + parseInt(prev_b_img);
			
			ticketSeatInfo();
			
			sum = (prev_a_img * 9000) + (prev_b_img * 8000); // 일반인과 청소년 수에 따라 금액 계산
			
			
		},"mouseover" : function(e) { // 마우스가 올라왔을때 커서를 포인트로
			$(this).css("cursor", "pointer");
		}
	});
	
	$("input[name=seattype]").change(function() { //좌석묶음 radio버튼 변경시
		var check=$("input[name=seattype]:checked").val();
		$.each($("input[name=seattype]"),function(i,radio){
			var uncheck=$(radio).val();
			if(check==uncheck){
				seatCount=i+1;
				$("#"+uncheck).attr("src", "/resources/images/reserve/reserve_img/seato"+(i+1)+".jpg");
			}else{
				$("#"+uncheck).attr("src", "/resources/images/reserve/reserve_img/seat_"+(i+1)+".jpg");
			}
		});
	});
	
	
	// 결재 버튼 눌렀을때
	$("#btn_right").click(function(e) {
		if($(this).css("cursor") == "pointer"){
			// 결재선택 실행
			$("#reserveInfoForm").submit();
		}
	});
	
});

			
//하단에 선택된 인원 표시
function ticketSeatInfo(){
	
	if(parseInt(prev_a_img) > 0 && parseInt(prev_b_img) <= 0){
		str = "일반 " + prev_a_img + "명";
	}else if(parseInt(prev_b_img) > 0 && parseInt(prev_a_img) <= 0){
		str = "청소년 " + parseInt(prev_b_img) + "명";
	}else if(parseInt(prev_b_img) > 0 && parseInt(prev_a_img) > 0){
		str = "일반 " + parseInt(prev_a_img) + "명, 청소년 " + parseInt(prev_b_img) + "명";
	}
	
	tt = str;
	
	$("#rv_people").val(tt);
	
}

//좌석에 마우스 올렸을때
function seatOver(seat){
	var n=parseInt($(seat).attr("id").split(":")[0]);
	var num=parseInt($(seat).attr("id").split(":")[1]);
	
	//선택된 좌석 있는지 확인
	var c1=0;
	var c2=0;
	var c3=0;
	var c4=0;
	var check_seat=choice_seat.split(",");
	if(check_seat.length>0){
		for(var i=0;i<check_seat.length;i++){
			var check_n=parseInt(check_seat[i].split(":")[0]);
			var check_num=parseInt(check_seat[i].split(":")[1]);
			if(check_num==(num-1)&&check_n==n){
				c1=1;
			}else if(check_num==(num-2)&&check_n==n){
				c2=1;
			}else if(check_num==(num+1)&&check_n==n){
				c3=1;
			}else if(check_num==(num+2)&&check_n==n){
				c4=1;
			}
		}
	}
	
	var seatImg=$("img[name=seatImg]");
	if((parseInt(prev_a_img)+parseInt(prev_b_img))>=1&&seatCount==1){
		$(seat).attr("src","/resources/images/reserve/reserve_choice/r"+num+".jpg");
		ready_seat=n+":"+num;
	}else if((parseInt(prev_a_img)+parseInt(prev_b_img))>=2&&seatCount==2){
		if(num==4||num==18||num==22||((n-65)*22)+(num)==seatImg.length){
			if(c1==0&&$(seatImg[((n-65)*22)+(num)]).attr("src")!="/resources/images/reserve/reserve_img/seat_false.jpg"){
				$(seat).attr("src","/resources/images/reserve/reserve_choice/r"+num+".jpg");
				$(seatImg[((n-65)*22)+(num-2)]).attr("src","/resources/images/reserve/reserve_choice/r"+(num-1)+".jpg");
				ready_seat=n+":"+(num-1)+","+n+":"+num;
			}
		}else{
			if(c3==0&&$(seatImg[((n-65)*22)+(num)]).attr("src")!="/resources/images/reserve/reserve_img/seat_false.jpg"){
				$(seat).attr("src","/resources/images/reserve/reserve_choice/r"+num+".jpg");
				$(seatImg[((n-65)*22)+num]).attr("src","/resources/images/reserve/reserve_choice/r"+(num+1)+".jpg");
				ready_seat=n+":"+num+","+n+":"+(num+1);
			}
		}
	}else if((parseInt(prev_a_img)+parseInt(prev_b_img))>=3&&seatCount==3){
		if(num==1||num==5||num==19){
			if(c3==0&&c4==0&&$(seatImg[((n-65)*22)+(num)]).attr("src")!="/resources/images/reserve/reserve_img/seat_false.jpg"
				&&$(seatImg[((n-65)*22)+(num+1)]).attr("src")!="/resources/images/reserve/reserve_img/seat_false.jpg"){
				$(seat).attr("src","/resources/images/reserve/reserve_choice/r"+num+".jpg");
				$(seatImg[((n-65)*22)+(num)]).attr("src","/resources/images/reserve/reserve_choice/r"+(num+1)+".jpg");
				$(seatImg[((n-65)*22)+(num+1)]).attr("src","/resources/images/reserve/reserve_choice/r"+(num+2)+".jpg");
				ready_seat=n+":"+num+","+n+":"+(num+1)+","+n+":"+(num+2);
			}
		}else if(num==4||num==18||num==22||((n-65)*22)+(num)==seatImg.length){
			if(c1==0&&c2==0&&$(seatImg[((n-65)*22)+(num-2)]).attr("src")!="/resources/images/reserve/reserve_img/seat_false.jpg"
				&&$(seatImg[((n-65)*22)+(num-3)]).attr("src")!="/resources/images/reserve/reserve_img/seat_false.jpg"){
				$(seat).attr("src","/resources/images/reserve/reserve_choice/r"+num+".jpg");
				$(seatImg[((n-65)*22)+(num-2)]).attr("src","/resources/images/reserve/reserve_choice/r"+(num-1)+".jpg");
				$(seatImg[((n-65)*22)+(num-3)]).attr("src","/resources/images/reserve/reserve_choice/r"+(num-2)+".jpg");
				ready_seat=n+":"+(num-2)+","+n+":"+(num-1)+","+n+":"+num;
			}
		}else{
			if(c1==0&&c3==0&&$(seatImg[((n-65)*22)+(num)]).attr("src")!="/resources/images/reserve/reserve_img/seat_false.jpg"
				&&$(seatImg[((n-65)*22)+(num-2)]).attr("src")!="/resources/images/reserve/reserve_img/seat_false.jpg"){
				$(seat).attr("src","/resources/images/reserve/reserve_choice/r"+num+".jpg");
				$(seatImg[((n-65)*22)+num]).attr("src","/resources/images/reserve/reserve_choice/r"+(num+1)+".jpg");
				$(seatImg[((n-65)*22)+(num-2)]).attr("src","/resources/images/reserve/reserve_choice/r"+(num-1)+".jpg");
				ready_seat=n+":"+(num-1)+","+n+":"+num+","+n+":"+(num+1);
			}
		}
	}
}

//좌석에 마우스 뺐을때
function seatOut(seat){
	var n=parseInt($(seat).attr("id").split(":")[0]);
	var num=parseInt($(seat).attr("id").split(":")[1]);
	
	//선택된 좌석 있는지 확인
	var c1=0;
	var c2=0;
	var c3=0;
	var c4=0;
	var check_seat=choice_seat.split(",");
	if(check_seat.length>0){
		for(var i=0;i<check_seat.length;i++){
			var check_n=parseInt(check_seat[i].split(":")[0]);
			var check_num=parseInt(check_seat[i].split(":")[1]);
			if(check_num==(num-1)&&check_n==n){
				c1=1;
			}else if(check_num==(num-2)&&check_n==n){
				c2=1;
			}else if(check_num==(num+1)&&check_n==n){
				c3=1;
			}else if(check_num==(num+2)&&check_n==n){
				c4=1;
			}
		}
	}
	
	var seatImg=$("img[name=seatImg]");
	if((parseInt(prev_a_img)+parseInt(prev_b_img))>=1&&seatCount==1){
		$(seat).attr("src","/resources/images/reserve/reserve_img/"+num+".jpg");
	}else if((parseInt(prev_a_img)+parseInt(prev_b_img))>=2&&seatCount==2){
		if(num==4||num==18||num==22||((n-65)*22)+(num)==seatImg.length){
			if(c1==0&&$(seatImg[((n-65)*22)+(num)]).attr("src")!="/resources/images/reserve/reserve_img/seat_false.jpg"){
				$(seat).attr("src","/resources/images/reserve/reserve_img/"+num+".jpg");
				$(seatImg[((n-65)*22)+(num-2)]).attr("src","/resources/images/reserve/reserve_img/"+(num-1)+".jpg");
			}
		}else{
			if(c3==0&&$(seatImg[((n-65)*22)+(num)]).attr("src")!="/resources/images/reserve/reserve_img/seat_false.jpg"){
				$(seat).attr("src","/resources/images/reserve/reserve_img/"+num+".jpg");
				$(seatImg[((n-65)*22)+num]).attr("src","/resources/images/reserve/reserve_img/"+(num+1)+".jpg");
			}
		}
	}else if((parseInt(prev_a_img)+parseInt(prev_b_img))>=3&&seatCount==3){
		if(num==1||num==5||num==19){
			if(c3==0&&c4==0&&$(seatImg[((n-65)*22)+(num)]).attr("src")!="/resources/images/reserve/reserve_img/seat_false.jpg"
				&&$(seatImg[((n-65)*22)+(num+1)]).attr("src")!="/resources/images/reserve/reserve_img/seat_false.jpg"){
				$(seat).attr("src","/resources/images/reserve/reserve_img/"+num+".jpg");
				$(seatImg[((n-65)*22)+(num)]).attr("src","/resources/images/reserve/reserve_img/"+(num+1)+".jpg");
				$(seatImg[((n-65)*22)+(num+1)]).attr("src","/resources/images/reserve/reserve_img/"+(num+2)+".jpg");
			}
		}else if(num==4||num==18||num==22||((n-65)*22)+(num)==seatImg.length){
			if(c1==0&&c2==0&&$(seatImg[((n-65)*22)+(num-2)]).attr("src")!="/resources/images/reserve/reserve_img/seat_false.jpg"
				&&$(seatImg[((n-65)*22)+(num-3)]).attr("src")!="/resources/images/reserve/reserve_img/seat_false.jpg"){
				$(seat).attr("src","/resources/images/reserve/reserve_img/"+num+".jpg");
				$(seatImg[((n-65)*22)+(num-2)]).attr("src","/resources/images/reserve/reserve_img/"+(num-1)+".jpg");
				$(seatImg[((n-65)*22)+(num-3)]).attr("src","/resources/images/reserve/reserve_img/"+(num-2)+".jpg");
			}
		}else{
			if(c1==0&&c3==0&&$(seatImg[((n-65)*22)+(num)]).attr("src")!="/resources/images/reserve/reserve_img/seat_false.jpg"
				&&$(seatImg[((n-65)*22)+(num-2)]).attr("src")!="/resources/images/reserve/reserve_img/seat_false.jpg"){
				$(seat).attr("src","/resources/images/reserve/reserve_img/"+num+".jpg");
				$(seatImg[((n-65)*22)+num]).attr("src","/resources/images/reserve/reserve_img/"+(num+1)+".jpg");
				$(seatImg[((n-65)*22)+(num-2)]).attr("src","/resources/images/reserve/reserve_img/"+(num-1)+".jpg");
			}
		}
	}
}

//좌석 선택
function countSeatClick(choiceImg){
	var seatImg=$("img[name=seatImg]");
	var check_id=$(choiceImg).attr("id");
	var reset=choice_seat.split(",");
	if(reset.indexOf(check_id)!=-1){
		for(var i=0;i<reset.length;i++){
			var n=parseInt(reset[i].split(":")[0]);
			var num=parseInt(reset[i].split(":")[1]);
			$(seatImg[((n-65)*22)+(num-1)]).attr("src","/resources/images/reserve/reserve_img/"+num+".jpg");
			$(seatImg[((n-65)*22)+(num-1)]).attr("onmouseover","seatOver(this);");
			$(seatImg[((n-65)*22)+(num-1)]).attr("onmouseout","seatOut(this);");
		}
		choice_seat="";
		check_count=0;
		
	}else{
		//src에 reserve_choice가 없으면 선택 안되게함
		if($(choiceImg).attr("src").indexOf("reserve_choice")!=-1){
			check_count+=seatCount;
			//누적선택한 좌석 수가 총 선택가능좌석 수보다 작거나 같은지 판별(크면 선택안됨)
			if(check_count<=ticketCount){
				choice_seat+=ready_seat+",";
				var seat=choice_seat.split(",");
				for(var i=0;i<seat.length;i++){
					var n=parseInt(seat[i].split(":")[0]);
					var num=parseInt(seat[i].split(":")[1]);
					$(seatImg[((n-65)*22)+(num-1)]).attr("src","/resources/images/reserve/reserve_choice/r"+num+".jpg");
					$(seatImg[((n-65)*22)+(num-1)]).removeAttr("onmouseover");
					$(seatImg[((n-65)*22)+(num-1)]).removeAttr("onmouseout");
				}
				bottomSeat(choice_seat);
			}else{
				$.confirm({
				    title: '',
				    content: '<font color="#333"><b>기존에 선택하신 좌석을 취소하고<br> 새로 선택 하시겠습니까?</b></font>',
				    boxWidth: '300px',
				    useBootstrap: false,
				    type: 'red',
				    buttons: {
				        yes: function () {
				        	choice_seat+=ready_seat+",";
							//기존에 선택한 좌석 초기화
							var seat=choice_seat.split(",");
							for(var i=0;i<seat.length;i++){
								var n=parseInt(seat[i].split(":")[0]);
								var num=parseInt(seat[i].split(":")[1]);
								$(seatImg[((n-65)*22)+(num-1)]).attr("src","/resources/images/reserve/reserve_img/"+num+".jpg");
								$(seatImg[((n-65)*22)+(num-1)]).attr("onmouseover","seatOver(this);");
								$(seatImg[((n-65)*22)+(num-1)]).attr("onmouseout","seatOut(this);");
							}
							
							//새로 선택한 좌석 선택하기
							var newSeat=ready_seat.split(",");
							for(var i=0;i<newSeat.length;i++){
								var n=parseInt(newSeat[i].split(":")[0]);
								var num=parseInt(newSeat[i].split(":")[1]);
								$(seatImg[((n-65)*22)+(num-1)]).attr("src","/resources/images/reserve/reserve_choice/r"+num+".jpg");
								$(seatImg[((n-65)*22)+(num-1)]).removeAttr("onmouseover");
								$(seatImg[((n-65)*22)+(num-1)]).removeAttr("onmouseout");
							}
							
							choice_seat=ready_seat+",";
							check_count=seatCount;
							bottomSeat(choice_seat);
				        },
				        cancel: function () {
				            
				        }
				    }
				});
			}
		}
	}
}



//하단에 좌석 정보 출력
function bottomSeat(cs){
	cs=cs.split(",");
	var	text="";
	for(var i=0;i<cs.length;i++){
		if(cs[i]!=""){
			var n=String.fromCharCode(cs[i].split(":")[0]);
			if(i<cs.length-2){
				text+=" "+n+cs[i].split(":")[1]+",";
			}else{
				text+=" "+n+cs[i].split(":")[1];
			}
		}
	}
	
	// 숫자에 콤마 찍기 위한 프로타입 변경
	Number.prototype.format = function(){
	    if(this==0) return 0;
	 
	    var reg = /(^[+-]?\d+)(\d{3})/;
	    var n = (this + '');
	 
	    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
	 
	    return n;
	};
	 
	// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
	String.prototype.format = function(){
	    var num = parseFloat(this);
	    if( isNaN(num) ) return "0";
	 
	    return num.format();
	};
	
	$("#btn_right").css({"background": "url('/resources/images/reserve/tnb_buttons.png') no-repeat -150px -330px", "cursor": "pointer"});
	$("#tnb-numberInfo").html("<span>인원</span>"+tt);
	
	$("#tnb-placeholder").css({"background" : "#1d1d1c", "color": "white"});
	
	var seatSelectInfo = "<div id='lineBlock' style='position: relative; width: 5px; height: 108px; float: right; background: url(/resources/images/reserve/split.png) no-repeat right;'></div><div style='width: 150px; height: 88px; padding: 10px; color: #fff; font-weight: bold; margin: 0 auto;'>";
	seatSelectInfo += "좌석번호<span>"+text+"</span>";
	seatSelectInfo += "</div>";
	
	$("#tnb-placeholder").html(seatSelectInfo);
	
	var payInfo = "<div style='width: 150px; height: 88px; padding: 10px; color: #fff; font-weight: bold; margin: 0 auto;'>";
	payInfo += "<span style='display: inline-block; width: 60px; margin-top: 8px;'>일반</span><span>" + (prev_a_img * 9000).format() +" 원<span><br>";
	payInfo += "<span style='display: inline-block; width: 60px; margin-top: 8px;'>청소년</span><span>" + (prev_b_img * 8000).format() +" 원<span><br>";
	payInfo += "<span style='display: inline-block; width: 60px; margin-top: 8px;'>총금액</span>";
	payInfo += "<span style='font-size: 14px; color: red;'>" + sum.format() +" 원</span>";
	payInfo += "</div>";
	
	$("#paymentInfo").html(payInfo);
	
	$("#rv_pay").val(sum);
	$("#rv_seat").val(text);
//	alert("seatInfo : " + text);
	
}