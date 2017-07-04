<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/resources/part/bootStrap.jspf" %>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.js"></script>
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		
		// 시즌
		$("#season").change(function() {
			var season = $("#season").val();
			alert(season);
			$("#seasonForm").submit();
		});
		
		// 검색
		$("#search").click(function() {
			$("#searchForm").submit();
		});
		
		// page
		$(".go").click(function(){
			var curPage=$(this).attr("id");
			location.href="./userBoardList?curPage="+curPage+"&kind=${map.kind}&search=${map.search}&season=${map.season}";
		});
		
	});
</script>
<style type="text/css">
.container {
	padding: 10px;
}

.search_left {
	width: 200px;
	float: left;
}

.search_right {
	width: 380px;
	float: right;
}

table {
	margin: 10px 0;
}

tr.head {
	background-color: #ff6600;
	color: white;
	font-size: 16px;
	font-weight: bold;
	border-top: solid black 2px;
	border-bottom: solid black 2px;
}

td {
	padding: 10px;
}


.paging{
	text-align: center;	
}

.go{
	font-size : 1.2em;
	cursor: pointer;
}

.btnBox{
	text-align: right;
}
</style>
</head>
<body>
	<%@ include file="/resources/part/header2.jspf" %>
	<section>
		<div class="container">
			<h2 style="text-align: center;">UserBoard List</h2>
		
			<div class="search_left">
				<form class="form-horizontal" action="./userBoardList" id="seasonForm">
					<table>
						<tr>
							<td>SEASON</td>
							<td>
								<select name="season" class="form-control" id="season">
									<option value="all">ALL</option>
									<c:forEach items="${orderList}" var="order">
										<option value="${order.season}">${order.season}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</table>
					<input type="hidden" name="curPage" value="1">
				</form>
			</div>
		
			<div class="search_right">
				<form action="./userBoardList" id="searchForm">
					<table>
						<tr>
							<td>
								<select name="kind" class="form-control col-sm-5">
									<option value="title">TITLE</option>
									<option value="writer">WRITER</option>
									<option value="genre">GENRE</option>
								</select>						
							</td>
							<td>
								<input type="text" name="search" class="form-control col-sm-5">
								<input type="hidden" name="curPage" value="1">
							</td>
							<td>
								<input type="button" value="Search" id="search" class="btn">
							</td>
						</tr>
					</table>				
				</form>
			</div>
		
			<table class="table table-hover">
				<thead>
					<tr class="head">
						<td>NUM</td>
						<td>TITLE</td>
						<td>WRITER</td>
						<td>GENRE</td>
						<td>DATE</td>
						<td>HIT</td>
						<td>LIKES</td>
						<td>SEASON</td>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.num}</td>
							<td><a href="./userBoardView?num=${dto.num}&commit=${dto.commit}">${dto.title}</a></td>
							<td>${dto.writer}</td>
							<td>${dto.genre}</td>
							<td>${dto.reg_date}</td>
							<td>${dto.hit}</td>
							<td>${dto.likes}</td>
							<td>${dto.season}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- 페이징 처리 -->
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
			</div>
			
			<!-- BTN -->
			<div class="btnBox">
				<c:if test="${seasonCheck && memberDTO != null}">
					<a href="./userBoardWrite"><button class="btn">WRITE</button></a>
				</c:if>
			</div>
		</div>
	</section>
</body>
</html>