<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* // page
		$(".go").click(function(){
			var curPage=$(this).attr("id");
			location.href="./movieRequestList?curPage="+curPage;
		}); */
	});
</script>
</head>
<body>
	<div class="container">
		<h2>Movie Request</h2>
		
		<table>
			<tr>
				<td>NUM</td>
				<td>TITLE</td>
				<td></td>
			</tr>	
		</table>
		
		<%-- <!-- 페이징 처리 -->
		<div class="paging">
			<c:if test="${pageResult.curBlock>1}">
				<button class="btn"><span class="go" id="${pageResult.startNum-1}">[이전]</span></button>
			</c:if>
			<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="i">
				<button class="btn"><span class="go" id="${i}">${i}</span></button>
			</c:forEach>
			<c:if test="${pageResult.curBlock<pageResult.totalBlock}">
				<button class="btn"><span class="go" id="${pageResult.lastNum+1}">[다음]</span></button>
			</c:if>
		</div> --%>
		
	</div>
</body>
</html>