<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="theaterRequest" method="post">
	극장명 <input type="text" name="name"><br>
	주소 <input type="text" name="location"><br>
	상세주소 <input type="text" name="detailLocation"><br>
	문의전화 <input type="text" name="phone"><br>
	가격 <input type="number" name="price"><br>
	오픈 시간 <input type="text" name="opening_time" placeholder="ex) 13:00"><br>
	<input type="hidden" name="commit" value="0">
	
	--------상영관-------<br>
	상영관명 <input type="text" name="multi_name"><br>
	총 좌석수 <input type="number" name="totalseat"><br>
	
	<button>request</button>
	</form>
	
</body>
</html>