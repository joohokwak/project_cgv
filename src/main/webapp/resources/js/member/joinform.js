$(function() {
			$(".member_data_name").focus();
			var toDay = new Date();
			var year  = toDay.getFullYear();
			var month = (toDay.getMonth()+1);
			var day   = toDay.getDate();
			var str = "";
			for(var i=year;i>(year-100);i--){
				str+="<option value="+i+">"+i+"</option>";	
			}
			$(".birthdayYear").append(str);
			str="";
			for(var i=1;i<13;i++){
				if(i<10){
					str+="<option value='0"+i+"'>0"+i+"</option>";
				}else{
					str+="<option value='"+i+"'>"+i+"</option>";
				}
			}
			$(".birthdayMonth").append(str);
			str="";
			
			for(var i=1;i<((new Date( year, month, 0)).getDate())+1;i++){
					if(i<10){
						str+="<option value='0"+i+"'>0"+i+"</option>";
					}else{
						str+="<option value='"+i+"'>"+i+"</option>";
					}
				}
			
			$(".birthdayDay").append(str);
			str="";
			$(".birthdayMonth").click(function () {
				$(".birthdayDay").empty();
				str="";
				var selectYear = $(".birthdayYear").val();
				var selectMonth =$(".birthdayMonth").val();
				
				var lastDay = ( new Date( selectYear, selectMonth, 0) ).getDate();
				
				for(var i=1;i<lastDay+1;i++){
					if(i<10){
						str+="<option value="+i+">0"+i+"</option>";
					}else{
						str+="<option value="+i+">"+i+"</option>";
					}
				}
				$(".birthdayDay").append(str);
			});
			
			
			
			var domain = ["직접입력 ","naver.com","nate.com","gmail.com","yahoo.com","daum.net"];
			
			str="";
			for(var count=0; count < domain.length; count++){
				str+="<option value='"+domain[count]+"'>"+domain[count]+"</option>";
			};
			
			$(".email_domain").append(str);
			
			$(".email_domain").change(function(e) {
				$(".domain_text").val($(this).val());
			});
			
			///////////////////////////////////////////////////////////////
			
			//이름 체크
			var re_name = /^[가-힣]+$/;
			$(".member_data_name").focusout(function(e) {
				var nameStr = $(this).val();
				if(!re_name.test(nameStr)||nameStr.length<2){
					$(this).focus();
				}
			});
			$(".member_data_name").keyup(function() {
				$(".member_data_name_span").css("display", "none");
				var nameStr = $(this).val();
				if(!re_name.test(nameStr)||nameStr.length<2){
					$(".member_data_name_span").css("display", "inline");
				}
			});
			
			
			
			
			//pw 유효성
			var re_pw = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,12}$/;
			$(".member_data_password").focusout(function(e) {
				var pwStr = $(this).val();
				if($(".member_data_repassword").focus){
					$(".member_data_repassword").focus();
				}else{
					$(".member_data_password").focus();
				}
				if(!re_pw.test(pwStr)){
					$(this).focus;
				}
			});
			$(".member_data_password").keyup(function() {
				$(".member_data_password_span").css("color", "black");
				var pwStr = $(this).val();
				if(!re_pw.test(pwStr)){
					$(".member_data_password_span").css("color", "#ee6900");
				}
			});
			
			var pwRStr;
			$(".member_data_repassword").keyup(function() {
				$(".member_data_repassword_span").css("display", "none");
				pwRStr = $(this).val();
				if($(".member_data_password").val()!=pwRStr){
					$(".member_data_repassword_span").css("display", "inline");
				}
			});
			$(".member_data_repassword").focusout(function() {
				if($(".member_data_password").val()!=pwRStr){
					if($(".member_data_password").focus){
						$(".member_data_password").focus();
					}else{
						$(".member_data_repassword").focus();
					}
				}
			});
			//아이디 유효성
			var re_id = /^[a-zA-Z0-9]{8,12}$/;
			var idStr;
			var isIdCheck = false;
			$(".member_data_id").focusout(function() {
				idStr = $.trim($(this).val());
				if(!re_id.test(idStr)){
					$(this).focus();
				}else if(!isIdCheck){
					$(".member_data_idcheck_span").css("display", "inline");
					$(this).focus();
				}
			});
			$(".member_data_id").keyup(function() {
				isIdCheck = false;
				$(".member_data_id_span").css("display", "none");
				var idStr = $(this).val();
				if(!re_id.test(idStr)){
					$(".member_data_id_span").css("display", "inline");
				}
			});
			
			//휴대폰 번호 focus 이동
			var re_num = /^[0-9]+$/;
			var num1focus = false;
			$(".member_data_phon_num1").keyup(function(){
				$(".member_data_phon_span").css("display", "none");
				num1focus = true;
				var num1 = $(this).val();
				$(".member_data_phon_span").css("display", "inline");
				if((num1.charAt(0)!=0||num1.charAt(1)!=1)||(!re_num.test(num1))){
					$(".member_data_phon_span").css("display", "inline");
					num1focus = false;
				}else if(num1.length>2){
					$(".member_data_phon_span").css("display", "none");
					$(".member_data_phon_num2").focus();
				}
			});
			
			$(".member_data_phon_num1").focusout(function() {
				if(!num1focus){
					$(this).focus();
				}
			}); 
			
			var num2focus = false;
			$(".member_data_phon_num2").keyup(function(){
				$(".member_data_phon_span").css("display", "none");
				num2focus = true;
				if(!$(".member_data_phon_num1").val()){
					$(".member_data_phon_num2").val("");
					$(".member_data_phon_num1").focus();
				}
				if(($(this).val().length>3)&&(re_num.test($(this).val()))){
					$(".member_data_phon_num3").focus();
				}else{
					$(".member_data_phon_span").css("display", "inline");
					num2focus = false;
				}
			});
			$(".member_data_phon_num2").focusout(function() {
				if(!num2focus){
					$(this).focus();
				}
			}); 
			
			var num3focus = false;
			$(".member_data_phon_num3").keyup(function(){
				$(".member_data_phon_span").css("display", "none");
				num3focus = true;
				if(!$(".member_data_phon_num2").val()){
					if(!$(".member_data_phon_num1").val()){
						$(".member_data_phon_num3").val("");
						$(".member_data_phon_num1").focus();
					}else{
						$(".member_data_phon_num3").val("");
						$(".member_data_phon_num2").focus();
					}
				}
				if(($(this).val().length>3)&&(re_num.test($(this).val()))){
				}else{
					$(".member_data_phon_span").css("display", "inline");
					num3focus = false;
				}
			});
			
			$(".member_data_phon_num3").focusout(function() {
				if(!num3focus){
					$(this).focus();
				}
			}); 
			
			//이메일 아이디 유효성
			var re_emailId = /^[a-zA-Z0-9_-]+$/;
			var emailIdfocus = false;
			$(".email_id").keyup(function() {
				$(".member_data_email_span").css("display","none");
				emailIdfocus = true;
				var emailId = $(this).val();
				
				if(!re_emailId.test(emailId)){
					$(".member_data_email_span").css("display","inline");
					emailIdfocus = false;
				}
			})
			
			$(".email_id").focusout(function() {
				if(!emailIdfocus){
					$(this).focus();
				}
			})
			
			var re_domain = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])+$/;
			var emailDomainfocus = false;
			$(".domain_text").keyup(function() {
				$(".member_data_email_span").css("display","none");
				emailDomainfocus = true;
				
				if(!$(".email_id").val()){
					$(".domain_text").val("");
					$(".email_id").focus();
				}
				
				var emailDomain = $(this).val();
				
				if(!re_domain.test(emailDomain)){
					$(".member_data_email_span").css("display","inline");
					emailDomainfocus = false;
				}
			})
			
			$(".domain_text").focusout(function() {
				if(!emailDomainfocus){
					$(this).focus();
				}
			});
			
			
			////////////////////
			$(".id_check_btn").click(function() {
				if(re_id.test(idStr)&&idStr.length>0){
					$.ajax({
						url:"/member/idCheck",
						type: "post",
						data: {"id": $.trim($(".member_data_id").val())},
						dataType: "text",
						success: function(data){
							if(data=="0"){
								//사용가능
								isIdCheck = true;
								$(".member_data_idcheck_span").css("display","none")
								$.alert({
								    useBootstrap: false,
								    title: '아이디 중복 여부',
									content: '사용 가능',
								    boxWidth: '300px'
								});
							}else{
								//사용불가
								$(".member_data_id").val("");
								$(".member_data_id").focus();
								$.alert({
								    useBootstrap: false,
									 title: '아이디 중복 여부',
									content: '사용 불가 , 다시 입력해 주세요.',
								    boxWidth: '300px'
								});
							}
						}
	
					});
				}
			});
	});