<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	.form{
		float: right;
	}
	.form2{
		margin-left: 970px;
		margin-bottom: 20px;
	}
	.seasonFormSpan{
		font-size: 1.2em;
	}
</style>
</head>
<body>
<div class="container">	
	<h2 style="text-align: center;">UserBoard List</h2>
	<br>
	<div class="form">
		<form action="./userBoardList" id="searchForm">
			<table>
				<tr>
					<td>
						<select name="kind" class="form-control" style="width: 100px;">
							<option value="title">TITLE</option>
							<option value="writer">WRITER</option>
							<option value="genre">GENRE</option>
						</select>						
					</td>
					<td>
						<input type="text" name="search" class="form-control" style="width: 150px;">
						<input type="hidden" name="curPage" value="1">
					</td>
					<td>
						<input type="button" value="Search" id="search" class="btn">
					</td>
				</tr>
			</table>				
		</form>
		<br>
	</div>
	<div class="form2">
		<form action="./userBoardList" id="seasonForm">
			<table>
				<tr>
					<td>
						<span class="seasonFormSpan">SEASON</span>
					</td>
					<td>
						<select name="season" id="season" class="form-control" style="width: 100px;">
							<option value="all">ALL</option>
							<c:forEach items="${orderList}" var="order">
								<option value="${order.season}">${order.season}</option>
							</c:forEach>
						</select>
						<input type="hidden" name="curPage" value="1">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<table class="table table-hover">
		<tr>
			<td>NUM</td>
			<td>TITLE</td>
			<td>WRITER</td>
			<td>GENRE</td>
			<td>DATE</td>
			<td>HIT</td>
			<td>LIKES</td>
			<td>SEASON</td>
		</tr>
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
		<a href="../../"><button class="btn">HOME</button></a>
		<c:if test="${seasonCheck && memberDTO != null}">
			<a href="./userBoardWrite"><button class="btn">WRITE</button></a>
		</c:if>
	</div>
</div>
</body>
</html>