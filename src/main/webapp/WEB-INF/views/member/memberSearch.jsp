<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/resources/part/bootStrap.jspf" %>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.js"></script>
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member.css">
<title>Insert title here</title>
<script type="text/javascript">

$(function() {	
	$("#id").keyup(function(){
		var id = $(this).value;
		
		$.post("memberQuestionCheck", {
			id: $("#id").val()
		}, function(data) {
			$("#question").html(data);
		})
	})
});

</script>

</head>
<body>
	
	<%@ include file="/resources/part/header1.jspf" %>

	<section>
		<div class="container">
			<h2 class="title">Member Search</h2>
	
			<c:if test="${kind eq 'id'}">
				<form action="memberSearchID" method="POST">
					<table class="member_Table" style="width: 300px">
						<tr>
							<td>NAME</td>
							<td><input type="text" class="form-control" name="name" required="required"></td>
						</tr>

						<tr>
							<td>E-mail</td>
							<td><input type="email" class="form-control" name="email" required="required"></td>
						</tr>

						<tr>
							<td class="name" colspan="2"><button class="btn btn-success">SEARCH</button></td>
						</tr>
					</table>
				</form>
			</c:if>
			
			<c:if test="${kind eq 'password'}">
				<form action="memberSearchPW" method="POST">
					<table class="table table-hover" style="width: 300px">
						<tr>
							<td>ID</td>
							<td><input type="text" class="form-control" name="id" id="id" required="required"></td>
						</tr>
						
						<tr>
							<td>E-mail</td>
							<td><input type="email" class="form-control" name="email" required="required"></td>
						</tr>
						
						<tr>
							<td>QUESTION<td>
							<td><span id="question"></span></td>
						</tr>
						
						<tr>
							<td>ANSWER</td>
							<td><input type="text" class="form-control" name="answer" required="required"></td>
						</tr>
						
						<tr>
							<td class="name" colspan="2"><button class="btn btn-success">SEARCH</button></td>
						</tr>
					</table>
				</form>
			</c:if>
		</div>
	</section>
</body>
</html>