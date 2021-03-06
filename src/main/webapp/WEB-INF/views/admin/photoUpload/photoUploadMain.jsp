<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/resources/css/admin/photo/photo.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/admin/mybtn.css" />
<style type="text/css">
	.photo-wrap{
		position: relative;
		width: 800px;;
		margin: 0 auto;
		color: #666666;
	}
	
	.photo-header{
		position: relative;
	}
	
	.photo-header h1{
		font-weight: bold;
		font-size: 25px;
		color: black;
	}
	
	.photo-header p{
		font-size: 12px;
	}
	
	.photo-body{
		position: relative;
		margin-top: 20px;
		width: 800px;
	}
	
	
	#otpGroup button{
		margin-right: 20px;
	}
	
	#infoList{
		width: 800px;
		min-height: 50px;
	}

	.info{
		display: inline-block;
		margin: 10px auto;
		padding: 5px; 
		width: 170px;
		text-align: center;
		cursor: pointer;
		background-color: #fdfcf0;
	}
	
	.info-click{
		display: inline-block;
		margin: 10px auto;
		padding: 5px; 
		width: 170px;
		text-align: center;
		cursor: pointer;
		
		background-color: black;
		font-weight: bold;
		color: white;
	}
	
	.info:hover{
		background-color: black;
		font-weight: bold;
		color: white;
	}
	
	

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

    $(function(){
    	
    	$("#photo_menu").css({
    		background : "#343132",
    		color: "#fff"		
    	});
    	
    	$("#stealcut_del_btn").click(function(){
    		
    		var s_num = $("#num").val();
    		var opt = $("#option").val();
    		
    		if(opt != "스틸컷"){
    			alert("스틸컷을 선택해주세요!");
    			return false;
    		}
    		
    		$.ajax({
    			url: "/admin/photo/stealCutDelete?num="+s_num,
    			type: "GET",
    			success: function(){
    				alert("정상적으로 처리되었습니다.");
    			},
    			error: function(){
    				alert("실패하였습니다.");
    			}
  
    		});
    	});
    	
    	 var objDragAndDrop = $(".dragAndDropDiv");
         
         $(document).on("dragenter",".dragAndDropDiv",function(e){
             e.stopPropagation();
             e.preventDefault();
             $(this).css('border', '2px solid #0B85A1');
         });
         
         $(document).on("dragover",".dragAndDropDiv",function(e){
             e.stopPropagation();
             e.preventDefault();
         });
         
         $(document).on("drop",".dragAndDropDiv",function(e){
			$(this).css('border', '2px dotted #0B85A1');
				e.preventDefault();
				if($("#option").val() == "" || $("#num").val() == ""){
					alert("옵션을 선택하세요!");
					return false;
				}else{
					var files = e.originalEvent.dataTransfer.files;
					var opt = handleFileUpload(files,objDragAndDrop);
				}
		 });
          
         $(document).on('dragenter', function (e){
             e.stopPropagation();
             e.preventDefault();
         });
         
         $(document).on('dragover', function (e){
           e.stopPropagation();
           e.preventDefault();
           objDragAndDrop.css('border', '2px dotted #0B85A1');
         });
         
         $(document).on('drop', function (e){
             e.stopPropagation();
             e.preventDefault();
         });
          
         function handleFileUpload(files,obj){
	         $("#fileUpload").nextAll().remove();
	         
	         if($("#option").val() != "스틸컷" && files.length>1){
	        	 alert("하나의 이미지 파일만 업로드 가능합니다!");
	        	 return false;
	         }
	          
	         if(files.length != 0){
				 for(var i = 0; i < files.length; i++){
					 var ext = files[i].name.split('.').pop().toLowerCase();
					 if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
						 alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
						 return false;
				 	 }
				 }
			 }
			 
			 for (var i = 0; i < files.length; i++) 
			 {
				 var fd = new FormData();
				 fd.append('file', files[i]);
				 var status = new createStatusbar(obj); //Using this we can set progress.
				 status.setFileNameSize(files[i].name,files[i].size);
				 sendFileToServer(fd,status);
			 }
			 
         }
          
         var rowCount=0;
         function createStatusbar(obj){
             rowCount++;
             var row="odd";
             if(rowCount %2 ==0) row ="even";
             
             this.statusbar = $("<div class='statusbar "+row+"'></div>");
             this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
             this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
             this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
             this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
              
             obj.after(this.statusbar);
           
             this.setFileNameSize = function(name,size){
                 var sizeStr="";
                 var sizeKB = size/1024;
                 if(parseInt(sizeKB) > 1024){
                     var sizeMB = sizeKB/1024;
                     sizeStr = sizeMB.toFixed(2)+" MB";
                 }else{
                     sizeStr = sizeKB.toFixed(2)+" KB";
                 }
                 this.filename.html(name);
                 this.size.html(sizeStr);
             }
              
             this.setProgress = function(progress){       
                 var progressBarWidth =progress*this.progressBar.width()/ 100;  
                 this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                 if(parseInt(progress) >= 100)
                 {
                     this.abort.hide();
                 }
             }
              
             this.setAbort = function(jqxhr){
                 var sb = this.statusbar;
                 this.abort.click(function()
                 {
                     jqxhr.abort();
                     sb.hide();
                 });
             }
         }
          
         function sendFileToServer(formData,status)
         {
        	 //xhr : formData는 console.log로 확인이 안돼서 사용하는 놈.
        	 formData.append('option',$("#option").val());
        	 formData.append('num',$("#num").val());
             var uploadURL = "/admin/photo/upload"; //Upload URL
             var extraData ={}; //Extra Data.
             var jqXHR=$.ajax({
                     xhr: function() {
                     var xhrobj = $.ajaxSettings.xhr();
                     if (xhrobj.upload) {
                             xhrobj.upload.addEventListener('progress', function(event) {
                                 var percent = 0;
                                 var position = event.loaded || event.position;
                                 var total = event.total;
                                 if (event.lengthComputable) {
                                     percent = Math.ceil(position / total * 100);
                                 }
                                 //Set progress
                                 status.setProgress(percent);
                             }, false);
                         }
                     return xhrobj;
                 },
                 url: uploadURL,
                 type: "POST",
                 contentType:false,//file전송시 필수
                 processData: false,//file전송시 필수
                 cache: false,
                 data: formData,
                 success: function(data){
                     status.setProgress(100);
                     //$("#status1").append("File upload Done<br>");           
                 }
             }); 
             status.setAbort(jqXHR);
         }    	
         
         $("#otpGroup button").click(function(){
        	var opt = $.trim($(this).text());
        	var list = $("#infoList");
        	$("#option").val(opt);
        	$("#num").val("");
        	list.html("");
        	$.ajax({
        		url : "/admin/photo/infoList",
        		type : "post",
        		data : {
        			opt : opt
        		},
        		dataType : "json",
        		success : function(data){
        			
        			//table을 그리자
					$(data).each(function(i){
						var infoDiv = $("<span>");
						if(opt == "배우"){
							infoDiv.attr("class","info").data("num",this.a_num);
							//infoDiv.text(this.a_kor_name + "(" + this.a_eng_name + ")");
							infoDiv.text(this.a_kor_name);
						}else{
							infoDiv.attr("class","info").data("num",this.m_num);
							infoDiv.text(this.m_title1);	
						}
        				
						infoDiv.appendTo("#infoList");
					});
        			
					$(".info").click(function(e) {
						$("#num").val($(this).data("num"));

						
// 						$("#infoList span").css({
// 							background: "none",
// 							color: "#666"
// 						});
						
						
// 						$(this).css({
// 							background: "black",
// 							color: "white"
// 						});
						
						$("#infoList span").removeClass();
						$("#infoList span").addClass("info");
						
						$(this).addClass("info-click");

								
					});//click event
        		}
        	});
         });
    });///////////////////////////////////
