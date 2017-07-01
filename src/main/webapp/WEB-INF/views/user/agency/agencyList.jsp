<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
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
<script type="text/javascript">
$(function(){
	$(".go").click(function() {
		curPage = $(this).attr("id");
		location.href = "./agencyList?curPage=" + curPage;
	});
});
</script>
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
	<table class="table table-hover">
	<tr>
		<th>TITLE</th>
		<th>PUBDATE</th>
		<th>COMMIT</th>
	</tr>
	<c:forEach items="${list }" var="dto">
		<%-- <c:if test="${memberDTO.name eq dto.director }"> --%>
			<tr>
			<td><a href="./agencyView?num=${dto.num }">${dto.title }</a></td>
			<td>${dto.pubdate }</td>
			<c:if test="${dto.commit eq 0 }">
			<td>X</td>
			</c:if>
			<c:if test="${dto.commit eq 1 }">
			<td>O</td>
			</c:if>
			</tr>
		<%-- </c:if> --%>
	</c:forEach>
	
	</table>
	<div class="paging">
		<c:if test="${pageResult.curBlock>1 }">
			<button class="btn">
				<span class="go" id="${pageResult.startNum-1}">[이전]</span>
			</button>
		</c:if>
		<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}"
			var="i">
			<button class="btn">
				<span class="go" id="${i}">${i}</span>
			</button>
		</c:forEach>
		<c:if test="${pageResult.curBlock<pageResult.totalBlock}">
			<button class="btn">
				<span class="go" id="${pageResult.lastNum+1}">[다음]</span>
			</button>
		</c:if>
	</div>
		
	<p><a class="btn btn-info" href="./agencyRequest">WRITE</a></p>
	<p><a class="btn btn-info" href="../../">HOME</a></p>
	</div>
</body>
</html>