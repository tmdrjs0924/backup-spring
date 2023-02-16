<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="i"	begin="1" end="10" step="1">
	오늘은 금요일입니다<br>
	</c:forEach>
	<hr>
	
	<select name="year">
	<c:forEach var="i" begin="1900" end="2023" step="1">
		<option>${i}</option>
	</c:forEach>
	</select>
	<select name="year">
	<c:forEach var="i" begin="0" end="123" step="1">
		<option>${2023-i}</option>
	</c:forEach>
	</select>
</body>
</html>