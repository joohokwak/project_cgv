<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery library -->
<link rel="stylesheet" type="text/css" href="/resources/css/photo/photo.css" />
<style type="text/css">
	#otpGroup{
		border: 1px solid black;
		width: 200px;
		height: 100px;
		padding: 20px;
	}
	
	#infoList{
		border: 1px solid black;
		width: 500px;
		min-height: 200px;
		margin: 10px;
		padding: 10px;
	}

	.info{
		border: 1px solid black;
		margin: 10px;
		padding: 10px; 
		height:50px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

    $(function(){
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
          
         function handleFileUpload(files,obj)
         {
        	
            $("#fileUpload").nextAll().remove();
            for (var i = 0; i < files.length; i++) 
            {
            	alert("진입?")
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
        	$("#option").val($(this).text());
        	$("#num").val("");
        	var opt = $(this).attr("id");
        	var list = $("#infoList");
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
					$(data).each(function(){
						var infoDiv = $("<div>");
        				infoDiv.attr("class","info").data("num",this.m_num);
						infoDiv.text(this.m_title1);
						infoDiv.appendTo("#infoList");
					});
					$(".info").click(function(e) {
						$("#num").val($(this).data("num"));
					});
        		}
        	});
         });
         
         function check(){
        	 if($("#option").val() == "" || $("#num").val() == ""){
        		 alert("옵션을 선택하세요!");
        		 return false;
        	 }else{
	        	 return;
        	 }
         }
    });///////////////////////////////////
</script>


</head>
<body>
<!-- 
	영화 포스터, 배우 얼굴, 스틸컷
	옵션을 버튼으로 선택하자.

	버튼을 클릭하면
	필요한 정보를 List로 받아옴(ajax)
	
	파일을 드롭했을 때 유효성 체크를 하고 이상이 없으면
	옵션, List에서 선택된 정보, 파일들을 보내줌.
 -->

<form id="f">
	<input type="text" id="option" name="option">
	<input type="text" id="num" name="num">
</form>
 
<div id="uploadWrap">
	<div id="otpGroup">
		<button type="button" id="movieBtn">영화</button>
		<button type="button" id="actorBtn">배우</button>
		<button type="button" id="stealBtn">스틸컷</button>
	</div>
	
	<!-- opt선택하면 여기에 필요 정보가 나온다. -->
	<div id="infoList" style="border: 1px solid black;"></div>
	<button type="button" id="test">테스트</button>

	<div id="fileUpload" class="dragAndDropDiv">Drag & Drop Files Here</div>
</div>

</body>
</html>