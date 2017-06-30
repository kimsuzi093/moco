<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	$(function(){
		$("#savebutton").click(function(){
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
	<h2>AgencyRequest</h2>
	<form action="./agencyRequest" method="post" id="frm" enctype="multipart/form-data">
		<div class="form-group">
			<label>TITLE :</label>
			<input type="text" name="title" class="form-control" placeholder="Enter Title">
		</div>
		<div class="form-group">
			<label>DIRECTOR :</label>
			<input type="text" name="director" value="${memberDTO.name }" readonly="readonly" class="form-control" placeholder="Enter Writer">
		</div>
		<div class="form-group">
			<label>PUBDATE :</label>
			<input type="date" name="pubdate" class="form-control" placeholder="Enter Title">
		</div>
		<div class="form-group">
			<label>CERTIFICATION :</label>
			<input type="file" name="f1" class="form-control">
		</div>

		<input type="button" value="AGENCY REQUEST" id="savebutton">
	</form>
	<a href="../"><button>HOME</button></a>
	</div>
</body>
</html>