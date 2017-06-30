<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../../resources/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
	$(function(){
		var editor_object = [];
	     
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: editor_object,
	        //textarea ID
	        elPlaceHolder: "contents",
	        sSkinURI: "../../resources/SE2/SmartEditor2Skin.html", 
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,             
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,     
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true, 
	        }
	    });
	    
		$("#write").click(function(){
			editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
			
			$("#frm").submit();
		});
	});
</script>
<style type="text/css">
	.contents-wrap{
	width:1000px;
	margin:0 auto;
	}
</style>
</head>
<body>
	<div class="contents-wrap">
	<h2>ActorPR APPLY</h2>
	<form action="actorPRWrite" method="post" id="frm" enctype="multipart/form-data">
		<div class="form-group">
			<label>TITLE :</label>
			<input type="text" name="title" class="form-control" placeholder="Enter Title">
		</div>
		<div class="form-group">
			<label>WRITER :</label>
			<input type="text" name="writer" value="${memberDTO.name}" readonly="readonly" class="form-control" placeholder="Enter Writer">
		</div>
		
		<div class="form-group">
			<label>CONTENTS :</label>
			<textarea id="contents" name="contents" class="form-control" style="height: 300px; width: 995px;" placeholder="Enter Contents"></textarea>
			
		</div>
		
		<div class="form-group">
			<label>VIDEO :</label>
			<input type="file" name="f1" class="form-control">
		</div>
		
		<div class="form-group">
			<label>SEASON :</label>	
			<input type="text" name="season" value="${season }" readonly="readonly" class="form-control">
		</div>
		
		<input type="button" value="go" id="write">
		
	</form>
	</div>
</body>
</html>