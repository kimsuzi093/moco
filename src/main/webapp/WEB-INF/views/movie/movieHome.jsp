<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/resources/part/bootStrap.jspf" %>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.js"></script>
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/resources/part/header1.jspf" %>
	<section>
		<h2>movieHome</h2>
		<p><a href="./basicMovieSearch/movieSearchHome">basicMovieSearch</a></p>
		<p><a href="./lowpricemovie/lowpricemovieList">lowpricemovieList</a></p>
		<p><a href="./movieSchedule/movieScheduleTable">movieSchedule</a></p>
	</section>
</body>
</html>