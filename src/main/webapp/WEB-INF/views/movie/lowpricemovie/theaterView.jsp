<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>번호 : ${theater.num }</p>
	<p>극장명 : ${theater.name }</p>
	<p>주소 : ${theater.location }</p>
	<p>가격 : ${theater.price }</p>
	<p>오픈시간 : ${theater.opening_time }</p>
	<p>문의전화 : ${theater.phone }</p>
	
	<c:forEach items="${multiplexList }" var="list">
	<p>${list. name}</p>
	</c:forEach>
</body>
</html>