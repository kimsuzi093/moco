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
<title>Insert title here</title>
<title>Insert title here</title>
<script type="text/javascript">

$(function() {
	$("#select").click(function(){
		var select = $(this).value;

		if(select == "phone") {
			var result = 'PHONE<input type="text" class="form-control" name="search" required="required">';
		} else {
			var result = 'E-mail<input type="email" class="form-control" name="search" required="required">';
		}
		$("#choice").html(result);
	})
	
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
	<h2>Member Search</h2>
	<c:if test="${kind eq 'id'}">
	<form action="memberSearchID" method="POST">
		<table class="table table-hover" style="width: 300px">
			<tr>
				<td>NAME<input type="text" class="form-control" name="name" required="required"></td>
			</tr>
			
			<tr>
				<td>인증수단<select name="select" id="select">
					<option value="phone" selected="selected">PHONE</option>
					<option value="email">EMAIL</option>
				</select></td>
			</tr>
			
			<tr>
				<td><span id="choice">PHONE<input type="text" class="form-control" name="search" required="required"></span></td>
			</tr>
		</table>
		<button>OK</button>
		<input type="button" id="btn1" class="btn btn-success" value="SEARCH">
	</form>
	</c:if>
	
	<c:if test="${kind eq 'password'}">
	<form action="memberSearchPW" method="POST">
		<table class="table table-hover" style="width: 300px">
			<tr>
				<td>ID<input type="text" class="form-control" name="id" id="id" required="required"></td>
			</tr>
			
			<tr>
				<td>E-mail<input type="email" class="form-control" name="email" required="required"></td>
			</tr>
			
			<tr>
				<td>QUESTION<br>
					<span id="question"></span>
				</td>
			</tr>
			
			<tr>
				<td>ANSWER<br>
					<input type="text" class="form-control" name="answer" required="required">
				</td>
			</tr>
		</table>
		<button>OK</button>
	</form>
	</c:if>
	
	</section>
	
	<%@ include file="/resources/part/footer.jspf" %>
</body>
</html>