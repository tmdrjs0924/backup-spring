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
	<table align="center">
		<c:forEach items="${list}" var="tdto">
			<tr align="center">
				<td><img src="img/${tdto.fname}" width="100"></td>
				<td width="500">${tdto.title}</td>
				<td width="100">${tdto.writeday}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>