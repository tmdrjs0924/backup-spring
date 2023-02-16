<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
</head>
<body>
	<a href="data1?name=홍길동&juso=서울&phone=010-1234-5678"> data1 </a> <p>
	<form method="post" action="data1">
		이름 <input type="text" name="name"> <br>
		주소 <input type="text" name="juso"> <br>
		연락처 <input type="text" name="phone"> <br>
		<input type="submit" value="data1">
	</form>
	<hr>
	<a href="data2?name=홍길동&juso=서울"> data2 </a>
	<hr>
	<a href="data3?name=홍길동&juso=서울"> data3 </a>
	<hr>
	<a href="data4?name=홍길동&juso=서울&phone=010-1234-1234&age=33"> data4 </a>
	<hr>
	<a href="data5/배트맨/22/USA"> data5 </a>
</body>
</html>
