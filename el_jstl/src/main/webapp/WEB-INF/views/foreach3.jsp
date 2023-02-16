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
<%
		String[] name={"배트맨","슈퍼맨","뽀로로","홍길동","헐크","원더우먼"};
		request.setAttribute("name", name);
%>
	<c:forEach var="i" begin="1" end="6" step="1" varStatus="pkc">
		current/${pkc.current} : index/${pkc.index} : count/${pkc.count} : ${name[i]} : begin/${pkc.begin} : end/${pkc.end} : step/${pkc.step} : first/${pkc.first} : last/${pkc.last} <br>
	</c:forEach>
	<hr>
	
	<c:forEach var="nam" items="${name}" varStatus="pkc">
		current/${pkc.current} : index/${pkc.index} : count/${pkc.count} : ${nam} : begin/${pkc.begin} : end/${pkc.end} : step/${pkc.step} : first/${pkc.first} : last/${pkc.last} <br>
	</c:forEach>
	<hr>
	
</body>
</html>