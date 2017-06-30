<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.contents-wrap {
	width: 1000px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div class="contents-wrap">
	<h2>MY AGENCY REQUEST</h2>
	<h2>TITLE : ${dto.title }</h2>
	<h2>DIRECTOR : ${dto.director }</h2>
	<h2>PUBDATE : ${dto.pubdate }</h2>
	<h2>AGENCY CERTIFICATE : 
		<img alt="" src="../../resources/upload/agency/${dto.fname }">
	</h2>
	<a href="./agencyList" class="btn btn-info">LIST</a>
	<a href="./agencyUpdate?num=${dto.num }" class="btn btn-info">수정</a>
	<a href="./agencyDelete?num=${dto.num }" class="btn btn-info">삭제</a>
	</div>
</body>
</html>