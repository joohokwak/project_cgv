$(function() {
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
			
			var validationName = false;
			var validationPw = false;
			var validationRPw = false;
			var validationId = false;
			var validationPhone = false;
			var validationEmail = false;
			
//			(validationName&&validationPw&&validationRPw&&validationId&&validationPhone&&validationEmail)
			
			//이름 체크
			var re_name = /^[가-힣]+$/;
			$(".member_data_name").keyup(function() {
				$(".member_data_name_span").css("display", "none");
				validationName = true;
				var nameStr = $(this).val();
				if(!re_name.test(nameStr)||nameStr.length<2){
					$(".member_data_name_span").css("display", "inline");
					validationName = false;
				}
			});
			
			//pw 유효성
			var re_pw = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,12}$/;
			$(".member_data_password").keyup(function() {
				$(".member_data_password_span").css("color", "black");
				validationPw = true;
				var pwStr = $(this).val();
				if(!re_pw.test(pwStr)){
					$(".member_data_password_span").css("color", "#ee6900");
					validationPw = false;
				}
			});
			
			var pwRStr;
			$(".member_data_repassword").keyup(function() {
				$(".member_data_repassword_span").css("display", "none");
				validationRPw=true;
				pwRStr = $(this).val();
				if($(".member_data_password").val()!=pwRStr){
					$(".member_data_repassword_span").css("display", "inline");
					validationRPw=false;
				}
			});
			
			//아이디 유효성
			//var re_id = /^[a-zA-Z0-9]{8,12}$/;
			var re_id = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,12}$/;
			var idStr;
			var isIdCheck = false;
			$(".member_data_id").focusout(function() {
				idStr = $.trim($(this).val());
				if(!isIdCheck){
					$(".member_data_idcheck_span").css("display", "inline");
					validationId = false;
				}
			});
			$(".member_data_id").keyup(function() {
				isIdCheck = false;
				$(".member_data_id_span").css("display", "none");
				validationId = true;
				var idStr = $(this).val();
				if(!re_id.test(idStr)){
					$(".member_data_id_span").css("display", "inline");
					validationId = false;
				}
			});
			
			
			
			
			//휴대폰 번호 focus 이동
			var re_num = /^[0-9]+$/;
			$(".member_data_phon_num1").keyup(function(){
				$(".member_data_phon_span").css("display", "none");
				validationPhone = true;
				var num1 = $(this).val();
				if((num1.charAt(0)!=0||num1.charAt(1)!=1)||(!re_num.test(num1))){
					$(".member_data_phon_span").css("display", "inline");
					validationPhone = false;
				}else if(num1.length>2){
					$(".member_data_phon_span").css("display", "none");
					validationPhone = true;
					$(".member_data_phon_num2").focus();
				}
			});
			
			$(".member_data_phon_num2").keyup(function(){
				$(".member_data_phon_span").css("display", "none");
				validationPhone = true;
				if(($(this).val().length>3)&&(re_num.test($(this).val()))){
					$(".member_data_phon_num3").focus();
				}else{
					$(".member_data_phon_span").css("display", "inline");
					validationPhone = false;
				}
				if($(".member_data_phon_num1").val().length!=3){
					$(".member_data_phon_span").css("display", "inline");
					validationPhone = false;
				}else if($(".member_data_phon_num3").val().length!=4){
					$(".member_data_phon_span").css("display", "inline");
					validationPhone = false;
				}
			});
			
			$(".member_data_phon_num3").keyup(function(){
				$(".member_data_phon_span").css("display", "none");
				validationPhone = true;
				if(($(this).val().length>3)&&(re_num.test($(this).val()))){
				}else{
					$(".member_data_phon_span").css("display", "inline");
					validationPhone = false;
				}
				if($(".member_data_phon_num1").val().length!=3){
					$(".member_data_phon_span").css("display", "inline");
					validationPhone = false;
				}else if($(".member_data_phon_num2").val().length!=4){
					$(".member_data_phon_span").css("display", "inline");
					validationPhone = false;
				}
			});
			
			
			//이메일 아이디 유효성
			var re_emailId = /^[a-zA-Z0-9_-]+$/;
			$(".email_id").keyup(function() {
				$(".member_data_email_span").css("display","none");
				validationEmail = true;
				var emailId = $(this).val();
				
				if(!re_emailId.test(emailId)){
					$(".member_data_email_span").css("display","inline");
					validationEmail = false;
				}
			})
			
			var re_domain = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])+$/;
			$(".domain_text").keyup(function() {
				$(".member_data_email_span").css("display","none");
				validationEmail = true;
				
				var emailDomain = $(this).val();
				
				if(!re_domain.test(emailDomain)){
					$(".member_data_email_span").css("display","inline");
					validationEmail = false;
				}
			})
			
			
			////////////////// 
			
			$(".submit_btn").click(function() {
				if(($(".member_data_phon_num1").val().length==0||$(".member_data_phon_num2").val().length==0)||$(".member_data_phon_num1").val().length==0){
					validationPhone=false;
				}
				if(((validationName&&validationPw)&&(validationRPw&&validationId))&&(validationPhone&&validationEmail)){
					$("#foinform").submit();
				}else{
					if(!validationName){
						alert("이름을 확인하세요.");
						$(".member_data_name").focus();
					}else if(!validationId){
						alert("아이디를 확인하세요.");
						$(".member_data_id").focus();	
					}else if(!validationPw){
						alert("비밀번호를 확인하세요.");
						$(".member_data_password").focus();	
					}else if(!validationRPw){
						alert("비밀번호를 확인하세요.");
						$(".member_data_repassword").focus();	
					}else if(!validationPhone){
						alert("휴대전화를 확인하세요.");
						$(".member_data_phon_num1").focus();	
					}else if(!validationEmail){
						alert("Email을 확인하세요.");
						$(".email_id").focus();	
					}
				};
			})
			
			
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
								validationId = true;
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