</script>

<div class="photo-wrap">
	<div class="photo-header">
			<h1>상영 시간 등록/삭제</h1>
			<p>각 상영관의 상영시간을 관리하는 페이지 입니다.</p>
		</div>
	
	<div class="photo-body">
		<form id="f">
			<input type="hidden" id="option" name="option">
			<input type="hidden" id="num" name="num">
		</form>
	
		<div id="otpGroup" >
			<button type="button" id="movieBtn" class="my-btn"><span>영화</span></button>
			<button type="button" id="actorBtn" class="my-btn"><span>배우</span></button>
			<button type="button" id="stealBtn" class="my-btn"><span>스틸컷</span></button>
		</div>
	
		<!-- opt선택하면 여기에 필요 정보가 나온다. -->
		<div id="infoList"></div>
		
		<div style="clear: both"></div>
		<button type="button" id="stealcut_del_btn" class="my-btn" style="float: right; margin-right: 105px; margin-top: 20px"><span style="font-size: 10px;">스틸컷 삭제</span></button>
		<div style="clear: both"></div>
		
		<div id="fileUpload" class="dragAndDropDiv">
			<p>여기에 파일을 올려주세요</p>
			<p style="font-size: 15px">이미지 파일(gif, png, jpg, jpeg)만 업로드 가능합니다.</p>
		</div>
	</div>

	
</div>


