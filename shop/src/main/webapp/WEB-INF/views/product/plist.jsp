<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table align="center">
	<tr>
		<td>id</td>
		<td>code</td>
		<td>name</td>
		<td>size</td>
		<td>price</td>
		<td>im1</td>
		<td>im2</td>
		<td>im3</td>
	</tr>
<c:forEach items="${plist}" var="pvo">
	<tr>
		<td>${pvo.id }</td>
		<td>${pvo.pCode }</td>
		<td>${pvo.pName }</td>
		<td>${pvo.pSize }</td>
		<td>${pvo.pPrice }</td>
		<td><img src="../resources/pro/${pvo.pImg1 }" width="100" height="100"></td>
		<td><img src="../resources/pro/${pvo.pImg2 }" width="100" height="100"></td>
		<td><img src="../resources/pro/${pvo.pImg3 }" width="100" height="100"></td>
	</tr>
</c:forEach>
</table>
</body>
</html>